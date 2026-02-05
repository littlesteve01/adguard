#!/bin/bash
cd /opt/adguard-sync

# Whitelist (Erlaubnisliste)
grep "@@" /opt/AdGuardHome/AdGuardHome.yaml > whitelist.txt 2>/dev/null

# Custom Blocklist (eigene Sperren)
grep -v "^#" /opt/AdGuardHome/AdGuardHome.yaml | grep "||" > blocklist.txt 2>/dev/null

# Oder: Komplette User-Filter Regeln
cp /opt/AdGuardHome/data/filters/custom.txt custom_rules.txt 2>/dev/null

# Gesamte Config (optional - enthält ALLES)
cp /opt/AdGuardHome/AdGuardHome.yaml AdGuardHome.yaml 2>/dev/null

git add -A
git diff --cached --quiet || git commit -m "AdGuard Sync $(date '+%Y-%m-%d %H:%M')"
git push
