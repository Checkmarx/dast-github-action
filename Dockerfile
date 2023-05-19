FROM checkmarx/dast:1.0.4

RUN adduser \
    --disabled-password \
    --uid "1001" \
    "dast"
    
USER dast

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
