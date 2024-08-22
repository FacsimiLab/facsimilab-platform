# syntax=docker/dockerfile:1

############################
ARG IMAGE_VERSION="dev"
ARG IMAGE_REPO_PREFIX=""
############################

# FROM ${IMAGE_REPO_PREFIX}facsimilab-main:${IMAGE_VERSION} AS pythonenv
FROM ${IMAGE_REPO_PREFIX}facsimilab-main:dev AS pythonenv

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

COPY --chown=$MAMBA_USER:$MAMBA_USER /home/ /root/
COPY --chown=$MAMBA_USER:$MAMBA_USER /tmp /tmp


RUN --mount=type=cache,target=${MAMBA_ROOT_PREFIX}/pkgs \
    micromamba create -y -v --name facsimilab -f /tmp/${CONDA_FILE} \
    && micromamba clean --all --yes