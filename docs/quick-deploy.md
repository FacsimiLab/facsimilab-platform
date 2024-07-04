# Quickly deploy Facsimilab in your current directory 

```sh
docker run -it --rm --name Facsimilab-test \
    --gpus all \
    -v $(pwd):/home/coder/work \
    facsimilab-full:v0.2.0 \
    bash
```


## Non-GPU Test

```sh
docker run -it --rm --name Facsimilab-NonGPU \
    -v $(pwd):/home/coder/work \
    facsimilab-main:v0.2.1 \
    bash
```