FROM checkmarx/dast:1.0.0

USER root
RUN useradd -u 1001 -g 0 -D checkmarx
USER checkmarx

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
