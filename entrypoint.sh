#!/bin/sh
set -e

CONFIG_DIR="/home/node/.openclaw"
CONFIG_FILE="$CONFIG_DIR/openclaw.json"

mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "[entrypoint] Generando openclaw.json..."
  cat > "$CONFIG_FILE" << JSONEOF
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
  "models": {
    "providers": [
      {
        "type": "anthropic",
        "label": "anthropic",
        "apiKey": "${ANTHROPIC_API_KEY}"
      }
    ],
    "default": "claude-sonnet-4-20250514"
  },
  "agents": {
    "defaults": {
      "model": "claude-sonnet-4-20250514"
    }
  }
}
JSONEOF
  echo "[entrypoint] openclaw.json generado."
else
  echo "[entrypoint] openclaw.json ya existe, omitiendo."
fi

echo "[entrypoint] Iniciando gateway en puerto 7860..."
exec openclaw gateway --port 7860 --bind lan --allow-unconfigured
