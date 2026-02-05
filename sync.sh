#!/bin/bash
cd /opt/adguard-sync

# NUR saubere Regeln extrahieren und filtern
grep "@@||" /opt/AdGuardHome/AdGuardHome.yaml \
  | grep -iv "porn" \
  | grep -iv "redtube" \
  | grep -iv "youporn" \
  | grep -iv "xhamster" \
  | grep -iv "xvideos" \
  | sed "s/^[- '\"]*//g" \
  | sed "s/'$//g" \
  > custom_rules.txt

git add custom_rules.txt
git diff --cached --quiet || git commit -m "Filter Update $(date '+%Y-%m-%d %H:%M')"
git push
