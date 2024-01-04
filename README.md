# SinguLab Docker Images


You can select from our current recommended image `pranavmishra90/singulab-vscoder-cpu:latest`. It contains a `conda` (`micromamba`) based python environment which follows our fully functional bare metal (non-Docker) environment ([scRNAseq.env environment packages](./library/scRNAseq.yml)).

We are also working on a CUDA enabled docker image which allows for GPU accelerated analysis `pranavmishra90/singulab-vscoder-cpu:dev`

### SinguLab-VSCoder

Our new base image is built upon `codercom/code-server:latest`, adding on essential components for conducting single-cell RNA sequencing experiments:

- [Micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html#micromamba): A lightweight form of mamba, which itself is far faster than conda in creating python virtual environments
- [Datalad](https://github.com/datalad/datalad) - version controlling large datasets
- [Git-Annex](https://git-annex.branchable.com/) - included with Datalad
- [Quarto](https://quarto.org/) - generate documentation programmatically

Previously, we were working off a very large base image that was built upon Ubuntu 22 and followed the `jupyter/scipi-notebook` image generation, with modifications.

## Building

```sh
# CPU Based Image
cd vscoder
bash build.sh
```

```sh
# Nvidia GPU Based Image
cd cuda
bash build.sh
```

```sh
# Non-Dockerized Approach
cd library
mamba env create -f singulab.yml
```

## License

[MIT License](./LICENSE)

Copyright (c) 2022 Pranav Kumar Mishra
