# Optional local stdio bridge for the hosted Flowsimp MCP server.
# The server itself runs at https://flowsimp.com/mcp (Streamable HTTP, no auth).
# This image only forwards a stdio MCP session to that endpoint, for clients
# that cannot connect to remote servers directly.
FROM node:22-alpine

RUN npm install --global --no-audit --no-fund mcp-remote@0.16.0 \
    && npm cache clean --force

USER node

ENTRYPOINT ["mcp-remote", "https://flowsimp.com/mcp"]
