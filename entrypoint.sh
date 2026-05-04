#!/bin/sh

# Prüfen, ob das Zertifikat bereits existiert
if [ ! -f /etc/nginx/ssl/localhost.crt ]; then
    echo "Zertifikat wird erstellt..."
    apk add --no-cache openssl

    # Generieren des Zertifikats im Non-Interactive-Mode
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/localhost.key \
        -out /etc/nginx/ssl/localhost.crt \
        -subj "/CN=localhost" \
        -addext "subjectAltName=DNS:localhost,IP:127.0.0.1,IP:${LOCAL_IP:-192.168.1.174}"
else
    echo "Zertifikat existiert bereits."
fi

# NGINX starten
echo "Starte Nginx..."
exec nginx -g 'daemon off;'
