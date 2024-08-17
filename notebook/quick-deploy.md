# Quickly deploy Facsimilab in your current directory

```sh
docker run -it --rm --name Facsimilab-GPUTest \
    --gpus 0 \
    -v $(pwd):/home/coder/work \
    -p 8888:8888 \
    -e ENV_NAME=facsimilab \
    pranavmishra90/facsimilab-full:latest \
    bash
```

## Non-GPU Test

```sh
docker run -it --rm --name Facsimilab-NonGPU \
    -v $(pwd):/home/coder/work \
    -p 8888:8888 \
    -e ENV_NAME=facsimilab \
    pranavmishra90/facsimilab-full:latest \
    bash
```

## Packages

```sh
docker run --rm --name Facsimilab-Test \
    --gpus 0 \
    -v $(pwd):/home/coder/work \
    -e ENV_NAME=facsimilab \
    pranavmishra90/facsimilab-full:latest \
    /home/coder/work/testing/full_image.py
```

## Jupyter Server

```sh
docker run -it --rm --name Facsimilab-Jupyter \
    --gpus 0 \
    -v $(pwd):/home/coder/work \
    -p 8888:8888 \
    -e ENV_NAME=facsimilab \
    pranavmishra90/facsimilab-full:latest \
    conda activate facsimilab && nohup jupyter notebook
```
## Main

```sh
docker run -it --rm --name Facsimilab-Main \
    --gpus 0 \
    -v $(pwd):/home/coder/work \
    -p 8888:8888 \
    pranavmishra90/facsimilab-main:latest \
    bash
```