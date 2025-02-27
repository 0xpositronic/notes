

## [2025-02-24 18:32]
class MyModule(nn.Module):
def __init__(self, weights: t.Tensor, biases: t.Tensor):
super().__init__()
self.weights = nn.Parameter(weights) # wrapping a tensor in nn.Parameter
self.biases = nn.Parameter(biases) # so torch can update them properly