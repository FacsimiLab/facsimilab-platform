# v0.1.0 SinguLab is now FacsimiLab

https://github.com/pranavmishra90/SinguLab/commit/b4295c63d83a31a735a3d83116fad794e401e29e

We have renamed the FacsimiLab project to _FacsimiLab_!

Our new name is a portmonteau of [**facsimile**](https://www.merriam-webster.com/dictionary/facsimile) and **laboratory**. Not only is it "more unique", it is also more reflective of the project's objective: to create a reproducible research environment with identical packages and platforms. Using environment files and [OCI](https://opencontainers.org/) compatible build instructions, FacsimiLab will be the path forward for replacing "it works on my computer" with "I've looked at your data and reproduced your results".

We hope you follow our project's ongoing development at [github.com/FascimiLab](https://github.com/FacsimiLab) and [pranavmishra90/FacsimiLab-platform](https://github.com/pranavmishra90/FacsimiLab-platform).

The GitHub repository at [pranavmishra90/FacsimiLab](https://github.com/pranavmishra90/FacsimiLab) is now archived.

# v0.0.30

**Update python environment**

Python is now at version 3.10 with updated / added libraries:

- nbclient > 0.7
- pandas = 2.1
- pingouin = 0.5
- xlswriter = 3.1
- pyreadstat = 1.2
- matplotlib= 3.8
- seaborn > 0.12
- scikit-image = 0.22
- mdutils = 1.6

**Reorganization**

/docker folder is renamed to /jupyter-server since there are multiple docker images in this repository
/vscoder represents the active area of development

# v0.0.10

- Add support for coder/coder
- Removed yadm from docker-compose
- Improved readme

# v0.0.9

Add:

- gpg-agent start command `gpg-agent --daemon` to end of the file

Change:

- Username to `coder` rather than `jovyan` in Dockerfile and Readme

Remove:

- Yadm clone inside of container

# v0.0.8

Add:

- Primer3 (`mamba add -c bioconda primer3-py`)

# v0.0.7

Add:

- Rclone
- CACHEBUST for caching only specific docker image layers, then force updating the packages which I have added to the base
- Jupyterthemes

Fix:

- Changed `datalad` source to conda image (was having difficulties getting the latest `apt` based image)
- Repository directory is mapped inside the docker container as `/home/jovyan/lab`

# v0.0.6

## YODA

Following the [Datalad YODA principles](https://f1000research.com/posters/7-1965):

- Created seperate git repository specifically for this docker container, rather than tracking it inside of a larger git repository

## Gitea

- Added Gitea as a docker image repository for testing purposes

## #Dockerfile

### Added packages

- [Zsh](https://www.zsh.org/)
- [yadm](https://github.com/TheLocehiliosan/yadm) - yet another dotfile manager
- [Exa](https://the.exa.website/) - a newer form of ls

### Labels

Used the Docker / OCI label standards to save labels in the docker image
