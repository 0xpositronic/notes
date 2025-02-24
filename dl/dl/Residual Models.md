### ResNet
first use of residual blocks happened with convnets
each block has (BN ReLU and Convolution)x2 before being added back to input. Trial and error shows this is the best order of operations for image classification.
To reduce amount of parameters we use bottlenecked residual blocks
which uses 3 convolutions.
- reduce channels by 1x1 kernel
- regular 3x3 kernel
- 1x1 kernel to increase channels back

## DenseNet
residual blocks add input back to output but we can also concatenate, processed input and input. Increasing represantation size (in terms of conv channels). And we can map back to original size with linear transformation with 1x1 kernel. This allows us to combine input in more complex ways.
Since a convolutional downsampling would change spatial dimensions we cannot concataneta further so the denseNets residual blocks stop there and a new block starts.
This model overperform ResNets with same amount of parameters since it can reuse processing from early layers more flexibly.
![[Pasted image 20241214191058_1.png]]

## U-Nets and Hourglass Networks
previously we had semantic segmentation models that first downsample until the receptive fields are large and upsample again to output a class for each pixel.
One drawback to this is the narrow section in the middle has to encode/remember high resolution details to make the final result accurate.
To overcome this we can use residual connections that transfer represantations from the encoder layers to their counterpart in the decoder.
![[Pasted image 20241214191716_1.png]]
U-Net uses concatenation
##### Hourglass networks
Similar to U-Net but uses further conv layers in the skip connection and add results back instead of concatenating it. 
!!! READ 214

