FROM checkmarx/dast:1.0.0

COPY --chown=1000 entrypoint.sh /entrypoint.sh

USER zap

ENTRYPOINT ["/entrypoint.sh"]
