# Plan de Consolidación IArtLabs
> Generado automáticamente por Hermes el 2026-06-17
> Objetivo: reducir fragmentación, estandarizar CI/CD y centralizar operación.

---

## 1. Diagnóstico de fragmentación

### Repos duplicados / versionados sucesivos

| Familia | Repos | Recomendación | Prioridad |
|---------|-------|---------------|-----------|
| **ByFlow** | `byflow`, `byflow-consolidado`, `VibeFlow_Pro` | `VibeFlow_Pro` parece el más reciente y completo (1,140 archivos, último commit 2026-06-16). `byflow` es viejo (2026-04-09). `byflow-consolidado` es un checkpoint. | Alta |
| **BeeCode** | `beecode`, `beecode-claudio` | `beecode` es el repositorio principal. `beecode-claudio` parece una variante personal. | Media |
| **Memo** | `Memo-Desktop`, archivos Memo dentro de `Colmena` | `Memo-Desktop` puede ser el cliente desktop; el core vive en `Colmena`. Necesita aclarar separación. | Media |
| **Colmena / Nexus** | `Colmena`, `arturo-nexus`, `kaizen-backend`, `INBEEBOX` | Son complementarios: `Colmena` core, `arturo-nexus` MoE, `kaizen-backend` gobierno, `INBEEBOX` hub A2A. No son duplicados, pero necesitan interfaces claras. | Media |

### Problemas detectados

1. **Sin README en repos clave:** `kaizen-backend`, `VibeFlow_Pro`, `arturo-nexus`, `Memo-Desktop`, `Colmena` no tienen README raíz. Esto dificulta onboarding.
2. **Sin CI/CD:** No se encontraron `.github/workflows/` en los repos principales.
3. **Sin tests automatizados visibles:** No hay suites de prueba claras.
4. **Dependencias implícitas:** `Colmena` es centro gravitacional, pero no hay un `docker-compose` global ni un `setup.sh` unificado.
5. **Documentación operativa dispersa:** IPs, contraseñas, runbooks en múltiples repos privados.

---

## 2. Plan de acción inmediato (esta semana)

### 2.1 Consolidar ByFlow
- [ ] Elegir `VibeFlow_Pro` como repositorio canónico de ByFlow.
- [ ] Migrar cualquier asset único de `byflow` y `byflow-consolidado` a `VibeFlow_Pro` bajo una carpeta `legacy/`.
- [ ] Archivar `byflow` como `read-only` con una nota en README apuntando a `VibeFlow_Pro`.
- [ ] Archivar `byflow-consolidado` como `read-only` (es un checkpoint).
- [ ] Crear un README claro en `VibeFlow_Pro` que diga: "Este es ByFlow canónico".

### 2.2 Estandarizar READMEs
- [ ] Crear `README.md` en: `kaizen-backend`, `VibeFlow_Pro`, `arturo-nexus`, `Memo-Desktop`, `Colmena`.
- [ ] Plantilla mínima: ¿Qué es?, ¿Cómo correrlo?, ¿Stack?, ¿Endpoints/CLI?, ¿Dependencias?

### 2.3 Agregar CI/CD básico
- [ ] GitHub Actions en repos con código ejecutable:
  - `beecode` (Go) — build + lint
  - `kaizen-backend` (Python/FastAPI) — pytest básico
  - `GoEcosystem` (Go) — build + test
  - `mija-focus-overlay` (Python) — lint + type check
  - `myflow-studio-morph` (HTML) — deploy estático a GitHub Pages

### 2.4 Crear un repositorio `iartlabs-infra`
- [ ] `docker-compose.yml` global que levante: Colmena, INBEEBOX, kaizen-backend, Memo-Desktop, TheHive.
- [ ] `setup.sh` para entorno local.
- [ ] `.env.example` unificado.
- [ ] Scripts de backup de MEMO_RACK y IArtLabs-Master.

### 2.5 Centralizar operación
- [ ] Mover todos los runbooks a `iartlabs-rak/docs/runbooks/`.
- [ ] Crear un `VAULT.md` encriptado o en un repo privado separado con credenciales.
- [ ] Definir un CODEOWNERS global.

---

## 3. Plan mediano plazo (1-3 meses)

- [ ] **Unificar registry de agentes:** `Colmena/agents/registry.json`, `INBEEBOX/members.json`, `beecode.json`, `colmena-beecode.json` deben apuntar a una sola fuente.
- [ ] **API contracts:** documentar interfaces entre Colmena ↔ INBEEBOX ↔ kaizen-backend ↔ arturo-nexus.
- [ ] **Dashboard de métricas:** PostgreSQL/TimescaleDB + Grafana o panel simple en Railway.
- [ ] **Tests E2E:** verificar que toda la colmena levante con `docker compose up`.
- [ ] **Documentación de onboarding:** "Cómo contribuir a IArtLabs en 30 minutos".

---

## 4. Quick wins que podemos hacer ahora mismo

1. **READMEs faltantes** — texto corto, claro, con stack y run command.
2. **CI básico** — un workflow `.github/workflows/ci.yml` por repo.
3. **Archivar repos viejos** — cambiar descripción y añadir nota de deprecación.
4. **Unificar `.env.example`** — variables comunes documentadas.
5. **Crear `iartlabs-rak/docs/runbooks/`** con al menos 3 runbooks: deploy, backup, troubleshooting.

---

*Plan generado automáticamente. Actualizar semanalmente.*
