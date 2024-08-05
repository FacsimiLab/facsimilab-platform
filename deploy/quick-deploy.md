# Quickly deploy Facsimilab in your current directory

```sh
docker run -it --rm --name Facsimilab-GPUTest \
    --gpus all \
    -v $(pwd):/home/coder/work \
    pranavmishra90/facsimilab-base:v0.2.3 \
    bash
```

## Non-GPU Test

```sh
docker run -it --rm --name Facsimilab-NonGPU \
    -v $(pwd):/home/coder/work \
    pranavmishra90/facsimilab-main:v0.2.3 \
    bash
```
