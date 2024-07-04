# Quickly deploy Facsimilab in your current directory 

```sh
docker run -it --rm --name Facsimilab-test \
    --gpus all \
    -v $(pwd):/home/coder/work \
    ghcr.io/pranavmishra90/pranavmishra90/facsimilab-full:v0.2.1 \
    bash
```


## Non-GPU Test

```sh
docker run -it --rm --name Facsimilab-NonGPU \
    -v $(pwd):/home/coder/work \
    ghcr.io/pranavmishra90/pranavmishra90/facsimilab-main:v0.2.1 \
    bash
```