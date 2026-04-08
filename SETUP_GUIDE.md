# 🚀 Guía de Setup: OpenClaw en Hugging Face Spaces

## Estructura del repositorio

```
tu-repo/
├── Dockerfile          ← imagen del contenedor
├── openclaw.json       ← configuración de OpenClaw
├── README.md           ← cabecera del Space (con bloque ---)
└── .gitignore          ← protege tus secretos
```

---

## PASO 1 — Obtén tu ANTHROPIC_API_KEY

1. Ve a https://console.anthropic.com
2. Inicia sesión → **API Keys** → **Create Key**
3. Copia la clave (empieza con `sk-ant-...`)

---

## PASO 2 — Define tu OPENCLAW_GATEWAY_TOKEN

Este token lo **inventas tú**. Es la contraseña de acceso a tu gateway.
Genera una cadena segura en tu terminal:

```bash
# En Mac/Linux:
openssl rand -hex 32

# En Windows (PowerShell):
[System.Web.Security.Membership]::GeneratePassword(40, 5)
```

Guarda ese valor — lo usarás en el siguiente paso.

---

## PASO 3 — Crea el Space en Hugging Face

1. Ve a https://huggingface.co/spaces
2. Clic en **Create new Space**
3. Configura:
   - **Space name**: el nombre que quieras (ej: `mi-openclaw`)
   - **SDK**: selecciona **Docker**
   - **Visibility**: Private (recomendado)
4. En **"Repository"**, vincula tu repo de GitHub:
   - Clic en **"Link GitHub repository"**
   - Autoriza Hugging Face en GitHub
   - Selecciona tu repositorio

---

## PASO 4 — Agrega los Secrets en Hugging Face

En tu Space → **Settings** → **Variables and Secrets**:

| Nombre | Valor |
|---|---|
| `OPENCLAW_GATEWAY_TOKEN` | la cadena que generaste en el Paso 2 |
| `ANTHROPIC_API_KEY` | tu key de Anthropic (`sk-ant-...`) |

⚠️ Usa **Secrets** (no Variables) para que queden ocultos.

---

## PASO 5 — Sube los archivos desde VS Code

```bash
# En tu terminal de VS Code, dentro de tu repo:
git add .
git commit -m "feat: setup inicial OpenClaw"
git push origin main
```

Hugging Face detecta el push automáticamente y redeploya el Space. 🎉

---

## PASO 6 — Verifica que funciona

Una vez que el Space esté en estado **Running**:

1. Abre la URL de tu Space: `https://huggingface.co/spaces/TU_USUARIO/mi-openclaw`
2. Deberías ver la UI de OpenClaw
3. Inicia sesión con tu `OPENCLAW_GATEWAY_TOKEN`

---

## WhatsApp — Integración

OpenClaw no se conecta directamente a WhatsApp. Necesitas una de estas opciones:

### Opción A — Twilio (recomendada, tiene plan gratuito)
1. Crea cuenta en https://twilio.com
2. Activa **WhatsApp Sandbox**
3. En tu `openclaw.json`, agrega el webhook de Twilio apuntando a tu Space
4. Twilio enviará los mensajes de WhatsApp a tu gateway

### Opción B — WhatsApp Business API (producción)
- Requiere cuenta Meta Business verificada
- Más estable para uso a largo plazo

---

## Flujo de deploy automático

```
VS Code → git push → GitHub → Hugging Face (auto-redeploy)
     ↑                                    ↓
  tus cambios                      Space se reinicia
```

Cada `git push` a `main` dispara un redeploy automático en ~2-3 minutos.

---

## Comandos útiles de OpenClaw (para depuración local)

```bash
# Ver el token actual del gateway
openclaw config get gateway.auth.token

# Generar un nuevo token
openclaw doctor --generate-gateway-token

# Ver estado de los modelos
openclaw models status

# Configurar API key de Anthropic
openclaw onboard
```
