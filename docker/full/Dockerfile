
############################
ARG IMAGE_VERSION="dev"
ARG IMAGE_REPO_PREFIX=""
############################

FROM ${IMAGE_REPO_PREFIX}facsimilab-main:${IMAGE_VERSION} AS pythonenv


ARG MAMBA_USER=coder
ARG MAMBA_USER_ID=1000
ARG MAMBA_USER_GID=1000

ARG CONDA_FILE=facsimilab-environment.yml
ENV CONDA_FILE=${CONDA_FILE}

ENV MAMBA_USER=$MAMBA_USER
ENV MAMBA_ROOT_PREFIX="/opt/conda"
ENV MAMBA_EXE="/bin/micromamba"
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/Chicago"
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

USER root

COPY .mambarc /root/.mambarc
COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/facsimilab-environment.yml
COPY --chown=$MAMBA_USER:$MAMBA_USER facsimilab-conda-lock.yml /tmp/facsimilab-conda-lock.yml


RUN --mount=type=cache,target=${MAMBA_ROOT_PREFIX}/pkgs \
    micromamba create -y -v --name facsimilab -f /tmp/${CONDA_FILE} \
    && micromamba clean --all --yes

############################
ARG IMAGE_VERSION="dev"
ARG IMAGE_REPO_PREFIX=""
############################

FROM ${IMAGE_REPO_PREFIX}facsimilab-main:${IMAGE_VERSION} AS full-builder

ARG IMAGE_VERSION="dev"

LABEL org.opencontainers.image.title="FacsimiLab-Full"
LABEL version=${IMAGE_VERSION}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL description="A docker image for reproducible science, leveraging Python, Nvidia CUDA, Datalad, Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/FacsimiLab/FacsimiLab-platform"
LABEL org.opencontainers.image.licenses="MIT"


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


# Install additional packages
USER root
RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    zoxide \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/facsimilab-environment.yml
COPY --chown=$MAMBA_USER:$MAMBA_USER facsimilab-conda-lock.yml /tmp/facsimilab-conda-lock.yml

# Confirm that $MAMBA_USER has sudo permissions
RUN echo "$MAMBA_USER ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Set login username and work directory
USER $MAMBA_USER
WORKDIR /home/${MAMBA_USER}/work

# Add the bash profile
COPY --chown=$MAMBA_USER:$MAMBA_USER .profile /home/${MAMBA_USER}/.profile
COPY .condarc /home/${MAMBA_USER}/.condarc
RUN cat /home/${MAMBA_USER}/.profile > /home/${MAMBA_USER}/.bash_aliases
RUN echo "Facsimilab-Full $facsimilab_version_num" > /home/${MAMBA_USER}/.server_name.txt


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