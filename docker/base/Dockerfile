# Facsimilab Base Image

FROM mambaorg/micromamba:1.5 as micromamba

FROM nvidia/cuda:12.1.0-base-ubuntu22.04

############################
ARG IMAGE_VERSION="dev"
############################

LABEL org.opencontainers.image.title="FacsimiLab-base"
LABEL version=${IMAGE_VERSION}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL description="A docker image for reproducible science, leveraging Python, Datalad, Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/FacsimiLab/FacsimiLab-platform"
LABEL org.opencontainers.image.licenses="MIT"

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


RUN apt-get update -y \
    && apt-get install -y tzdata git ninja-build \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
    # Additional dependences
    bzip2 \
    ca-certificates \
    curl \
    fonts-liberation \
    gnupg2 \
    less \
    locales \
    nano \
    openssh-client \
    openssh-server \
    systemd \
    systemd-sysv \
    tini \
    unzip \
    wget \
    zsh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


COPY --chown=$MAMBA_USER:$MAMBA_USER .bash_aliases /root/.bash_aliases


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

