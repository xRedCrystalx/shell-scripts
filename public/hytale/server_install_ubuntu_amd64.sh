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
apt install -y wget apt-transport-https gpg ufw zip ca-certificates tmux

echo "=== Installing Temurin JDK 25 ==="
if [[ ! -f /etc/apt/trusted.gpg.d/adoptium.gpg ]]; then
  wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor -o /etc/apt/trusted.gpg.d/adoptium.gpg
fi

CODENAME="$(awk -F= '/^UBUNTU_CODENAME/{print $2}' /etc/os-release)"
echo "deb https://packages.adoptium.net/artifactory/deb $CODENAME main" > /etc/apt/sources.list.d/adoptium.list

apt update
apt install temurin-25-jdk -y

echo "=== Creating user and directories ==="
if ! id "$HYTALE_USER" &>/dev/null; then
  adduser --system --group --home "$HYTALE_DIR" --shell /usr/sbin/nologin "$HYTALE_USER"
fi

mkdir -p "$HYTALE_DIR"

echo "=== Downloading Hytale server downloader ==="
wget -O hytale-downloader.zip https://downloader.hytale.com/hytale-downloader.zip
unzip -o hytale-downloader.zip

chmod +x hytale-downloader-linux-amd64

echo "!!! Hytale downloader requires authentication. !!!"
echo "You will be prompted, follow the instructions."

./hytale-downloader-linux-amd64 -download-path "$HYTALE_DIR/server.zip"
unzip "$HYTALE_DIR/server.zip" -d "$HYTALE_DIR"
rm "$HYTALE_DIR/server.zip"

# Service file
echo "=== Creating services, commands and motd ==="
cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=Startup script for Hytale server
After=network.target

[Service]
User=$HYTALE_USER
Type=forking
WorkingDirectory=$HYTALE_DIR
Environment='SHELL=/bin/bash'
ExecStart=/usr/bin/tmux new -d -s hytale '$JAVA_BIN -jar $HYTALE_DIR/Server/$SERVER_JAR --assets $HYTALE_DIR/$ASSETS_ZIP'
ExecStop=/usr/bin/tmux kill-session -t hytale
Restart=no

[Install]
WantedBy=multi-user.target
EOF

tee /usr/local/bin/hytale-console > /dev/null <<EOF
#!/bin/bash
echo "Attaching to Hytale console... (Press Ctrl+B, then D to detach)"
runuser -u hytale -- tmux attach -t hytale
EOF

tee /etc/motd > /dev/null <<EOF

=========================================================
                 HYTALE SERVER MANAGEMENT                
=========================================================
Server files are located in [$HYTALE_DIR] and will be run as user [$HYTALE_USER]

To manage the server, use the following commands:

  Start server:   systemctl start hytale (server will automatically start on boot)
  Stop server:    systemctl stop hytale
  Restart server: systemctl restart hytale
  View status:    systemctl status hytale

To access the live server console:
  Run:            hytale-console
  To exit:        Press Ctrl+B, let go, then press D

Note:
You will have to authenticate the server with "/auth login device" command and then "/auth persistence Encrypted" on first start.

=========================================================
EOF

echo "=== Configuring firewall (UFW) ==="
ufw default deny incoming
ufw default allow outgoing
ufw allow 5520/udp
ufw allow 20/tcp
ufw enable

echo "=== Finishing up ==="
chown -R $HYTALE_USER:$HYTALE_USER "$HYTALE_DIR"
chmod -R 770 "$HYTALE_DIR"
chmod +x /usr/local/bin/hytale-console

systemctl daemon-reload
systemctl enable "$HYTALE_DIR/hytale.service"

echo "Rebooting... this might take a minute."
reboot