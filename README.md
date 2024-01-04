# SinguLab Docker Images

## Building the image

You can select from our current recommended image `pranavmishra90/singulab-vscoder` or the original, more bloated, "full featured" image `pranavmishra90/singulab-original`.

### SinguLab-VSCoder

Our new base image is built upon `codercom/code-server:latest`, adding on essential components for conducting single-cell RNA sequencing experiments:

- [Micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html#micromamba): A lightweight form of mamba, which itself is far faster than conda in creating python virtual environments
- [Datalad](https://github.com/datalad/datalad) - version controlling large datasets
- [Git-Annex](https://git-annex.branchable.com/) - included with Datalad

Previously, we were working off a very large base image that was built upon Ubuntu 22 and followed the `jupyter/scipi-notebook` image generation, with modifications.

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
