FROM checkmarx/dast:1.0.0

COPY entrypoint.sh /entrypoint.sh

RUN chown Checkmarx /entrypoint.sh

USER Checkmarx 

ENTRYPOINT ["/entrypoint.sh"]
