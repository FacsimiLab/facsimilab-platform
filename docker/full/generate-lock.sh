#!/bin/bash

conda-lock --kind lock -p linux-64 -f environment.yml --with-cuda 12.4 --lockfile facsimilab-conda-lock.yml
