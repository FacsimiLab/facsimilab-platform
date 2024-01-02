# Use the micromamba image as a source for the python environment manager
FROM mambaorg/micromamba:1.5.0 as micromamba

# Add micromamba into this base image
FROM codercom/code-server:latest


#########################
ARG IMAGE_VERSION="0.0.30"
#########################

LABEL org.opencontainers.image.title="SinguLab-VSCoder"
LABEL version=${IMAGE_VERSION}}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL description="A docker image for bioinformatics and datascience projects, leveraging Python, Datalad, VSCode (code-server), Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/pranavmishra90/SinguLab"
LABEL org.opencontainers.image.licenses="MIT"


USER root

# if your image defaults to a non-root user, then you may want to make the
# next 3 ARG commands match the values in your image. You can get the values
# by running: docker run --rm -it my/image id -a
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

RUN /usr/local/bin/_dockerfile_initialize_user_accounts.sh && \
	/usr/local/bin/_dockerfile_setup_root_prefix.sh

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
	--mount=type=cache,target=/var/lib/apt,sharing=locked \
	apt-get update && \
	apt-get --no-install-recommends install -y \
	build-essential \
	software-properties-common

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
	yadm \
	zsh && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Quarto for documenting research output
COPY ./quarto-1.3.450-linux-amd64.deb /home/${MAMBA_USER}/quarto.deb
RUN apt install -f /home/${MAMBA_USER}/quarto.deb

# Switch to the non-root user
USER $MAMBA_USER

SHELL ["/usr/local/bin/_dockerfile_shell.sh"]

# Optional: if you want to customize the ENTRYPOINT and have a conda
# environment activated, then do this:
# ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "my_entrypoint_program"]
ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]

RUN micromamba shell init --shell bash --root-prefix=~/micromamba

# Install python packages using mamba
COPY --chown=coder:coder ./environment.yml /home/coder/environment.yml
RUN --mount=type=cache,target=/opt/conda/pkgs \
	micromamba install -f /home/coder/environment.yml

# Install Rclone with a Git-Annex Backend
# Rclone
COPY install-rclone.sh /home/${NB_USER}
RUN bash /home/${NB_USER}/install-rclone.sh
ENV PATH $PATH:/usr/bin/rclone

# Git-Annex Rclone Remote
COPY git-annex-remote-rclone /usr/local/bin/
COPY rclone.conf /home/${NB_USER}/.config/rclone/rclone.conf

### Stop caching the docker build
ARG CACHEBUST=1


# Activate micromamba in the bash prompt by adding it to .bashrc
COPY --chown=coder:coder ./activate_mamba.sh /home/coder/activate_mamba.sh
RUN cat /home/coder/activate_mamba.sh >> /home/coder/.bashrc


CMD ["/bin/bash"]