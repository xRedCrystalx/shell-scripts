const http = require('http');
const fs = require('fs').promises;
const fsSync = require('fs');
const path = require('path');

const CONFIG = {
  HOST: process.env.HOST || '0.0.0.0',
  PORT: process.env.PORT || 3000,
  PUBLIC_DIR: path.join(__dirname, 'public'),
  MIME_TYPES: {
    '.sh': 'text/x-shellscript',
    '.bash': 'text/x-shellscript',
    '.ps1': 'text/plain',
    '.bat': 'text/plain',
    '.py': 'text/x-python',
    '.js': 'text/javascript',
    '.txt': 'text/plain',
    '.md': 'text/markdown',
    '.html': 'text/html',
    '.json': 'application/json',
    '.css': 'text/css'
  }
};


function isPathInside(base, target) {
  const resolvedBase = path.resolve(base);
  const resolvedTarget = path.resolve(target);

  return resolvedTarget === resolvedBase ||
         resolvedTarget.startsWith(resolvedBase + path.sep);
}

function getMimeType(filePath) {
  const ext = path.extname(filePath).toLowerCase();
  return CONFIG.MIME_TYPES[ext] || 'application/octet-stream';
}


function generateDirectoryHTML(pathname, files) {
  const relativePath = pathname === '/' ? '/' : pathname;

  const header = `

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Index of ${relativePath}</title>
<style>
:root {
  --bg: #0f1117;
  --panel: #161b22;
  --border: #2a2f3a;
  --text: #e6edf3;
  --muted: #9da7b3;
  --accent: #58a6ff;
}

* { box-sizing: border-box; }

body {
  margin: 0;
  padding: 40px 16px;
  background: var(--bg);
  color: var(--text);
  font-family: system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
}

.container {
  max-width: 900px;
  margin: 0 auto;
}

h1 {
  font-size: 22px;
  margin-bottom: 6px;
  font-weight: 600;
}

.path {
  color: var(--muted);
  font-size: 14px;
  margin-bottom: 20px;
}

.list {
  background: var(--panel);
  border: 1px solid var(--border);
  border-radius: 12px;
  overflow: hidden;
}

.item {
  display: flex;
  align-items: center;
  padding: 12px 16px;
  border-bottom: 1px solid var(--border);
  transition: background 0.15s ease;
}

.item:last-child {
  border-bottom: none;
}

.item:hover {
  background: rgba(255,255,255,0.03);
}

.type {
  width: 70px;
  font-size: 12px;
  text-transform: uppercase;
  letter-spacing: .04em;
  color: var(--muted);
  flex-shrink: 0;
}

.name a {
  color: var(--accent);
  text-decoration: none;
  word-break: break-all;
}

.name a:hover {
  text-decoration: underline;
}

.back .type {
  color: #f2a365;
}
</style>
</head>
<body>
  <div class="container">
    <h1>Index of ${relativePath}</h1>
    <div class="path">${relativePath}</div>
    <div class="list">
`;

  const items = [];

  if (pathname !== '/') {
    const parent = path.posix.dirname(pathname);
    items.push(`
      <div class="item back">
        <div class="type">UP</div>
        <div class="name"><a href="${parent}">..</a></div>
      </div>
    `);
  }

  const dirs = files
    .filter(f => f.isDirectory())
    .sort((a, b) => a.name.localeCompare(b.name));
  
  const regularFiles = files
    .filter(f => f.isFile())
    .sort((a, b) => a.name.localeCompare(b.name));

  for (const dir of dirs) {
    const itemPath = path.posix.join(pathname, dir.name);
    items.push(`
      <div class="item">
        <div class="type">DIR</div>
        <div class="name"><a href="${itemPath}">${dir.name}/</a></div>
      </div>
    `);
  }

  for (const file of regularFiles) {
    const itemPath = path.posix.join(pathname, file.name);
    items.push(`
      <div class="item">
        <div class="type">FILE</div>
        <div class="name"><a href="${itemPath}">${file.name}</a></div>
      </div>
    `);
  }

  const footer = `
    </div>
  </div>
</body>
</html>`;

  return header + items.join('') + footer;
}


async function showDirectory(filePath, pathname, res) {
  try {
    const files = await fs.readdir(filePath, { withFileTypes: true });
    const html = generateDirectoryHTML(pathname, files);
    
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end(html);
  } 
  catch (error) {
    console.error('Error reading directory:', error);
    await showError(res, 500, '500 Internal Server Error');
  }
}

async function showFile(filePath, res) {
  try {
    const data = await fs.readFile(filePath);
    const mimeType = getMimeType(filePath);
    
    res.writeHead(200, { 'Content-Type': mimeType });
    res.end(data);

  } 
  catch (error) {
    console.error('Error reading file:', error);
    await showError(res, 500, '500 Internal Server Error');
  }
}

async function showError(res, statusCode, message) {
  res.writeHead(statusCode, { 'Content-Type': 'text/plain' });
  res.end(message);
}



async function handleRequest(req, res) {
  const urlObj = new URL(req.url, `http://${req.headers.host}`);
  const pathname = decodeURIComponent(urlObj.pathname);

  console.log(`[${new Date().toISOString()}] ${req.method} ${pathname}`);

  const fullPath = path.join(CONFIG.PUBLIC_DIR, pathname);

  // block traversal
  if (!isPathInside(CONFIG.PUBLIC_DIR, fullPath)) {
    console.warn('Blocked traversal:', fullPath);
    return showError(res, 403, '403 Forbidden');
  }
  // Construct full file path

  try {
    const stats = await fs.stat(fullPath);

    if (stats.isDirectory()) {
      await showDirectory(fullPath, pathname, res);
    } 
    
    else if (stats.isFile()) {
      await showFile(fullPath, res);
    } 
    
    else {
      await showError(res, 404, '404 Not Found');
    }
  } 
  
  catch (error) {
    if (error.code === 'ENOENT') {
      console.warn(`File not found: ${pathname}`);
      await showError(res, 404, '404 Not Found');
    } 
    else {
      console.error('Unexpected error:', error);
      await showError(res, 500, '500 Internal Server Error');
    }
  }
}


function startServer() {
  if (!fsSync.existsSync(CONFIG.PUBLIC_DIR)) {
    fsSync.mkdirSync(CONFIG.PUBLIC_DIR, { recursive: true });
  }

  const server = http.createServer(async (req, res) => {
    await handleRequest(req, res)
      .catch(async error => {
          console.error('Unhandled error in request handler:', error);
          if (! res.headersSent) {
            await showError(res, 500, '500 Internal Server Error');
          }
      });
  });

  server.listen(CONFIG.PORT, () => {
    console.log(`Server running at http://${CONFIG.HOST}:${CONFIG.PORT}/`);
    console.log(`Serving files from: ${CONFIG. PUBLIC_DIR}`);
    console.log(`Started at:  ${new Date().toLocaleString()}`);

  });
}

startServer();