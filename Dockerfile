FROM checkmarx/dast:1.0.0

COPY entrypoint.sh /entrypoint.sh

USER zap

ENTRYPOINT ["/entrypoint.sh"]
