### AlexNet
![[Pasted image 20241211221027_1.png]]
trained on ImageNet with +1m images with size 224x224x3
- downsample with a 11x11 kernel and stride 4 to create 96 channels 
- maxpooling and 5x5 kernel to 256 channels
- more conv layers with 3x3 kernels
- this results in a 13x13 represantation with 256 channels.
- final maxpooling to get 6x6 256 channels
- flattening into a vector of 9216
- fully connected layers with sizes 4096, 4096 and 1000
- last layer passed through the softmax to output prob dist for all 1000 classes.

Contains ~60m parameters most of which are in the dense parts.

The dataset was augmented by a factor of 2048 by using spatial transformations and modifying input intensities.

At test time 5 different versions (cropped and mirrored) of the test samples are used to determine average success.

Trained using SGD with momentum of 0.9 and batch size of 128
Dropout applied to dense layers and L2 regularization used.
16.4% top-5 error and 38.1 top-1 error.

### VGG
![[Pasted image 20241211221349_1.png]]
deeper version of AlexNet with 144m parameters and 19 hidden layers.
6.8% top-5 error and 23.7 top-1 error.

### YOLO object detection
able to localize and identify multiple objects in an image
input is 448x448x3 image.
Has 24 conv layers which downsample with maxpool and increase channels. followed by dense layers.
**192**

### Semantic segmentation models
![[Pasted image 20241211222422_1.png]]
models that assign a label to each pixel according to the object it belongs to.or no label if it does not correspond to anything in the training data.
193