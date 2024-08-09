import jax
import jaxlib
import flax
import torch

import os
import sys
import tempfile
from IPython.display import display, Markdown

import scanpy as sc
import scvi
import torch

# Print library versions
print("JAX version:", jax.__version__)
print("JAXlib version:", jaxlib.__version__)
print("Flax version:", flax.__version__)
print("PyTorch version:", torch.__version__)


# Print CUDA compatibility
#print("JAXlib CUDA version:", jaxlib.cuda_version)
print("PyTorch CUDA version:", torch.version.cuda)

# Check if Pytorch has succssfully detected and loaded an Nvidia GPU with CUDA support
if torch.cuda.is_available():

    print("## Facsimilab: Nvidia CUDA GPU Detected")
    print(f"GPU Name: {torch.cuda.get_device_name(0)}")
    print(f"GPU Available: {torch.cuda.is_available()}")

    print("### System Information")

    print(f"- Python version: `{sys.version}` \n - PyTorch version: `{torch.__version__}`\n - CUDNN version: `{torch.backends.cudnn.version()}`\n - Number CUDA Devices: `{torch.cuda.device_count()}`")

    print("### Devices")

    print(f"- Available devices `{torch.cuda.device_count()}`\n - Active CUDA device: `{torch.cuda.current_device()}`")

    print("Python starts numbering from '0'. Therefore, the `Active CUDA device` name/number is expected to be `0` above.")

else:
    print("## No CUDA GPU Detected")
    print("This notebook will use the CPU instead of the GPU. Analysis time is expected to be _**significantly longer, but still possible.**_")

    print(f"GPU Available: {torch.cuda.is_available()}")

    print("### System Information")

    print(f"- Python version: `{sys.version}` \n - PyTorch version: `{torch.__version__}`\n - CUDNN version: `{torch.backends.cudnn.version()}`\n - Number CUDA Devices: `{torch.cuda.device_count()}`")