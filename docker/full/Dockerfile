############################
ARG IMAGE_VERSION="dev"
############################

FROM facsimilab-main:${IMAGE_VERSION} as full-builder

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



# Second stage image
#--------------------------------------
FROM mambaorg/micromamba:1.5 as micromamba
FROM facsimilab-main:${IMAGE_VERSION}

# Set environment variables
ARG MAMBA_USER=coder
ENV MAMBA_USER=${MAMBA_USER}
ENV MAMBA_ROOT_PREFIX="/opt/conda"

USER root



COPY --from=micromamba "$MAMBA_EXE" "$MAMBA_EXE"
COPY --from=micromamba /usr/local/bin/_activate_current_env.sh /usr/local/bin/_activate_current_env.sh
COPY --from=micromamba /usr/local/bin/_dockerfile_shell.sh /usr/local/bin/_dockerfile_shell.sh
COPY --from=micromamba /usr/local/bin/_entrypoint.sh /usr/local/bin/_entrypoint.sh
COPY --from=micromamba /usr/local/bin/_dockerfile_initialize_user_accounts.sh /usr/local/bin/_dockerfile_initialize_user_accounts.sh
COPY --from=micromamba /usr/local/bin/_dockerfile_setup_root_prefix.sh /usr/local/bin/_dockerfile_setup_root_prefix.sh

RUN echo "$MAMBA_USER ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean


# Copy conda and apt packages from the builder stage
COPY --from=full-builder --chown=$MAMBA_USER:$MAMBA_USER ${MAMBA_ROOT_PREFIX} ${MAMBA_ROOT_PREFIX}
COPY --from=full-builder /var/lib/apt /var/lib/apt



# Set login username and work directory
USER $MAMBA_USER
WORKDIR /home/${MAMBA_USER}/work

# Add the bash profile
COPY --chown=$MAMBA_USER:$MAMBA_USER .profile /home/${MAMBA_USER}/.profile
RUN cat /home/${MAMBA_USER}/.profile >> /home/${MAMBA_USER}/.bashrc

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]