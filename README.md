# FacsimiLab Docker Images

You can select from our current recommended image `pranavmishra90/facsimilab-vscoder-cpu:latest`. It contains a `conda` (`micromamba`) based python environment which follows our fully functional bare metal (non-Docker) environment ([scRNAseq.env environment packages](./library/scRNAseq.yml)).

We are also working on a CUDA enabled docker image which allows for GPU accelerated analysis `pranavmishra90/facsimilab-vscoder-gpu:dev`

### FacsimiLab-VSCoder

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
mamba env create -f facsimilab.yml
```

## SinguLab is now FacsimiLab

We have renamed the FacsimiLab project to *FacsimiLab*!

Our new name is a portmonteau of [**facsimile**](https://www.merriam-webster.com/dictionary/facsimile) and **laboratory**. Not only is it "more unique", it is also more reflective of the project's objective: to create a reproducible research environment with identical packages and platforms.  Using environment files and [OCI](https://opencontainers.org/) compatible build instructions, FacsimiLab will be the path forward for replacing "it works on my computer" with "I've looked at your data and reproduced your results".

We hope you follow our project's ongoing development at [github.com/FascimiLab](https://github.com/FacsimiLab) and [pranavmishra90/FacsimiLab-platform](https://github.com/pranavmishra90/FacsimiLab-platform).

The GitHub repository at [pranavmishra90/FacsimiLab](https://github.com/pranavmishra90/FacsimiLab) is now archived.

## License

[MIT License](./LICENSE)

Copyright (c) 2022 Pranav Kumar Mishra



