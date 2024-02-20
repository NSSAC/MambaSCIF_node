FROM ghcr.io/nssac/mambascif

RUN mkdir -p /run/secrets

RUN --mount=type=secret,id=gh_token \
    micromamba install --name node_env nodejs=18

RUN rm -rf /run/secrets || true

ENTRYPOINT ["/usr/bin/micromamba", "run", "--name", "base", "scif"]

CMD ["shell"]
