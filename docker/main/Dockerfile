############################
ARG IMAGE_VERSION="dev"
############################

FROM pranavmishra90/facsimilab-base:${IMAGE_VERSION}

ARG IMAGE_VERSION="dev"

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
RUN --mount=type=cache,target=/var/cache/apt apt install -y /tmp/quarto.deb && rm /tmp/quarto.deb

# Install python environment for the base image
COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/base-environment.yml


RUN --mount=type=cache,target=/home/pranav/.docker/buildcache/mamba \
	micromamba create -y -f /tmp/base-environment.yml \
	&& micromamba clean --all --yes

# Set login username and work directory
USER $MAMBA_USER
WORKDIR /home/${MAMBA_USER}/work

COPY --chown=$MAMBA_USER:$MAMBA_USER .profile /home/${MAMBA_USER}/.profile
RUN cat /home/${MAMBA_USER}/.profile >> /home/${MAMBA_USER}/.bashrc


SHELL ["/usr/local/bin/_dockerfile_shell.sh"]

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]
# Optional: if you want to customize the ENTRYPOINT and have a conda
# environment activated, then do this:
# ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "my_entrypoint_program"]

CMD ["/bin/bash"]