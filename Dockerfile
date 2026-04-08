FROM alpine/openclaw:latest

# Hugging Face Spaces requiere el puerto 7860
EXPOSE 7860

# Variables de entorno (se inyectan desde HF Secrets)
ENV ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
ENV OPENCLAW_GATEWAY_TOKEN=${OPENCLAW_GATEWAY_TOKEN}

# Directorio de datos persistentes
WORKDIR /data

# Comando correcto: "openclaw gateway" con --port y --bind lan (para aceptar tráfico externo)
CMD ["openclaw", "gateway", "--port", "7860", "--bind", "lan"]
