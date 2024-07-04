# FacsimiLab Docker Images

You can select from our current recommended image `pranavmishra90/facsimilab-full:latest`. It contains a `conda` (`micromamba`) based python environment which follows our fully functional bare metal (non-Docker) environment.

## Platform Images

- **facsimilab-base**: Adds functionality for python (micromamba) and a number of apt packages into the CUDA capable `nvidia/cuda:12.1.0-base-ubuntu22.04`


- **facsimilab-main**: Creates a python 3.11 [base environment](./docker/main/environment.yml) with the essentials for statistics, graphing, documention, and reproducible science with `datalad`, `quarto`, and `rclone` 


- **facsimilab-full**: Creates the python 3.11 [full facsimilab environment](./docker/full/environment.yml) with a large number of packages capable of completing a variety of experiments, including:
	- Clininal research with REDCap: `pycap`
	- Next generation -omics: `scvi`, `scanpy`, `gseapy`, `pydeseq2`, `celltypist`, etc.
	- Machine learning: `scikit-learn`, `leidenalg`, `imbalanced-learn`
	- Reproducible research (file versioning, archival, and documentation): `datalad`, `git`, `git-annex`, `rclone`, `quarto`
	- `jupyter` notebooks with `papermill` automation

### Important Components

- [Micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html#micromamba): A lightweight form of mamba, which itself is far faster than conda in creating python virtual environments
- [Datalad](https://github.com/datalad/datalad) - version controlling large datasets
- [Git-Annex](https://git-annex.branchable.com/) - included with Datalad
- [Quarto](https://quarto.org/) - generate documentation programmatically
- [Rclone](https://rclone.org/) - add additional git remotes (siblings) for `datalad`
- [Nvidia CUDA](https://developer.nvidia.com/cuda-toolkit) - GPU accelerated analysis

## Quick Install and Testing

You can quickly deploy FacsimiLab using the docker run commands found in [Quick Deploy](./docs/quick-deploy.md). For futher testing, a `docker-compose.yaml` file is available in `/testing/`.



## Building

```sh
cd docker
bash build-all.sh
```


## License

[MIT License](./LICENSE)

Copyright (c) 2022-2024 Pranav Kumar Mishra

Licenses and references of open-source projects that contribute significantly to FacsimiLab are listed in [Licenses](./licenses/licenses-overview.md)
