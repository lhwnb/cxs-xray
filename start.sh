#!/bin/sh
set -e
P="${PORT:-8080}"
U="${UUID}"
W="${WSPATH:-ws}"
sed -e "s/__PORT__/${P}/g" -e "s/__UUID__/${U}/g" -e "s/__PATH__/${W}/g" /opt/xray/config.template.json > /opt/xray/config.json
echo "start xray on ${P} path /${W}"
exec /opt/xray/xray -c /opt/xray/config.json