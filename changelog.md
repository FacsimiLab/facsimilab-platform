# v0.0.10
Add support for coder/coder

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
