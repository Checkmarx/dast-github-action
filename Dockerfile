FROM checkmarx/dast:1.0.4

USER zap

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
