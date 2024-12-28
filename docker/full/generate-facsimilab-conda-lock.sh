#!/bin/bash
echo ""
echo ""
echo "Generating lock file for the FacsimiLab full environment"
echo ""
echo ""

cd $(git rev-parse --show-toplevel)

cd docker/full

if [ -f ./python-env/facsimilab-conda-lock.yml ]; then
    cp ./python-env/facsimilab-conda-lock.yml ./python-env/old-facsimilab-conda-lock.yml
fi

conda-lock --mamba --kind lock -p linux-64 -f ./python-env/environment.yml --with-cuda 12.6 --lockfile ./python-env/facsimilab-conda-lock.yml --log-level INFO 2>&1 | tee ../log/conda-lock.log