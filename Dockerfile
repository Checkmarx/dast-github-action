FROM checkmarx/dast:latest

USER zap

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
