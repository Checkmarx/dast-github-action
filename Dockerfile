FROM checkmarx/dast:1.0.0

USER root

ENTRYPOINT ["/entrypoint.sh"]
