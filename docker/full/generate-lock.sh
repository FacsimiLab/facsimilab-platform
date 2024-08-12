#!/bin/bash

conda-lock --mamba --kind lock -p linux-64 -f environment.yml --with-cuda 12.4 --lockfile facsimilab-conda-lock.yml --log-level INFO 2>&1 | tee ../log/conda-lock.log
