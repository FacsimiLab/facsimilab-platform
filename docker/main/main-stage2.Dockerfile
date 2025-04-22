# syntax=docker/dockerfile:1

#############################
# Stage 2: 
# Add / install binaries
#############################

############################
ARG IMAGE_VERSION="dev"
ARG PYTHON_ENV_IMAGE_VERSION="dev"
ARG IMAGE_REPO_PREFIX="pranavmishra90/"
ARG RCLONE_VERSION="1.67"
############################

FROM rclone/rclone:${RCLONE_VERSION} AS rclone

FROM ${IMAGE_REPO_PREFIX}facsimilab-main-env:${PYTHON_ENV_IMAGE_VERSION} AS main-image-builder

# Add rclone
COPY --from=rclone /usr/local/bin/rclone /usr/local/bin/

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

# Install packages
USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
		--mount=type=bind,source=quarto.deb,target=/tmp/quarto.deb \
		usermod -aG sudo $MAMBA_USER && \
		echo "$MAMBA_USER ALL=NOPASSWD: ALL" >> /etc/sudoers && \
		apt install -y /tmp/quarto.deb && \
		quarto install tinytex && \
		/usr/bin/pipx install conda-lock && \
		mkdir -p /config/rclone && \
		apt clean && \
		rm -rf /var/lib/apt/lists/* 

RUN chown -R $MAMBA_USER:$MAMBA_USER /opt /tmp

# Set login username and work directory
USER $MAMBA_USER
WORKDIR /home/${MAMBA_USER}/work

RUN	/usr/bin/pipx install conda-lock

RUN echo "Facsimilab-Main $facsimilab_version_num" > /home/${MAMBA_USER}/.server_name.txt
COPY --chown=$MAMBA_USER:$MAMBA_USER /home /home/${MAMBA_USER}/
RUN cat /home/${MAMBA_USER}/.profile > /home/${MAMBA_USER}/.bash_aliases


SHELL ["/usr/local/bin/_dockerfile_shell.sh"]

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]
# Optional: if you want to customize the ENTRYPOINT and have a conda
# environment activated, then do this:
# ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "my_entrypoint_program"]

CMD ["/bin/bash"]

###############################################################################
# Labels
###############################################################################
ARG IMAGE_VERSION="dev"
ARG ISO_DATETIME="date"
ARG MAIN_ENV_SHA="SHA"

LABEL version=${IMAGE_VERSION}
LABEL org.opencontainers.image.title="FacsimiLab-Main"
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL org.opencontainers.image.description="A docker image for reproducible science, leveraging Python, Nvidia CUDA, Datalad, Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/FacsimiLab/FacsimiLab-platform"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.created=${ISO_DATETIME}
LABEL org.opencontainers.image.base.name="docker.io/pranavmishra90/facsimilab-main-env:${IMAGE_VERSION}"
LABEL org.opencontainers.image.base.digest=${MAIN_ENV_SHA}