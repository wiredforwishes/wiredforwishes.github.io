#!/bin/sh
# Regenerates the root page and one page per platform from template.html.
# Each copy tags its referral links with utm_source=<platform> so the affiliate
# dashboard's Views page shows which platform each visit and sale came from.
set -e
cd "$(dirname "$0")"
sed 's/__SRC__/direct/g' template.html > index.html
for p in tiktok instagram threads youtube facebook x; do
  mkdir -p "$p"
  sed "s/__SRC__/$p/g" template.html > "$p/index.html"
done
