# syntax=docker/dockerfile:1

############################
ARG IMAGE_VERSION="dev"
ARG IMAGE_REPO_PREFIX="pranavmishra90/"
############################

FROM ${IMAGE_REPO_PREFIX}facsimilab-full-env:${IMAGE_VERSION} AS pythonenv
FROM ${IMAGE_REPO_PREFIX}facsimilab-main:${IMAGE_VERSION} AS full-image-builder 

ARG MAMBA_USER=coder
ARG MAMBA_USER_ID=1000
ARG MAMBA_USER_GID=1000

ARG CONDA_FILE="facsimilab-conda-lock.yml"
ENV CONDA_FILE=${CONDA_FILE}

ENV MAMBA_USER=$MAMBA_USER
ENV MAMBA_ROOT_PREFIX="/opt/conda"
ENV MAMBA_EXE="/bin/micromamba"
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/Chicago"
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV ENV_NAME=facsimilab

# Install additional packages
USER root
RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    jq \
    zoxide \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && chown -R ${MAMBA_USER}:${MAMBA_USER} /opt /tmp

# Confirm that $MAMBA_USER has sudo permissions
RUN usermod -aG sudo $MAMBA_USER && \
    echo "$MAMBA_USER ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Set login username and work directory
USER $MAMBA_USER
WORKDIR /home/${MAMBA_USER}/work

# Add the bash profile
COPY --chown=$MAMBA_USER:$MAMBA_USER /home/ /home/${MAMBA_USER}/
RUN cat /home/${MAMBA_USER}/.profile > /home/${MAMBA_USER}/.bash_aliases && \
    echo "Facsimilab-Full $facsimilab_version_num" > /home/${MAMBA_USER}/.server_name.txt

# Copy the tests
COPY --chown=$MAMBA_USER:$MAMBA_USER /testing /home/${MAMBA_USER}/testing

# Copy the python environment from the first stage
COPY --chown=$MAMBA_USER:$MAMBA_USER --from=pythonenv ${MAMBA_ROOT_PREFIX}/envs ${MAMBA_ROOT_PREFIX}/envs

SHELL ["/usr/local/bin/_dockerfile_shell.sh"]

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]
# Optional: if you want to customize the ENTRYPOINT and have a conda
# environment activated, then do this:
# ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "my_entrypoint_program"]

CMD ["/bin/bash"]



###############################################################################
# Labels
###############################################################################
ARG IMAGE_VERSION="dev"
ARG ISO_DATETIME
ARG FULL_ENV_SHA

LABEL org.opencontainers.image.title="FacsimiLab-Full"
LABEL version=${IMAGE_VERSION}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL org.opencontainers.image.description="A docker image for reproducible science, leveraging Python, Nvidia CUDA, Datalad, Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/FacsimiLab/FacsimiLab-platform"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.created=${ISO_DATETIME}
LABEL org.opencontainers.image.base.name="docker.io/pranavmishra90/facsimilab-full-env:${IMAGE_VERSION}"
LABEL org.opencontainers.image.base.digest=${FULL_ENV_SHA}