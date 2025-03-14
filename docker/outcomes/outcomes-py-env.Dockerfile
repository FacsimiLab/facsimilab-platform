# syntax=docker/dockerfile:1

#########################################
# Stage 1: 
# Build the 'outcomes' python env
#########################################

#########################################
ARG IMAGE_VERSION="dev"
ARG IMAGE_REPO_PREFIX="pranavmishra90/"
#########################################

FROM ${IMAGE_REPO_PREFIX}facsimilab-main:${IMAGE_VERSION} AS outcomes-python-builder

ARG MAMBA_USER=coder
ARG MAMBA_USER_ID=1000
ARG MAMBA_USER_GID=1000
ARG CONDA_OVERRIDE_CUDA="12.6"
ENV CONDA_OVERRIDE_CUDA=${CONDA_OVERRIDE_CUDA}
ENV MAMBA_USER=$MAMBA_USER
ENV MAMBA_ROOT_PREFIX="/opt/conda"
ENV MAMBA_EXE="/bin/micromamba"

ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/Chicago"
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Select either environment.yml or outcomes-conda-lock.yml
ARG OUTCOMES_IMAGE_CONDA_FILE="outcomes-conda-lock.yml"
ENV CONDA_FILE=${OUTCOMES_IMAGE_CONDA_FILE}

USER root

COPY --chown=$MAMBA_USER:$MAMBA_USER /home/ /root/
COPY --chown=$MAMBA_USER:$MAMBA_USER /python-env /tmp

RUN --mount=type=cache,target=${MAMBA_ROOT_PREFIX}/pkgs \
    micromamba create -y -v --name outcomes -f /tmp/${CONDA_FILE} \
    && micromamba clean --all --yes

###############################################################################
# Labels
###############################################################################
ARG IMAGE_VERSION="dev"
ARG ISO_DATETIME="date"
ARG BASE_IMAGE_SHA="SHA"

LABEL org.opencontainers.image.title="FacsimiLab-Outcomes-Environment"
LABEL version=${IMAGE_VERSION}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL org.opencontainers.image.description="Outcomes image python environment builder || FacsimiLab - A docker image for reproducible science, leveraging Python, Nvidia CUDA, Datalad, Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/FacsimiLab/FacsimiLab-platform"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.created=${ISO_DATETIME}
LABEL org.opencontainers.image.base.name="docker.io/pranavmishra90/facsimilab-base:${IMAGE_VERSION}"
LABEL org.opencontainers.image.base.digest=${BASE_IMAGE_SHA}