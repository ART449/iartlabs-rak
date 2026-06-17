# Runbook — Deploy de La Colmena

## Propósito
Levantar o actualizar el ecosistema Colmena en producción local (ThinkCentre) o Railway.

## Pre-requisitos
- Acceso SSH a `100.119.50.26`
- Tailscale activo
- PM2 instalado
- `.env` correcto

## Pasos

### Producción local (ThinkCentre)

```bash
ssh art@100.119.50.26
cd /opt/colmena
git pull origin main
npm install
pm2 reload colmena
pm2 logs colmena --lines 50
```

### Railway

```bash
cd /path/to/colmena
railway deploy
railway logs
```

## Verificación

```bash
curl -s http://100.119.50.26:8002/health
curl -s https://colmena-production-dd90.up.railway.app/health
```

## Rollback

```bash
pm2 restart colmena
# o en Railway:
railway rollback
```
