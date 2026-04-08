FROM alpine/openclaw:latest

# Hugging Face Spaces requiere puerto 7860
EXPOSE 7860

# Variables de entorno inyectadas desde HF Secrets
ENV ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
ENV OPENCLAW_GATEWAY_TOKEN=${OPENCLAW_GATEWAY_TOKEN}

# Copiar el script de arranque
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Usar el entrypoint que preconfigurar openclaw.json antes de arrancar
ENTRYPOINT ["/entrypoint.sh"]
