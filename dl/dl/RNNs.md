when we first experimented with increasing the depth of conv nets the performance started to decline after a point due to training constraints.
unlike previous architectures, residual network layers computes an additive change to the current represantation instead of transforming it directly. This allows deeper networks to be trained.
But with this approach causes an exponential growth in the variance of activations.
![[Pasted image 20241214122850_1.png]]
So RNNs use batch normalizations which normalize activations at each layer.

#### Limits of sequential processing
in theory we should see performance increase with each layer (and data) added. But training becomes really hard due to loss landscape becoming even harder to navigate with finite step sizes. As even a small step size can lead to a completely different gradient in a landscape full of tiny sharp mountains.
#### The *Shattered Gradient*
For shallow networks nearby gradients are corelated.
for deep networks this corelation drops to zero.
![[Pasted image 20241214132622_1.png]]
![[Pasted image 20241214133639_1.png]]

## Residual network
![[Pasted image 20241214133731_1.png]]
each f learns an additive change.
Output and input sizes must be same.

![[Pasted image 20241214134148_1.png]]
We can interpret this as an ensemble of smaller networks whose input are summed to compute the result.
![[Pasted image 20241214134437_1.png]]
This resudual network creates 16 different paths with differing number of transformations
f1 apeears in 8 of these paths.
![[Pasted image 20241214134420_1.png]]
here a residual block contains one layer of linear transformation.
but in practice it can contain more and residual connections might be on different steps
![[Pasted image 20241214144303_1.png]]


### Batch Norm
shifts and rescales each activation so it's mean and variance across the batch become values that are learned druing training.
First we compute emprical(observed) mean and standard deviation.
![[Pasted image 20241214145354_1.png]]
After this operations activations have a mean of $\delta$ and sd of $\gamma$ across all members of the batch.
Applied independently to each hidden unit
for test time we do not have a way to learn new parameters so we learn them over entire training dataset and use those during testing.
![[Pasted image 20241214150417_1.png]]

in a residual network variance still increases ass we add new source of variation to the input but it is linearly adds a unit of variance to existing variance.
in initialization this has the side effect that latter layer have less impact on the overall variance. (1 out of first 2 units contributes to 50% of the variance while 100th unit contributes to 1%)
this gives the network a shallow effective depth
But durign training the BN parameters can be learned in a way that model can increase the effect of later layers increasing effective depth. (If layer 100's γ=2, it now contributes 4 units of variance instead of 1)

BN also has regularizaiton effect because the learned parameters depend on a subsample of data (batch) this adds noise.

##### Why does BN work?
![[Pasted image 20241214201334_1.png]]

### Why do Residual connections work?
![[Pasted image 20241214193117_1.png]]
without residual connections each gradient has to flow through other layers which can diminish or distort it.
Some paths can skip layer entirel averaging out local variations.
if a layer causes drastic changes to its input, there is always a direct path as the additive input term that the network can retreat back to. This prevent too deep valleys.

In short residual connections eliminate drastic and unpredictable gradients of early layers which become problematic even with small learning rates.
Just residual connections can double the depth of trainable networks. This is increased more by BatchNorm.

### Notes
In a residual network consisting of 54 blocks, almost all of the gradient
updates during training were from paths of length 5 to 17 blocks long, even though these only
constitute 0.45% of the total paths. It seems that adding more blocks effectively adds more
parallel shorter paths rather than creating a network that is truly deeper.

L2 regularization behaves differently in residual blocks, encouraging them to be identity + bias.
So there are other methods that are similar to dropout for residual architectures.
- randomly dropping res blocks during training
- chosing which blocks to drop
- randomly re-weighing residual paths(behaves like synthetic random data feed)
![[Pasted image 20241214195502_1.png]]

Balduzzi et al. (2017) investigated the activation of hidden units in later layers of deep networks with ReLU functions at initialization. They showed that many such hidden units were always active or always inactive regardless of the input but that BatchNorm reduced this tendency.
![[Pasted image 20241214200533_1.png]]
![[Pasted image 20241214200827_1.png]]

![[Pasted image 20241214200918_1.png]]