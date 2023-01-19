FROM checkmarx/dast:1.0.0

USER Checkmarx

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
