FROM checkmarx/dast:2.3.0

USER zap

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
