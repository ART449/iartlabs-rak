#!/usr/bin/env python3
"""Health check para servicios IArtLabs."""
import sys, json, urllib.request

spec_path = "data/health-dashboard-spec.json"
with open(spec_path) as f:
    spec = json.load(f)

results = []
for svc in spec["servicios"]:
    url = svc.get("url")
    if not url:
        url = f"http://{svc['host']}:{svc['puerto']}{svc['ruta']}"
    try:
        urllib.request.urlopen(url, timeout=5)
        results.append({"nombre": svc["nombre"], "url": url, "status": "OK"})
    except Exception as e:
        results.append({"nombre": svc["nombre"], "url": url, "status": f"FAIL: {e}"})

print(json.dumps(results, indent=2, ensure_ascii=False))
