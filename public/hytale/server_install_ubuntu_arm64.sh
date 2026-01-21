#!/usr/bin/env bash

## THIS SCRIPT WAS BUILT BY xRedCrystalx

### ===== CONFIG =====
HYTALE_USER="hytale"
HYTALE_DIR="/opt/hytale-server"
SERVICE_FILE="$HYTALE_DIR/hytale.service"

JAVA_BIN="/usr/bin/java"
SERVER_JAR="HytaleServer.jar"
ASSETS_ZIP="Assets.zip"
### ==================


if [[ $EUID -ne 0 ]]; then
  echo "! This script must be run as root !"
  exit 1
fi

echo "=== Installing required packages ==="
apt update
apt install -y wget apt-transport-https gpg ufw zip ca-certificates

echo "=== Creating user and directories ==="
if ! id "$HYTALE_USER" &>/dev/null; then
  adduser --system --group --home "$HYTALE_DIR" --shell /usr/sbin/nologin "$HYTALE_USER"
fi

mkdir -p "$HYTALE_DIR"
chown -R root:$HYTALE_USER "$HYTALE_DIR"
chmod -R 770 "$HYTALE_DIR"


echo "=== Installing Temurin JDK 25 ==="
if [[ ! -f /etc/apt/trusted.gpg.d/adoptium.gpg ]]; then
  wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor -o /etc/apt/trusted.gpg.d/adoptium.gpg
fi

CODENAME="$(awk -F= '/^UBUNTU_CODENAME/{print $2}' /etc/os-release)"
echo "deb https://packages.adoptium.net/artifactory/deb $CODENAME main" > /etc/apt/sources.list.d/adoptium.list

apt update
apt install temurin-25-jdk -y

echo "=== Downloading Hytale server downloader ==="
wget -O hytale-downloader.zip https://downloader.hytale.com/hytale-downloader.zip
unzip -o hytale-downloader.zip

chmod +x hytale-downloader-linux-arm64

echo "!!! Hytale downloader requires authentication. !!!"
echo "You will be prompted, follow the instructions."

./hytale-downloader-linux-arm64 -download-path "$HYTALE_DIR/server.zip"
unzip "$HYTALE_DIR/server.zip" -d "$HYTALE_DIR"
rm "$HYTALE_DIR/server.zip"

echo "=== Creating systemd service (server auto start) ==="
cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=Startup script for Hytale server
After=network.target

[Service]
User=$HYTALE_USER
WorkingDirectory=$HYTALE_DIR
ExecStart=$JAVA_BIN -jar $HYTALE_DIR/Server/$SERVER_JAR --assets $HYTALE_DIR/$ASSETS_ZIP
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable "$HYTALE_DIR/hytale.service"

echo "=== Configuring firewall (UFW) ==="
ufw default deny incoming
ufw default allow outgoing
ufw allow 5520/udp
ufw --force enable

echo "=== DONE ==="
echo "Start/stop the server with:"
echo "  systemctl start|stop hytale"
echo "Check logs with:"
echo "  journalctl -u hytale -f"

echo "Server files are located in [$HYTALE_DIR] and will be run as user [$HYTALE_USER]"
echo "You may need to edit server properties and EULA before first start."
echo "Start this server as [$HYTALE_USER] user first"
echo "-> su - $HYTALE_USER -s /bin/bash"
echo "-> $JAVA_BIN -jar $HYTALE_DIR/Server/$SERVER_JAR --assets $HYTALE_DIR/$ASSETS_ZIP"
echo "then authenticate it with "/auth login device" command and then /auth persistence Encrypted"