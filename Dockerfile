FROM checkmarx/dast:1.0.0

USER Checkmarx

ENTRYPOINT ["/entrypoint.sh"]
