import torch
import sys
if torch.cuda.is_available():
   print(torch.cuda.get_device_name(0))
   print(torch.cuda.is_available())
   dev = "cuda:0"
   print("using gpu")
   print('__Python VERSION:', sys.version)
   print('__pyTorch VERSION:', torch.version)
   print('__CUDA VERSION', )
   print('__CUDNN VERSION:', torch.backends.cudnn.version())
   print('__Number CUDA Devices:', torch.cuda.device_count())
   print('__Devices')
   print('Active CUDA Device: GPU', torch.cuda.current_device())
   print ('Available devices ', torch.cuda.device_count())
   print ('Current cuda device ', torch.cuda.current_device()) device = torch.device(dev)
   #test tensor
   a = torch.zeros(4,3)
   a = a.to(device)
else:
   dev = "cpu"
   print("using cpu")

print("finish testing process!")