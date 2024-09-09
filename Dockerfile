FROM checkmarx/dast:2.2.0

USER zap

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
