# Quickly deploy Facsimilab in your current directory

```sh
docker run -it --rm --name Facsimilab-GPUTest \
    --gpus 0 \
    -v $(pwd):/home/coder/work \
    -p 8888:8888 \
    pranavmishra90/facsimilab-full:latest \
    bash
```

## Non-GPU Test

```sh
docker run -it --rm --name Facsimilab-NonGPU \
    -v $(pwd):/home/coder/work \
    -p 8888:8888 \
    pranavmishra90/facsimilab-full:latest \
    bash
```
