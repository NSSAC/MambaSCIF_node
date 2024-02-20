FROM ghcr.io/nssac/mambascif

RUN mkdir -p /run/secrets

RUN micromamba create -n node_env
RUN --mount=type=secret,id=gh_token \
    micromamba install --name node_env -y -c conda-forge nodejs=20

RUN rm -rf /run/secrets || true

ENTRYPOINT ["/usr/bin/micromamba", "run", "--name", "base", "scif"]

CMD ["shell"]
