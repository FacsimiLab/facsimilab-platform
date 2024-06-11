FROM pranavmishra90/facsimilab-base:v0.2.0

USER root

############################
ARG IMAGE_VERSION="0.2.0"
############################


LABEL org.opencontainers.image.title="FacsimiLab-main"
LABEL version=${IMAGE_VERSION}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL description="A docker image for reproducible science, leveraging Python, Datalad, Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/FacsimiLab/FacsimiLab-platform"
LABEL org.opencontainers.image.licenses="MIT"


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

# Install quarto
COPY quarto.deb /tmp/quarto.deb
RUN apt install -y /tmp/quarto.deb

# Install python environment for the base image
COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/base-environment.yml

RUN --mount=type=cache,target=/home/pranav/.docker/mamba micromamba create -y -f /tmp/base-environment.yml \
	&& micromamba clean --all --yes
