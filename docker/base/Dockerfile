# syntax=docker/dockerfile:1

# Facsimilab Base Image

FROM mambaorg/micromamba:1.5 AS micromamba

# FROM nvidia/cuda:12.1.0-base-ubuntu22.04
ARG BASE_IMAGE_SHA
ENV BASE_IMAGE_SHA=${BASE_IMAGE_SHA}

ARG CACHEBUST="1"

FROM docker.io/pranavmishra90/cuda:12.4.1-base-ubuntu22.04@sha256:50b0f0658af6b419a0a8110eff0569617d75413ebf27abd1f99a85b49d4d466f
# this base image was created with #@
# ./build.sh -d --image-name pranavmishra90/cuda --cuda-version 12.4 --os ubuntu --os-version 22.04 --arch x86_64
# taken from https://gitlab.com/nvidia/container-images/cuda

############################
ARG IMAGE_VERSION="dev"
############################

ARG IMAGE_VERSION="dev"
ARG ISO_DATETIME
ARG BASE_IMAGE_SHA


LABEL org.opencontainers.image.title="FacsimiLab-Base"
LABEL version=${IMAGE_VERSION}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL org.opencontainers.image.description="Base image || FacsimiLab - A docker image for reproducible science, leveraging Python, Nvidia CUDA, Datalad, Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/FacsimiLab/FacsimiLab-platform"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.created=${ISO_DATETIME}
LABEL org.opencontainers.image.base.name="docker.io/pranavmishra90/cuda:12.4.1-base-ubuntu22.04"
LABEL org.opencontainers.image.base.digest=${BASE_IMAGE_SHA}

ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/Chicago"
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8


RUN apt-get update -y \
    && apt-get install -y tzdata git ninja-build gnupg2 wget yadm && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/apt/keyrings && \
    # Eza
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | gpg --dearmor -o /etc/apt/keyrings/gierens.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | tee /etc/apt/sources.list.d/gierens.list && \
    chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list && \
    # Neuro Debian
    wget -O- http://neuro.debian.net/lists/jammy.us-tn.full | tee /etc/apt/sources.list.d/neurodebian.sources.list && \
    apt-key adv --recv-keys --keyserver hkps://keyserver.ubuntu.com 0xA5D32F012649A5A9

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
    # Additional dependences
    bzip2 \
    ca-certificates \
    curl \
    # datalad \
    git-annex \
    eza \
    fonts-liberation \
    less \
    locales \
    nano \
    openssh-client \
    openssh-server \
    systemd \
    systemd-sysv \
    pipx \
    sudo \
    tini \
    tree \
    unzip \
    zoxide \
    zsh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ARG MAMBA_USER=coder
ARG MAMBA_USER_ID=1000
ARG MAMBA_USER_GID=1000
ENV MAMBA_USER=$MAMBA_USER
ENV MAMBA_ROOT_PREFIX="/opt/conda"
ENV MAMBA_EXE="/bin/micromamba"

COPY --from=micromamba "$MAMBA_EXE" "$MAMBA_EXE"
COPY --from=micromamba /usr/local/bin/_activate_current_env.sh /usr/local/bin/_activate_current_env.sh
COPY --from=micromamba /usr/local/bin/_dockerfile_shell.sh /usr/local/bin/_dockerfile_shell.sh
COPY --from=micromamba /usr/local/bin/_entrypoint.sh /usr/local/bin/_entrypoint.sh
COPY --from=micromamba /usr/local/bin/_dockerfile_initialize_user_accounts.sh /usr/local/bin/_dockerfile_initialize_user_accounts.sh
COPY --from=micromamba /usr/local/bin/_dockerfile_setup_root_prefix.sh /usr/local/bin/_dockerfile_setup_root_prefix.sh

RUN /usr/local/bin/_dockerfile_initialize_user_accounts.sh && \
    /usr/local/bin/_dockerfile_setup_root_prefix.sh \
    && usermod -aG sudo $MAMBA_USER \
    && echo "$MAMBA_USER ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Set login username and work directory
USER $MAMBA_USER

ENV MAMBA_USER_WORK_DIR=/home/${MAMBA_USER}/work

WORKDIR ${MAMBA_USER_WORK_DIR}

COPY --chown=$MAMBA_USER:$MAMBA_USER .profile /home/${MAMBA_USER}/.profile
RUN echo "Facsimilab-Base $facsimilab_version_num" > /home/${MAMBA_USER}/.server_name.txt
RUN cat /home/${MAMBA_USER}/.profile > /home/${MAMBA_USER}/.bash_aliases

SHELL ["/usr/local/bin/_dockerfile_shell.sh"]

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]
# Optional: if you want to customize the ENTRYPOINT and have a conda
# environment activated, then do this:
# ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "my_entrypoint_program"]

CMD ["/bin/bash"]

