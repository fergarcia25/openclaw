FROM alpine/openclaw:latest

# Instalar Nginx para proxy WebSocket
USER root
RUN apt-get update && apt-get install -y --no-install-recommends nginx && \
    rm -rf /var/lib/apt/lists/*
USER node

# Puerto público que expone HF Spaces
EXPOSE 7860

# Secrets inyectados desde Hugging Face
ENV ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
ENV OPENCLAW_GATEWAY_TOKEN=${OPENCLAW_GATEWAY_TOKEN}

# Copiar configuraciones
COPY --chmod=755 entrypoint.sh /home/node/entrypoint.sh
COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["/home/node/entrypoint.sh"]
