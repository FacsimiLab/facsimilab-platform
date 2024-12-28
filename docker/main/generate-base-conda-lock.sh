#!/bin/bash
echo ""
echo ""
echo "Generating lock file for the FacsimiLab base environment"
echo ""
echo ""

cd $(git rev-parse --show-toplevel)

cd docker/main

if [ -f ./python-env/base-conda-lock.yml ]; then
    cp ./python-env/base-conda-lock.yml ./python-env/old-base-conda-lock.yml
fi

conda-lock --mamba --kind lock -p linux-64 -f ./python-env/environment.yml --with-cuda 12.6 --lockfile ./python-env/base-conda-lock.yml --log-level INFO 2>&1 | tee ../log/base-conda-lock.log