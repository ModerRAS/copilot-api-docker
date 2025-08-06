FROM node:lts
WORKDIR /app

RUN npm install -g copilot-api@latest

EXPOSE 4141

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget --spider -q http://localhost:4141/ || exit 1

ENTRYPOINT ["copilot-api"]
CMD ["start"]
