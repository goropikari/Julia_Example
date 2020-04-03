FROM julia:1.4.0-buster

ARG JL_USER="jl"
ARG JL_UID="1000"
ARG JL_GID="100"

USER root

ENV SHELL=/bin/bash \
    JL_USER=$JL_USER \
    JL_UID=$JL_UID \
    JL_GID=$JL_GID \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH=$JULIA_DIR/bin:$PATH \
    HOME=/home/$JL_USER

RUN useradd -m -s /bin/bash -N -u $JL_UID $JL_USER && \
    mkdir -p /app && \
    chown $JL_USER:$JL_GID /app

USER $JL_UID

WORKDIR $HOME
RUN julia --project=/app -e 'using Pkg; Pkg.instantiate()'
ENTRYPOINT ["/bin/bash"]
