---
title: OpenClaw Gateway
emoji: 🦀
colorFrom: purple
colorTo: blue
sdk: docker
app_port: 7860
pinned: false
---

# OpenClaw Gateway en Hugging Face Spaces

Gateway personal de OpenClaw corriendo con Claude (Anthropic) como modelo principal.

## Canales conectados
- ✅ UI Web (puerto 7860)
- ✅ WhatsApp (via integración externa)

## Variables de entorno requeridas

Configúralas en **Settings → Variables and Secrets** de tu Space:

| Variable | Descripción |
|---|---|
| `OPENCLAW_GATEWAY_TOKEN` | Token de acceso al gateway (tú lo defines) |
| `ANTHROPIC_API_KEY` | API key de Anthropic Console |

> ⚠️ Nunca escribas estas claves directamente en el código.
