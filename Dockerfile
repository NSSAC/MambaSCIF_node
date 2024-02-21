FROM ghcr.io/nssac/mambascif

COPY node.scif /node.scif
# RUN mkdir -p /run/secrets

RUN micromamba create -n node_env
RUN micromamba install --name node_env -y -c conda-forge nodejs=20
RUN micromamba run --name base scif install /node.scif


ENTRYPOINT ["/usr/bin/micromamba", "run", "--name", "base", "scif"]

CMD ["shell"]
