### Advantages
ReLU has a derivative of 1 for positive values
this contributes to stability and the efficiency of the training.
In contrast to derivatives of sigmoid functions which saturate (becomes close to zero) in the both ends

### Disadvantages
*Dying ReLU problem*
Derivative is 0 for all negative inputs
so if all relu's produce negative inputs our network cannot learn
alternatives:
- leaky relu: 0.1 slope for negative values
- parametric relu: negative slope is a learnable parameter
- concatenated relu: produces two outputs, one is regular relu, other clips above zero