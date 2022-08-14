# Datascience Docker Image

Dockerfile for `jupyter/scipi-notebook` modified by:
Pranav Kumar Mishra to add the following features:

- Python version 3.8 (not 3.10 which is the current version on `jupyter/scipi-notebook` and had breaking changes)
- [Datalad](https://github.com/datalad/datalad) - version controlling large datasets
- [Git-Annex](https://git-annex.branchable.com/) - included with Datalad
- [Nbdime](https://github.com/jupyter/nbdime) - easy to visualized diffs for jupyter notebooks
- [Pre-Commit v2.20.0](https://github.com/pre-commit/pre-commit) - checks on code before commiting changes
- [Zsh](https://www.zsh.org/)
- [yadm](https://github.com/TheLocehiliosan/yadm) - yet another dotfile manager
- [GnuPG](https://gnupg.org/) - PGP encryption
- [Rclone](https://github.com/rclone/rclone)
- [Exa](https://the.exa.website/) - a newer form of ls
- Unzip

## Building the image

Build the first image

```sh
# cd docker
docker build -t datascience:latest .
```

Create alternate tags
```
docker tag datascience:latest gitea.mishracloud.com/rush/datascience:latest
```


Push to Gitea
```
docker push gitea.mishracloud.com/rush/datascience:latest
```
After testing, create the additional tags


```sh
docker tag datascience:latest pranavmishra90/datascience:latest
docker tag datascience:latest pranavmishra90/datascience:v0.0.<increment number here>
```

Push to DockerHub
```
docker push --all-tags datascience
```

## Initial setup

Run the following commands

```
pre-commit install
