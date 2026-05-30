# Deploy n8n on Render with push-to-deploy.
#
# This is a THIN wrapper around the official n8n image. It does NOT build n8n
# from source (building the full n8n monorepo on Render is slow and fails).
#
# How updates work:
#   - Render is connected to this repo with auto-deploy on commit.
#   - Push any change to `main` and Render rebuilds + redeploys automatically.
#   - To pin or upgrade n8n, change the tag below (e.g. n8nio/n8n:2.23.1) and push.
#
# All configuration (N8N_PORT, DB_*, N8N_ENCRYPTION_KEY, webhook URLs, OAuth keys)
# lives as environment variables on the Render service, and workflows/credentials
# live in the external Render Postgres database — nothing sensitive belongs here.
FROM docker.io/n8nio/n8n:latest
