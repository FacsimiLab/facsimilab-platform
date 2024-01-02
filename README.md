# SinguLab Docker Images

## Building the image

You can select from our current recommended image `pranavmishra90/singulab-vscoder` or the original, more bloated, "full featured" image `pranavmishra90/singulab-original`.

### SinguLab-VSCoder

Our new base image is built upon `codercom/code-server:latest`, adding on essential components for conducting single-cell RNA sequencing experiments:

- [Micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html#micromamba): A lightweight form of mamba, which itself is far faster than conda in creating python virtual environments
- [Datalad](https://github.com/datalad/datalad) - version controlling large datasets
- [Git-Annex](https://git-annex.branchable.com/) - included with Datalad

Previously, we were working off a very large base image that was built upon Ubuntu 22 and followed the `jupyter/scipi-notebook` image generation, with modifications.

### SinguLab-Original: Jupyter Notebook based image

Dockerfile for `jupyter/scipi-notebook` modified by:
Pranav Kumar Mishra to add the following features:

- Python version 3.9 (not 3.10 which is the current version on `jupyter/scipi-notebook` and had breaking changes)
- [Datalad](https://github.com/datalad/datalad) - version controlling large datasets
- [Git-Annex](https://git-annex.branchable.com/) - included with Datalad
- [Nbdime](https://github.com/jupyter/nbdime) - easy to visualized diffs for jupyter notebooks
- [Pre-Commit v2.20.0](https://github.com/pre-commit/pre-commit) - checks on code before commiting changes
- [Zsh](https://www.zsh.org/)
- [yadm](https://github.com/TheLocehiliosan/yadm) - yet another dotfile manager
- [GnuPG](https://gnupg.org/) - PGP encryption
- [Rclone](https://github.com/rclone/rclone)
- [git-annex-remote-rclone](https://github.com/DanielDent/git-annex-remote-rclone)
- [Exa](https://the.exa.website/) - a newer form of ls
- [Unzip](https://pkgs.org/download/unzip)
- [jupyterthemes](https://github.com/dunovank/jupyter-themes) - theme for jupyter notebooks
- [Primer3](https://github.com/primer3-org) - create RT-qPCR primers

The `CACHEBUST` is looking for the line `ARG CACHEBUST=1`, which breaks the stored image layers. This has been inserted prior to the major modifications I have made, deviating from jupyter's image.

## Building

```sh
cd vscoder
docker build -t singulab:nightly --build-arg CACHEBUST=$(date +%s) .
```

After testing, create the additional tags

```sh
docker tag singulab:nightly pranavmishra90/singulab-vscoder:nightly
docker tag singulab:nightly pranavmishra90/singulab-vscoder:v0.0.<increment number here>
```

Push to DockerHub

```
docker push --all-tags singulab
```
