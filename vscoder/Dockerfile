# syntax = docker/dockerfile:1.2

# Use the micromamba image as a source for the python environment manager
FROM mambaorg/micromamba:1.5.0 as micromamba

# Add micromamba into this base image
FROM codercom/code-server:4.21.2-debian


#########################
ARG IMAGE_VERSION="0.1.0"
#########################

LABEL org.opencontainers.image.title="FacsimiLab-VSCoder"
LABEL version=${IMAGE_VERSION}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL description="A docker image for bioinformatics and datascience projects, leveraging Python, Datalad, VSCode (code-server), Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/FacsimiLab/FacsimiLab-platform"
LABEL org.opencontainers.image.licenses="MIT"


USER root

ARG HOST_CONDA="/home/pranav/mambaforge/pkgs"

ARG MAMBA_USER=coder
ARG MAMBA_USER_ID=1000
ARG MAMBA_USER_GID=1000
ENV MAMBA_USER=$MAMBA_USER
ENV MAMBA_ROOT_PREFIX="/opt/conda"
ENV MAMBA_EXE="/bin/micromamba"

# Copy the relevant micromamba directories
COPY --from=micromamba "$MAMBA_EXE" "$MAMBA_EXE"
COPY --from=micromamba /usr/local/bin/_activate_current_env.sh /usr/local/bin/_activate_current_env.sh
COPY --from=micromamba /usr/local/bin/_dockerfile_shell.sh /usr/local/bin/_dockerfile_shell.sh
COPY --from=micromamba /usr/local/bin/_entrypoint.sh /usr/local/bin/_entrypoint.sh
COPY --from=micromamba /usr/local/bin/_dockerfile_initialize_user_accounts.sh /usr/local/bin/_dockerfile_initialize_user_accounts.sh
COPY --from=micromamba /usr/local/bin/_dockerfile_setup_root_prefix.sh /usr/local/bin/_dockerfile_setup_root_prefix.sh

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
	gnupg2 \
	inkscape \
	less \
	locales \
	nano \
	openssh-client \
	openssh-server \
	pandoc \
	systemd \
	systemd-sysv \
	sudo \
	tini \
	unzip \
	wget \
	yadm \
	zsh && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
	--mount=type=cache,target=/var/lib/apt,sharing=locked \
	apt-get update && \
	apt-get --no-install-recommends install -y \
	linux-headers-$(uname -r) && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Quarto for documenting research output
COPY ./quarto-1.4.550-linux-amd64.deb /home/${MAMBA_USER}/quarto.deb
RUN apt install -f /home/${MAMBA_USER}/quarto.deb

RUN /usr/local/bin/_dockerfile_initialize_user_accounts.sh && \
	/usr/local/bin/_dockerfile_setup_root_prefix.sh \
	&& usermod -aG sudo $MAMBA_USER \
	&& echo "$MAMBA_USER ALL=NOPASSWD: ALL" >> /etc/sudoers \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt-get clean

# Switch to the non-root user
USER $MAMBA_USER

SHELL ["/usr/local/bin/_dockerfile_shell.sh"]

# Optional: if you want to customize the ENTRYPOINT and have a conda
# environment activated, then do this:
# ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "my_entrypoint_program"]
ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]

RUN micromamba shell init --shell bash --root-prefix=~/micromamba

# Install python packages using mamba into a new environment
COPY --chown=coder:coder ./environment.yml /home/coder/environment.yml
RUN --mount=type=cache,target=${MAMBA_ROOT_PREFIX}/pkgs \
	micromamba create -f /home/coder/environment.yml

# Add the conda environment to path
ENV PATH "$MAMBA_ROOT_PREFIX/bin:$PATH"

### Stop caching the docker build
ARG CACHEBUST=1


# Activate micromamba in the bash prompt by adding it to .bashrc
COPY --chown=coder:coder ./activate_mamba.sh /home/coder/activate_mamba.sh
COPY --chown=coder:coder ./gpu-test.py /home/coder/gpu-test.py
RUN echo "source /home/coder/activate_mamba.sh" >> /home/coder/.bashrc

# Add necessary VSCode extensions
RUN code-server --install-extension ms-python.black-formatter \
	eamodio.gitlens \
	ms-toolsai.jupyter \
	esbenp.prettier-vscode \
	ms-python.python \
	quarto.quarto


CMD ["/bin/bash"]
