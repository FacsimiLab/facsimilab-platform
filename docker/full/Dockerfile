############################
ARG IMAGE_VERSION="v0.2.0"
############################

FROM pranavmishra90/facsimilab-main:${IMAGE_VERSION}

USER root

LABEL org.opencontainers.image.title="FacsimiLab-full"
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

# Install python environment for the full image
COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/facsimilab-environment.yml

RUN --mount=type=cache,target=/home/pranav/.docker/mamba micromamba create -y -f /tmp/facsimilab-environment.yml \
	&& micromamba clean --all --yes

# Add the GPU (CUDA 12.1) supported pytorch
RUN --mount=type=cache,target=/home/pranav/.docker/pip /opt/conda/envs/facsimilab/bin/pip install -U torch==2.3.1 torchaudio torchvision --index-url https://download.pytorch.org/whl/cu121 && micromamba clean --all --yes
