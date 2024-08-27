#!/opt/conda/envs/facsimilab/bin/python
import sys
import os
import datetime as date

print("## FacsimiLab Full Image Tests")

print(f"Tested on {date.datetime.now().isoformat(timespec='seconds')}")

print(f"Python path: {sys.executable}")
print("")

import scanpy as sc
import scvi
import torch

from scipy.sparse import csr_matrix
import pandas as pd
import numpy as np

import jax
import jaxlib
import flax


# Print library versions
print("### FacsimiLab Full - Python Packages   ")
print("   ")
print("   ")
print("- JAX version:", jax.__version__)
print("- JAXlib version:", jaxlib.__version__)
print("- Flax version:", flax.__version__)
print("- PyTorch version:", torch.__version__)

print("- PyTorch CUDA version:", torch.version.cuda)
print("- scVI version:", scvi.__version__)
print("- Scanpy version:", sc.__version__)
print("   ")
print("   ")


# Check if Pytorch has succssfully detected and loaded an Nvidia GPU with CUDA support
if torch.cuda.is_available():

    print("## Facsimilab: Nvidia CUDA GPU Detected")
    print("   ")
    print("   ")
    print(f"- GPU Name: {torch.cuda.get_device_name(0)}")
    print(f"- GPU Available: {torch.cuda.is_available()}")
    print("   ")
    print("   ")
    print("### System Information")
    print("   ")
    print("   ")
    print(
        f"- Python version: `{sys.version}` \n- PyTorch version: `{torch.__version__}`\n- CUDNN version: `{torch.backends.cudnn.version()}`\n- Number CUDA Devices: `{torch.cuda.device_count()}`"
    )
    print("   ")
    print("   ")

    print("### Devices")
    print("   ")
    print("   ")
    print(
        f"- Available devices `{torch.cuda.device_count()}`\n- Active CUDA device: `{torch.cuda.current_device()}`"
    )
    print("   ")
    print("   ")
    print(
        "Python starts numbering from '0'. Therefore, the `Active CUDA device` name/number is expected to be `0` above."
    )

else:
    print("## No CUDA GPU Detected")
    print("   ")
    print("   ")
    print(
        "This notebook will use the CPU instead of the GPU. Analysis time is expected to be _**significantly longer, but still possible.**_"
    )

    print(f"GPU Available: {torch.cuda.is_available()}")

    print("### System Information")
    print("   ")
    print("   ")
    print(
        f"- Python version: `{sys.version}` \n- PyTorch version: `{torch.__version__}`\n- CUDNN version: `{torch.backends.cudnn.version()}`\n- Number CUDA Devices: `{torch.cuda.device_count()}`"
    )
