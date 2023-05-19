FROM checkmarx/dast:1.0.4

RUN adduser -u 1000 -h /home/zap -s /bin/bash -D dast

USER dast

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
