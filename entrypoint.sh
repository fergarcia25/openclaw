#!/bin/sh
set -e

CONFIG_DIR="/home/node/.openclaw"
CONFIG_FILE="$CONFIG_DIR/openclaw.json"

mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "[entrypoint] Generando openclaw.json..."

  cat > "$CONFIG_FILE" << EOF
{
  "gateway": {
    "mode": "local",
    "port": 7860,
    "bind": "lan",
    "auth": {
      "mode": "token",
      "token": "${OPENCLAW_GATEWAY_TOKEN}"
    }
  },
  "env": {
    "ANTHROPIC_API_KEY": "${ANTHROPIC_API_KEY}"
  },
  "agents": {
    "defaults": {
      "model": {
        "primary": "anthropic/claude-sonnet-4-6"
      }
    }
  }
}
EOF

  echo "[entrypoint] openclaw.json generado."
else
  echo "[entrypoint] openclaw.json ya existe, omitiendo."
fi

echo "[entrypoint] Iniciando gateway en puerto 7860..."
exec openclaw gateway --port 7860 --bind lan --allow-unconfigured
