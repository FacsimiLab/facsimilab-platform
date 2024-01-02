# The MIT License (MIT)
# Copyright (c) 2022 Pranav Kumar Mishra (Rush University, Chicago, IL, USA)

# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# Dockerfile for jupyter/scipi-notebook modified by:
# Pranav Kumar Mishra to add the following features:

# Python version 3.9 (not 3.10 which is the current version and had breaking changes)
# Datalad - version controlling large datasets
# Nbdime - easy to visualized diffs for jupyter notebooks
# Pre-Commit - checks on code before commiting changes
# Git-Annex - needed for datalad
# Zsh - newer shell
# Exa - a newer form of ls
# GnuPG - PGP encryption
# Rclone
# git-annex-remote-rclone
# Yadm - yet another dotfile manager
# Unzip
# Jupyterthemes
# Coder/code-server




# Ubuntu 22.04 (jammy)
# https://hub.docker.com/_/ubuntu/?tab=tags&name=jammy

FROM ubuntu:22.04
RUN echo exit 101 > /usr/sbin/policy-rc.d && chmod +x /usr/sbin/policy-rc.d

#########################
ARG IMAGE_VERSION="0.0.20"
#########################

LABEL org.opencontainers.image.title="SinguLab"
LABEL version=${IMAGE_VERSION}}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra (Rush University)'
LABEL description="A docker image which creates a jupyter notebook environment, version controlled by Datalad, for bioinformatics and datascience projects."
LABEL org.opencontainers.image.source="https://github.com/pranavmishra90/SinguLab"
LABEL org.opencontainers.image.licenses="MIT WITH BSD-3-Clause-Modification"


ARG NB_USER="coder"
ARG NB_UID="1000"
ARG NB_GID="100"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
ENV DEBIAN_FRONTEND noninteractive
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && \
    apt-get --no-install-recommends install -y \
    # - bzip2 is necessary to extract the micromamba executable.
    bzip2 \
    curl \
    ca-certificates \
    fonts-liberation \
    locales \
    # - pandoc is used to convert notebooks to html files
    #   it's not present in arm64 ubuntu image, so we install it here
    pandoc \
    # - run-one - a wrapper script that runs no more
    #   than one unique  instance  of  some  command with a unique set of arguments,
    #   we use `run-one-constantly` to support `RESTARTABLE` option
    run-one \
    sudo \
    # - tini is installed as a helpful container entrypoint that reaps zombie
    #   processes and such of the actual executable we want to start, see
    #   https://github.com/krallin/tini#why-tini for details.
    tini \
    wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install all OS dependencies for fully functional notebook server
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && \
    apt-get --no-install-recommends install -y \
    # Common useful utilities
    git \
    nano \
    tzdata \
    vim \
    # Inkscape is installed to be able to convert SVG files
    inkscape \
    # git-over-ssh
    openssh-client \
    # less is needed to run help in R
    # see: https://github.com/jupyter/docker-stacks/issues/1588
    less \
    # nbconvert dependencies
    # https://nbconvert.readthedocs.io/en/latest/install.html#installing-tex
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-plain-generic && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure environment
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    NB_USER="${NB_USER}" \
    NB_UID=${NB_UID} \
    NB_GID=${NB_GID} \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH="${CONDA_DIR}/bin:${PATH}" \
    HOME="/home/${NB_USER}"

# Copy a script that we will use to correct permissions after running certain commands
COPY fix-permissions /usr/local/bin/fix-permissions
RUN chmod a+rx /usr/local/bin/fix-permissions

# Enable prompt color in the skeleton .bashrc before creating the default NB_USER
# hadolint ignore=SC2016
RUN sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' /etc/skel/.bashrc && \
    # Add call to conda init script see https://stackoverflow.com/a/58081608/4413446
    echo 'eval "$(command conda shell.bash hook 2> /dev/null)"' >> /etc/skel/.bashrc

# Create NB_USER with name ${NB_USER} user with UID=1000 and in the 'users' group
# and make sure these dirs are writable by the `users` group.
RUN echo "auth requisite pam_deny.so" >> /etc/pam.d/su && \
    sed -i.bak -e 's/^%admin/#%admin/' /etc/sudoers && \
    # sed -i.bak -e 's/^%sudo/#%sudo/' /etc/sudoers && \
    useradd -l -m -s /bin/bash -N -u "${NB_UID}" "${NB_USER}" && \
    mkdir -p "${CONDA_DIR}" && \
    chown "${NB_USER}:${NB_GID}" "${CONDA_DIR}" && \
    chmod g+w /etc/passwd && \
    fix-permissions "${HOME}" && \
    fix-permissions "${CONDA_DIR}"

USER ${NB_UID}

# Pin python version here, or set it to "default"
ARG PYTHON_VERSION=3.10

# Setup work directory for backward-compatibility
RUN mkdir "/home/${NB_USER}/work" && \
    fix-permissions "/home/${NB_USER}"

# Download and install Micromamba, and initialize Conda prefix.
#   <https://github.com/mamba-org/mamba#micromamba>
#   Similar projects using Micromamba:
#     - Micromamba-Docker: <https://github.com/mamba-org/micromamba-docker>
#     - repo2docker: <https://github.com/jupyterhub/repo2docker>
# Install Python, Mamba, Jupyter Notebook, Lab, and Hub
# Generate a notebook server config
# Cleanup temporary files and remove Micromamba
# Correct permissions
# Do all this in a single RUN command to avoid duplicating all of the
# files across image layers when the permissions change
COPY --chown="${NB_UID}:${NB_GID}" initial-condarc "${CONDA_DIR}/.condarc"
WORKDIR /tmp
RUN set -x && \
    arch=$(uname -m) && \
    if [ "${arch}" = "x86_64" ]; then \
    # Should be simpler, see <https://github.com/mamba-org/mamba/issues/1437>
    arch="64"; \
    fi && \
    wget -qO /tmp/micromamba.tar.bz2 \
    "https://micromamba.snakepit.net/api/micromamba/linux-${arch}/latest" && \
    tar -xvjf /tmp/micromamba.tar.bz2 --strip-components=1 bin/micromamba && \
    rm /tmp/micromamba.tar.bz2 && \
    PYTHON_SPECIFIER="python=${PYTHON_VERSION}" && \
    if [[ "${PYTHON_VERSION}" == "default" ]]; then PYTHON_SPECIFIER="python"; fi && \
    # Install the packages
    ./micromamba install \
    --root-prefix="${CONDA_DIR}" \
    --prefix="${CONDA_DIR}" \
    --yes \
    "${PYTHON_SPECIFIER}" \
    'mamba' \
    'notebook' \
    'jupyterhub' \
    'jupyterlab' && \
    rm micromamba && \
    # Pin major.minor version of python
    mamba list python | grep '^python ' | tr -s ' ' | cut -d ' ' -f 1,2 >> "${CONDA_DIR}/conda-meta/pinned" && \
    jupyter notebook --generate-config && \
    mamba clean --all -f -y && \
    npm cache clean --force && \
    jupyter lab clean && \
    rm -rf "/home/${NB_USER}/.cache/yarn" && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

EXPOSE 8888

# Configure container startup
ENTRYPOINT ["tini", "-g", "--"]
CMD ["start-notebook.sh"]

# Copy local files as late as possible to avoid cache busting
COPY start.sh start-notebook.sh start-singleuser.sh /usr/local/bin/
# Currently need to have both jupyter_notebook_config and jupyter_server_config to support classic and lab
COPY jupyter_server_config.py /etc/jupyter/

# Fix permissions on /etc/jupyter as root
USER root

# Legacy for Jupyter Notebook Server, see: [#1205](https://github.com/jupyter/docker-stacks/issues/1205)
RUN sed -re "s/c.ServerApp/c.NotebookApp/g" \
    /etc/jupyter/jupyter_server_config.py > /etc/jupyter/jupyter_notebook_config.py && \
    fix-permissions /etc/jupyter/

# HEALTHCHECK documentation: https://docs.docker.com/engine/reference/builder/#healthcheck
# This healtcheck works well for `lab`, `notebook`, `nbclassic`, `server` and `retro` jupyter commands
# https://github.com/jupyter/docker-stacks/issues/915#issuecomment-1068528799
HEALTHCHECK  --interval=15s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -O- --no-verbose --tries=1 --no-check-certificate \
    http${GEN_CERT:+s}://localhost:8888${JUPYTERHUB_SERVICE_PREFIX:-/}api || exit 1

# # Install Python 3 packages
# RUN mamba install --quiet --yes \
#     'altair' \
#     'beautifulsoup4' \
#     'bokeh' \
#     'bottleneck' \
#     'cloudpickle' \
#     'conda-forge::blas=*=openblas' \
#     'cython' \
#     'dask' \
#     'dill' \
#     'h5py' \
#     'ipympl'\
#     'ipywidgets' \
#     'jupyterthemes' \
#     'matplotlib-base' \
#     'nbdime' \
#     'nodejs' \
#     'numba' \
#     'numexpr' \
#     'pandas' \
#     'patsy' \
#     'pre-commit' \
#     'protobuf' \
#     'pytables' \
#     'scikit-image' \
#     'scikit-learn' \
#     'scipy' \
#     'seaborn' \
#     'sqlalchemy' \
#     'statsmodels' \
#     'sympy' \
#     'widgetsnbextension'\
#     'xlrd' && \
#     mamba clean --all -f -y && \
#     fix-permissions "${CONDA_DIR}" && \
#     fix-permissions "/home/${NB_USER}"

# Import matplotlib the first time to build the font cache.
ENV XDG_CACHE_HOME="/home/${NB_USER}/.cache/"

#############################################################################

# Packages which have been added by Pranav

# ---------------------------------------------------------------------------

RUN wget -qO /tmp/cuda-keyring_1.1-1_all.deb "https://developer.download.nvidia.com/compute/cuda/repos/debian11/x86_64/cuda-keyring_1.1-1_all.deb" && dpkg -i /tmp/cuda-keyring_1.1-1_all.deb

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
    build-essential \
    software-properties-common


RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && \
    apt-get --no-install-recommends install -y \
    # Additional dependences
    openssh-server \
    exa \
    gnupg2 \
    systemd \
    systemd-sysv \
    unzip \
    yadm \
    zsh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


# RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
#     --mount=type=cache,target=/var/lib/apt,sharing=locked \
#     apt-get update && \
#     apt-get --no-install-recommends install -y \
#     linux-headers-$(uname -r) && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*



# RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
#     --mount=type=cache,target=/var/lib/apt,sharing=locked \
#     apt-get update && \
#     apt-get --allow-releaseinfo-change update && \
#     apt-get --no-install-recommends install -y \
#     install cuda && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*


# Install python packages using mamba
COPY ./environment.yml /home/${NB_USER}/environment.yml
RUN cat /home/${NB_USER}/environment.yml && \
    mamba env create -f /home/${NB_USER}/environment.yml && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Clone scRNAseq into another environment called "quarto" for document rendering
RUN mamba create --name quarto --clone scRNAseq && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"


## GPG passthrough for coder/coder

RUN mkdir "/home/${NB_USER}/.gnupg" && \
    fix-permissions "/home/${NB_USER}"


# https://coder.com/docs/coder/latest/guides/customization/gpg-forwarding
RUN echo  "StreamLocalBindUnlink yes" >> /etc/ssh/sshd_config && \
    systemctl --global mask gpg-agent.service \
    gpg-agent.socket gpg-agent-ssh.socket \
    gpg-agent-extra.socket gpg-agent-browser.socket && \
    systemctl enable ssh

# VSCode from within Jupyter
ARG code_server_proxy_wheel="jupyter_codeserver_proxy-1.0b3-py3-none-any.whl"
RUN curl -fsSL https://code-server.dev/install.sh | sh && \
    rm -rf "${HOME}/.cache"

ENV CODE_WORKINGDIR="/home/${NB_USER}/work"
# code-server proxy copy package ----
COPY ./${code_server_proxy_wheel} /home/${NB_USER}/


# Rclone
COPY install-rclone.sh /home/${NB_USER}
RUN bash /home/${NB_USER}/install-rclone.sh
ENV PATH $PATH:/usr/bin/rclone

# Git-Annex Rclone Remote
COPY git-annex-remote-rclone /usr/local/bin/
COPY rclone.conf /home/${NB_USER}/.config/rclone/rclone.conf
COPY requirements.txt .

RUN adduser ${NB_USER} sudo

RUN echo "${NB_USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${NB_USER}\
    && chmod 0440 /etc/sudoers.d/${NB_USER}

# ----------------------------------------------------------------------------
ARG CACHEBUST=1
##############################################################################
# Switch back to ${NB_USER} to avoid accidental container runs as root


USER ${NB_UID}

WORKDIR "${HOME}/lab"