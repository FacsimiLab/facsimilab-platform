#!/bin/bash

cd $(git rev-parse --show-toplevel)

cd docker/full

conda-lock --mamba --kind lock -p linux-64 -f environment.yml --with-cuda 12.4 --lockfile ./tmp/facsimilab-conda-lock.yml --log-level INFO 2>&1 | tee ../log/conda-lock.log

# cp ./tmp/facsimilab-conda-lock.yml ./facsimilab.conda-lock.yml
# conda-lock install -p ./env ./facsimilab.conda-lock.yml