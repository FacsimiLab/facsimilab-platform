############################
ARG IMAGE_VERSION="dev"
############################

FROM facsimilab-main:${IMAGE_VERSION} AS full-builder

ARG IMAGE_VERSION="dev"

LABEL org.opencontainers.image.title="FacsimiLab-full"
LABEL version=${IMAGE_VERSION}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL description="A docker image for reproducible science, leveraging Python, Nvidia CUDA, Datalad, Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/FacsimiLab/FacsimiLab-platform"
LABEL org.opencontainers.image.licenses="MIT"


ARG MAMBA_USER=coder
ARG MAMBA_USER_ID=1000
ARG MAMBA_USER_GID=1000

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

# Install python environment for the full image
COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/facsimilab-environment.yml

RUN micromamba create -y -f /tmp/facsimilab-environment.yml \
    && micromamba clean --all --yes

# Add the GPU (CUDA 12.1) supported pytorch
RUN ${MAMBA_ROOT_PREFIX}/envs/facsimilab/bin/pip install -U torch==2.3.1 torchaudio torchvision --index-url https://download.pytorch.org/whl/cu121 && micromamba clean --all --yes

# Change user to root
USER root

# Confirm that $MAMBA_USER has sudo permissions
RUN echo "$MAMBA_USER ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Set login username and work directory
USER $MAMBA_USER
WORKDIR /home/${MAMBA_USER}/work

# Add the bash profile
COPY --chown=$MAMBA_USER:$MAMBA_USER .profile /home/${MAMBA_USER}/.profile
RUN echo "Facsimilab-Full $facsimilab_version_num" > /home/${MAMBA_USER}/.server_name.txt
RUN cat /home/${MAMBA_USER}/.profile > /home/${MAMBA_USER}/.bash_aliases

SHELL ["/usr/local/bin/_dockerfile_shell.sh"]

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]
# Optional: if you want to customize the ENTRYPOINT and have a conda
# environment activated, then do this:
# ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "my_entrypoint_program"]

CMD ["/bin/bash"]