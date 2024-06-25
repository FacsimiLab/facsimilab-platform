# Quickly deploy Facsimilab in your current directory 

```sh
docker run -it --rm --name Facsimilab \
    --gpus all \
    -v $(pwd):/home/coder/work \
    facsimilab-full:v0.2.0 \
    bash
```
