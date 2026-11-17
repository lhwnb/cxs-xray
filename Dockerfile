FROM alpine:3.20
RUN apk add --no-cache curl unzip ca-certificates libc6-compat && \
    curl -fsSL -o /tmp/x.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    mkdir -p /opt/xray && unzip -o /tmp/x.zip -d /opt/xray && chmod +x /opt/xray/xray
WORKDIR /opt/xray
COPY config.template.json start.sh /opt/xray/
RUN chmod +x /opt/xray/start.sh
ENV PORT=8080 UUID=00000000-0000-0000-0000-000000000000 WSPATH=ws
CMD ["/opt/xray/start.sh"]