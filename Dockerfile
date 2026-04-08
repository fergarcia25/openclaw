FROM ghcr.io/openclaw-ai/openclaw:latest

# Hugging Face Spaces expone el puerto 7860
ENV PORT=7860
ENV OPENCLAW_GATEWAY_PORT=7860

# Variables de entorno (se inyectan desde HF Secrets)
ENV ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
ENV OPENCLAW_GATEWAY_TOKEN=${OPENCLAW_GATEWAY_TOKEN}

# Directorio de datos persistentes
WORKDIR /data

EXPOSE 7860

CMD ["openclaw", "gateway", "start", "--port", "7860"]
