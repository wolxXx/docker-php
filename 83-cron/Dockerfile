#VERSION=0.2.40
FROM php:8.3-cli

# Latest releases available at https://github.com/aptible/supercronic/releases

ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.2.40/supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=8ab9683df4b8287ba1e09923101d6ebf532b6eba \
    SUPERCRONIC=supercronic-linux-amd64

RUN curl -fsSLO "$SUPERCRONIC_URL" \
 && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
 && chmod +x "$SUPERCRONIC" \
 && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
 && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic

CMD ["supercronic", "/app/crontab"]
