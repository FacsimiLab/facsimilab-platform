FROM mambaorg/micromamba:1.5 as micromamba

FROM nvidia/cuda:12.1.0-base-ubuntu20.04


############################
ARG IMAGE_VERSION="0.2.0"
############################

USER root

# Python conda caching directory on host
ARG HOST_CONDA="/home/pranav/mambaforge/pkgs"
ARG MAMBA_USER=root
ARG MAMBA_USER_ID=0
ARG MAMBA_USER_GID=0
ENV MAMBA_USER=$MAMBA_USER
ENV MAMBA_ROOT_PREFIX="/opt/conda"
ENV MAMBA_EXE="/bin/micromamba"


ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/Chicago"
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update -y \
    && apt-get install -y sudo tzdata git ninja-build \
    # && useradd -ms /bin/bash -d /home/$MAMBA_USER $MAMBA_USER --uid $MAMBA_USER_ID --gid $MAMBA_USER_GID \
    # && usermod -aG sudo $MAMBA_USER \
    # && echo "$MAMBA_USER ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean


RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && \
    apt-get --no-install-recommends install -y \
    # Additional dependences
    bzip2 \
    ca-certificates \
    curl \
    fonts-liberation \
    gnupg2 \
    inkscape \
    less \
    locales \
    nano \
    openssh-client \
    openssh-server \
    pandoc \
    systemd \
    systemd-sysv \
    tini \
    unzip \
    wget \
    zsh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=micromamba "$MAMBA_EXE" "$MAMBA_EXE"
COPY --from=micromamba /usr/local/bin/_activate_current_env.sh /usr/local/bin/_activate_current_env.sh
COPY --from=micromamba /usr/local/bin/_dockerfile_shell.sh /usr/local/bin/_dockerfile_shell.sh
COPY --from=micromamba /usr/local/bin/_entrypoint.sh /usr/local/bin/_entrypoint.sh
COPY --from=micromamba /usr/local/bin/_dockerfile_initialize_user_accounts.sh /usr/local/bin/_dockerfile_initialize_user_accounts.sh
COPY --from=micromamba /usr/local/bin/_dockerfile_setup_root_prefix.sh /usr/local/bin/_dockerfile_setup_root_prefix.sh

RUN /usr/local/bin/_dockerfile_initialize_user_accounts.sh && \
    /usr/local/bin/_dockerfile_setup_root_prefix.sh

USER $MAMBA_USER

SHELL ["/usr/local/bin/_dockerfile_shell.sh"]

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]
# Optional: if you want to customize the ENTRYPOINT and have a conda
# environment activated, then do this:
# ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "my_entrypoint_program"]

# You can modify the CMD statement as needed....
CMD ["/bin/bash"]


COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/environment.yml


RUN --mount=type=cache,target=/home/pranav/.docker/mamba micromamba create -y -f /tmp/environment.yml \
    && micromamba clean --all --yes

RUN --mount=type=cache,target=/home/pranav/.docker/pip /opt/conda/envs/facsimilab/bin/pip install -U torch==2.3.1 torchaudio torchvision --index-url https://download.pytorch.org/whl/cu121

RUN micromamba clean --all --yes