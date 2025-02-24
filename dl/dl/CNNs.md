### Why we need them
Images have a lot of dimensions (millions of pixels) and in a dense network we would have even more neurons in the hidden layer.
And nearby pixels in an image statistically related while dense networks treat each input independently. So a dense network shows no difference even if we randomly permutate location of the pixels.
And images are stable under geometric transformations. An image of a tree is still a tree when we leftward shift it by 3 pixels. But this changes every input to a dense network.

Convolutional layers process each local image region independently using parameters shared across the whole image. Thus using less parameters and not needing to re-learn interpretation of each pixel at every position.

A dense network can simulate a cnn if most weights are set to zero and some have the condition of being equal.
![[Pasted image 20241211164035_1.png]]

### Invariance and equivariance
function $f[x]$ of image x is invariant to a transformation $t[x]$ if:
#### $f[t[x]] = f[x]$

**Image classification** networks should be invariant to geometric transformations. Meaning image should be identified as same even after applying rotation, flip, warp, translation...

$f[x]$ is equivariant/covariant to $t[x]$ for image $x$ if:
#### $f[t[x]] = t[f[x]]$
meaning transformations applied to input effect the output in the same way.
**per-pixel segmentation** models should be equivariant to transformations. So if the input is rotated segmentation map should be rotated too.

pooling mechanisms induce partial invariance to translations.
while the conv layers are equivariant to translation.
## Convolution
### 1D example
convolution from input x to z vectors:
each z element is a weighted sum of the nearby inputs from x.
**kernel** is the same weights that used in every position of kernel-size intervals.
#### $z_i = w_1x_{i-1} + w_2x_i + w_3x_{i+1}$
where vector w = $[w_1,w_2,w_3]^T$ is the kernel
![[Pasted image 20241211155418_1.png]]
this operation is equivariant. If we flip the input output also gets flipped.

![[Pasted image 20241211161245_1.png]]

#### Padding 
at the edges of the image when kernel aligns with the non-existing pixels we can:
fill edges with zeros
reflect the input
these are same-convolutions. Keeping the output size same.

discard outputs created by edges.
These valid convolutions(making kernel fully align with the input)
do not add extra information from the edges but descrease the output size.

#### kernel size and dilation
typically an odd value so it can be centered around the current location.
To overcome increasing weight sizes as we increase kernel size we can use **dilated** kernels which we can achive by putting zeros between kernel positions. Number of zeros between 2 kernel weights is the dilation rate.

### Channels
If our network only uses one convolution most features would be lost as we're doing an average and clipping results with an activation function.
So we apply multiple convolutions in parraler to the data. Each producing new set of hidden variables. Termed as **Feature map / channel**. So two convolutions applied to 1D data would result in a 2D array of hidden states.
![[Pasted image 20241211164249_1.png]]

#### READ 10.2.7 - 167

### Receptive field
number of input pixels contributing the result of a single output pixel

#### downsampling
scaling down the output = increasing receptive field
- subsampling (only selecting some pixels at intervals)
- stride of 2
- maxpooling
- mean pooling
each operation applied seperately to every channel so number of channels do not change
##### pooling 
max pooling can be thought of applying![[Pasted image 20241212040349_1.png]]
#### upsampling
useful when output is also an image
- duplication across all channels at each position
- max unpooling: undoing previous maxpooling operation (putting values back into a larger matrix in the posotions where they were taken from)
- bilinear interpolation between inputs to fill missing values.
- transposed convolution: inverse of using a stride to downsample. Each input contributes to three of the outputs. Associated weight matrix is the transpose of the matrix we would use for downsampling.
![[Pasted image 20241211180706_1.png]]

#### Changing number of channels
we might need to change the number of channels in a hidden layer to be able to combine our represantations with another parraler computation.
To achieve this we apply convolution with kernel size one. This kernel takes a weighted sum across the input channels. We can repeat this with more 1x1xC kernels to create as many channels as we want in the output.
this can be thought of working in the perpendicular dimension to the one we usually use.
![[Pasted image 20241211181656_1.png]]





![[Pasted image 20241212040618_1.png]]

![[Pasted image 20241212040734_1.png]]![[Pasted image 20241212040756_1.png]]