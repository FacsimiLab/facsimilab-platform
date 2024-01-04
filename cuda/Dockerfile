FROM mambaorg/micromamba:1.5.0 as micromamba

FROM codercom/code-server as code-server

FROM nvidia/cuda:12.3.1-base-ubuntu22.04

############################
ARG IMAGE_VERSION="0.0.31"
############################

LABEL org.opencontainers.image.title="SinguLab-CUDA"
LABEL version=${IMAGE_VERSION}}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL description="An NVIDIA CUDA enabled docker image for bioinformatics and datascience projects, leveraging Python, Datalad, VSCode (code-server), Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/pranavmishra90/SinguLab"
LABEL org.opencontainers.image.licenses="MIT"

#############################################
# Install packages into the ubuntu 22.04 base
#############################################

USER root

ARG MAMBA_USER=coder
ARG MAMBA_USER_ID=1000
ARG MAMBA_USER_GID=100
ENV MAMBA_USER=$MAMBA_USER
ENV MAMBA_ROOT_PREFIX="/home/coder/micromamba"
ENV MAMBA_EXE="/bin/micromamba"
ENV ENV_NAME=singulab

ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/Chicago"
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
	--mount=type=cache,target=/var/lib/apt,sharing=locked \
	apt-get update -y \
	&& apt-get install -y sudo tzdata git ninja-build \
	&& useradd -ms /bin/bash -d /home/$MAMBA_USER $MAMBA_USER --uid $MAMBA_USER_ID --gid $MAMBA_USER_GID \
	&& usermod -aG sudo $MAMBA_USER \
	&& echo "$MAMBA_USER ALL=NOPASSWD: ALL" >> /etc/sudoers \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt-get clean


RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
	--mount=type=cache,target=/var/lib/apt,sharing=locked \
	apt-get update && \
	apt-get --no-install-recommends install -y \
	# Additional dependences
	bzip2 \
	ca-certificates \
	curl \
	exa \
	fonts-liberation \
	git \
	gnupg2 \
	inkscape \
	less \
	locales \
	nano \
	openssh-client \
	openssh-server \
	pandoc \
	sudo \
	systemd \
	systemd-sysv \
	tini \
	unzip \
	wget \
	yadm \
	zsh && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

#############################################
# Copy micromamba python
#############################################

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

# CMD ["/bin/bash"]

#############################################
# Copy code-server
#############################################

COPY --from=code-server /usr/bin/code-server /usr/bin/code-server
COPY --chown=${MAMBA_USER_ID}:${MAMBA_USER_GID} ./coder-entrypoint.sh /usr/local/bin/coder_entrypoint.sh
COPY --chown=${MAMBA_USER_ID}:${MAMBA_USER_GID} ./local_coder_entrypoint.sh /usr/bin/coder_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "/usr/local/bin/coder_entrypoint.sh", "/usr/bin/coder_entrypoint.sh"]

#############################################
# Build the singulab python env
#############################################

WORKDIR /home/${MAMBA_USER}/work/
COPY --chown=${MAMBA_USER_ID}:${MAMBA_USER_GID} ./environment.yml .
COPY --chown=${MAMBA_USER_ID}:${MAMBA_USER_GID} ./scRNAseq.yml .

RUN micromamba create -f environment.yml && \
  micromamba clean --all --yes

# RUN micromamba install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia && micromamba install jax jaxlib -c conda-forge

COPY --chown=${MAMBA_USER_ID}:${MAMBA_USER_GID} . .


# Activate micromamba in the bash prompt by adding it to .bashrc
COPY --chown=coder:coder ./activate_mamba.sh /home/coder/activate_mamba.sh
RUN echo "source /home/coder/activate_mamba.sh" >> /home/coder/.bashrc

### Stop caching the docker build
ARG CACHEBUST=1

CMD ["/bin/bash"]