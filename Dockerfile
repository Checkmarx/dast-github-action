FROM checkmarx/dast:1.0.0

USER root
RUN adduser -D -u 1001 Checkmarx
USER Checkmarx

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
