# n8n-render

Thin Docker wrapper to run [n8n](https://n8n.io) on [Render](https://render.com)
with **push-to-deploy**.

## How it works
- The [`Dockerfile`](./Dockerfile) is just `FROM docker.io/n8nio/n8n:latest` — no
  source build. Render pulls the official n8n image.
- The Render service **`vectorshift-n8n-ventures`** is connected to this repo with
  auto-deploy on commit. **Push to `main` → Render rebuilds and redeploys.**

## Updating / pinning n8n
Edit the tag in the `Dockerfile` and push:
```dockerfile
FROM docker.io/n8nio/n8n:2.23.1   # pin a specific version (recommended for prod)
# or
FROM docker.io/n8nio/n8n:latest   # always track latest
```
> n8n does **not** support downgrades — only move the tag forward.

## Where config + data live (NOT in this repo)
- **Env vars** (port, DB connection, `N8N_ENCRYPTION_KEY`, webhook URLs, OAuth
  client IDs/secrets) are set on the Render service.
- **Workflows & credentials** are stored in the external Render Postgres database.

Keep this repo free of secrets.
