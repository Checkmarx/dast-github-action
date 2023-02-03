FROM checkmarx/dast:1.0.0

USER root
RUN adduser -u 1001 checkmarx
USER Checkmarx

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
