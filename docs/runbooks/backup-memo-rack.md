# Runbook — Backup de MEMO_RACK e IArtLabs-Master

## Propósito
Garantizar que la memoria persistente y el plan maestro no se pierdan.

## Frecuencia recomendada
- Diario para `MEMO_RACK`
- Semanal para `IArtLabs-Master`

## Comando de backup

```bash
BACKUP_DIR="$HOME/backups/iartlabs/$(date +%Y-%m-%d)"
mkdir -p "$BACKUP_DIR"

# Memo RACK
rsync -avz --delete art@100.119.50.26:/opt/colmena/memory/MEMO_RACK/ "$BACKUP_DIR/memo-rack/"

# IArtLabs-Master
cd ~/iartlabs-rak
git pull origin main
cp -r ~/art44-investigacion/IArtLabs-Master "$BACKUP_DIR/IArtLabs-Master/"

# S3 o disco externo (opcional)
# aws s3 sync "$BACKUP_DIR" s3://iartlabs-backups/
```

## Restauración

```bash
# Restaurar desde backup más reciente
LATEST=$(ls -d ~/backups/iartlabs/* | tail -1)
rsync -avz "$LATEST/memo-rack/" art@100.119.50.26:/opt/colmena/memory/MEMO_RACK/
```
