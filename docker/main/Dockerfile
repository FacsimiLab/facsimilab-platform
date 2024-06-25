############################
ARG IMAGE_VERSION="dev"
############################

FROM pranavmishra90/facsimilab-base:${IMAGE_VERSION} as main-builder

LABEL org.opencontainers.image.title="FacsimiLab-main"
LABEL version=${IMAGE_VERSION}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL description="A docker image for reproducible science, leveraging Python, Nvidia CUDA, Datalad, Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/FacsimiLab/FacsimiLab-platform"
LABEL org.opencontainers.image.licenses="MIT"


# Python conda caching directory on host
ARG HOST_CONDA="/home/pranav/mambaforge/pkgs"
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

# Install quarto
USER root
COPY quarto.deb /tmp/quarto.deb
RUN --mount=type=cache,target=/var/cache/apt apt install -y /tmp/quarto.deb

# Install python environment for the base image
COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/base-environment.yml


RUN --mount=type=cache,target=/home/pranav/.docker/buildcache/mamba \
	micromamba create -y -f /tmp/base-environment.yml \
	&& micromamba clean --all --yes

FROM pranavmishra90/facsimilab-base:${IMAGE_VERSION}

# Copy conda and apt packages from the builder stage
COPY --from=main-builder ${MAMBA_ROOT_PREFIX} ${MAMBA_ROOT_PREFIX}
COPY --from=main-builder /var/lib/apt /var/lib/apt
COPY --from=main-builder /etc/sudoers /etc/sudoers
COPY --from=main-builder /usr/local/bin/ /usr/local/bin/


# Set login username and work directory
USER $MAMBA_USER
WORKDIR /home/${MAMBA_USER}/work

COPY --chown=$MAMBA_USER:$MAMBA_USER .profile /home/coder/.profile
RUN cat /home/coder/.profile >> /home/coder/.bashrc


ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]