import jax
import jaxlib
import flax
import torch


# Print library versions
print("JAX version:", jax.__version__)
print("JAXlib version:", jaxlib.__version__)
print("Flax version:", flax.__version__)
print("PyTorch version:", torch.__version__)


# Print CUDA compatibility
#print("JAXlib CUDA version:", jaxlib.cuda_version)
print("PyTorch CUDA version:", torch.version.cuda)