# Visualizing weigths - 04.02.2024
https://distill.pub/2020/circuits/visualizing-weights/

### visualization of different parts
- Activations: What the network "saw", Like runtime values of variables
- Weights: How the network computes next layer from the previous one, Compiled ASM instructions
- Attributions: why a neuron fired, what neurons influenced by a neruon (not well defined)

### problems with hidden layer weights
- Lack of contextualizations:
	unlike the first layer there is no direct conneciton to observable data space
	connects part that we dont know anything about.
- indirect interaction:
	neurons that influence eachother might be in different parts of the network.
	in a residual network output of one neuron can pass through the additive residual path and interact with a neuron much later in the network
	this can be observed in non-residual parts too if the network learned or has linearity
- Dimentionality and scale:
	hard to visualize the huge multidimentional weigth matricies in human-readable form.

### Using NMF to reduce dimensions of weights
in a convnet input weights for a given neuron have the shape (w, h, input_channels)
input_channels > 3 for all layers after the first(or maybe last) one.
but we can use dimentionality reduction to collapse it into 3 dimensions

![[Pasted image 20250221163534_1.png]]
using one-sided NMF of input weights in  InceptionV1 mixed4d_5x5 where colors represent the 3NMF factors

this doesn't tell us much about what these neurons are doing but we can see the network is learning some spatial structures.

one-sided NMF (NFM where only 1 of the factor matrices must be positive)
can still be usefull for investigating multiple channels at a glance

with this method we can see that in models with global average pooling at the end of conv layers, will have the weights of their last few layers be horizontal bands
this is called [WEIGHT BANDING]
![[Pasted image 20250221164521_1.png]]


## Contextualizing weights with feature visualization
the challenge is not in observing every weight, activation or gradient. 
we have to determine what those values represent.

weight between two conv layers have the shape:
`[relative x position, relative y position, input channels, output channels]`
