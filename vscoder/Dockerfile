FROM codercom/code-server:latest

# docker buildx build -t pranavmishra90/singulab-vscode:nightly .

# SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

ENV DEBIAN_FRONTEND noninteractive
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
	--mount=type=cache,target=/var/lib/apt,sharing=locked \
	apt-get update && \
	apt-get --no-install-recommends install -y \
	bzip2 \
	curl \
	ca-certificates \
	fonts-liberation \
	locales \
	pandoc \
	sudo \
	tini \
	wget && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
	locale-gen


RUN wget -O /tmp/Mambaforge.sh  "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"

RUN bash /tmp/Mambaforge.sh -b

ARG CACHEBUST=1

RUN touch /root/.bashrc \
	&& ./bin/micromamba shell init -s bash -p /opt/conda  \
	&& grep -v '[ -z "\$PS1" ] && return' /root/.bashrc  > /opt/conda/bashrc   # this line has been modified \
	&& apt-get clean autoremove --yes \
	&& rm -rf /var/lib/{apt,dpkg,cache,log}

# Install python packages using mamba
COPY --chown=coder:coder ./environment.yml /home/coder/environment.yml

RUN mamba env create -f /home/coder/environment.yml

