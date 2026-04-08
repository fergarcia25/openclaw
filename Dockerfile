FROM alpine/openclaw:latest

# Hugging Face Spaces requiere puerto 7860
EXPOSE 7860

# Variables de entorno inyectadas desde HF Secrets
ENV ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
ENV OPENCLAW_GATEWAY_TOKEN=${OPENCLAW_GATEWAY_TOKEN}

# Copiar entrypoint con permisos de ejecución directamente (sin necesitar chmod)
COPY --chmod=755 entrypoint.sh /home/node/entrypoint.sh

ENTRYPOINT ["/home/node/entrypoint.sh"]
