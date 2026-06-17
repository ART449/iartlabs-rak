# Runbook — Troubleshooting de La Colmena

## Síntoma: Colmena no responde

### 1. Verificar proceso
```bash
ssh art@100.119.50.26 "pm2 status"
```

### 2. Ver logs
```bash
ssh art@100.119.50.26 "pm2 logs colmena --lines 100 --nostream"
```

### 3. Verificar Ollama
```bash
ssh art@100.119.50.26 "curl -s http://localhost:11434/api/tags"
```

### 4. Verificar INBEEBOX
```bash
curl -s http://100.119.50.26:8002/health
```

### 5. Reinicio en cascada
```bash
ssh art@100.119.50.26 "pm2 restart colmena && pm2 restart nexus-web && pm2 restart memo-central"
```

## Síntoma: Railway no responde
```bash
railway status
railway logs
railway restart
```

## Síntoma: Tailscale caído
```bash
ssh art@100.119.50.26 "tailscale status"
```
