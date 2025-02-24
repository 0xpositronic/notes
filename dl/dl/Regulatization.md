methods that reduce generalization gap between test and training performance
Usually adds terms to the loss function that favor certain parameter choices.

### Ideas and L1
#### $\lambda . g[\phi]$
we include the above term in our loss func where;
g is a func that returns a high scalar for weights we don't want
$\lambda$ is a positive scalar that determines how much we want the regularization to have effect

from a probabilistic view we can consider regularization term as a prior that represents knowledge about the parameters before we observe the data

with that we now have a maximum a posteriori (MAP) criterion that combines;
The likelihood of the data given parameters: $Pr(yi∣xi,ϕ)$
The prior probability of the parameters: $Pr(ϕ)$
Instead of just maximizing likelihood, we maximize the product of likelihood and prior

So we go from this formula to
![[Pasted image 20241104221829_1.png]]
This one which includes the prior
![[Pasted image 20241104221845_1.png]]
$Pr(\phi)$ is the prior probability of the parameters. So we are now considering how likely parameters themselves are. So maximizing this likelihood also chooses parameters that fit our predetermined distribution.

![[Pasted image 20241104224155_1.png]]
the ∝ means proportional we use this because these are unnormalized prob dists. they are missing normalization constant that would make them integrate to 1. We don't need these constants because training would have the same results anyways(they don't effect where the max occurs).
![[Pasted image 20241104225455_1.png]]

![[Pasted image 20241104225527_1.png]]
![[Pasted image 20241104224227_1.png]]
### L2
penalizes the sum of the squares of the parameters
![[Pasted image 20241104222543_1.png]]
also called weight decay because usually not applied to biases as it's purpose is to encourage smaller weights that create a smoother function
smaller weights = less varying output
all zero weights = always the same output (based on the bias)

### how is this good
- Now the model does not need to pass through every data point to achieve minimum loss. this increases bias (can only create smooth functions) and reduces variance.
- When the network is over-parameterized some of the extra model capacity describes area with no training data. Here the regularization will favor smooth functions that interpolate between the nearby points.


## Implicit Regularization
neither gradient descent or SGD moves neutrally to the minimum of the loss function; each exhibits a preference for some solutions over others

consider continuous version of GD with infinitely small step size where the change in the parameters are governed by this equation
![[Pasted image 20241104230316_1.png]]
but the real GD approximates this process with a series of discrete steps of size $\alpha$
![[Pasted image 20241104230441_1.png]]
this discretization causes a deviation from the continuous path
![[Pasted image 20241104230722_1.png]]
![[Pasted image 20241104230744_1.png]]

this shows that the GD is repelled from places where the gradient norm is large (steep surface). So it biases the optimization towards regions with smoother loss landscapes (smaller gradients) This does not change the position of the local minima where the gradients and their norm are zero. But path taken towards the minima is different and it can lead to finding a different minima.
this explains why larger step sizes in standard GD is better generalizes
![[Pasted image 20241104231836_1.png]]

![[Pasted image 20241104232058_1.png]]
![[Pasted image 20241104232233_1.png]]

145/159
![[Pasted image 20241104232325_1.png]]


## Heuristic methods of regularization
### Early stopping
stopping the training before it fully converges to reduce overfitting
similar to L2 regularization it prevents weights becoming to large by not giving them enough time
When to stop can be determined with the performance on the validation set by monitoring performance on it every T iterations

### Ensembling 
Training multiple models and using the average of their outputs.
we can use mean or median(for more robust predictions) for regression models
and mean of the pre-softmax activations or the most frequently predicted class
To create slightly different models:
- random initialization
- generating different datasets by resampling the training data (bagging/bootstrap aggregating)
- models with different hyperparameters or even architectures
![[Pasted image 20241104234216_1.png]]



### Dropout
clamps a random subset (like 50%) of the hidden units to zero at each iteration of SGD
this makes the network less dependent on any given unit and encourages the weights to have smaller magnitudes so the network doesn't lose much when we zero out them.

This technique has the positive benefit that it can eliminate undesirable “kinks” in
the function that are far from the training data and don’t affect the loss. For example,
consider three hidden units that become active sequentially as we move along the curve
The first hidden unit causes a large increase in the slope. A second hidden
unit decreases the slope, so the function goes back down. Finally, the third unit cancels
out this decrease and returns the curve to its original trajectory.
These three units
conspire to make an undesirable local change in the function. This will not change the
training loss but is unlikely to generalize well.
![[Pasted image 20241105000045_1.png]]
at test time we run the network with all the hidden units active. But now it has more hidden units than it was trained with at any given iteration. So we multiply the weights by;
1-dropout_probability to compensate. This is knows as weight scaling inference.
A different inference method is to run it multiple times with random subset of units clamped to zero like in the training and combine the results like in the ensembling but without needing to train and store different versions of the network.

### Applying noise
dropout can be viewed as adding Bernoulli noise to the network activations. We can also add noise to the other parts of our model to make it more robust
- adding noise to the input data smooths out the learned func by penalizing the derivatives of the networks output with respect to input
- adding noise to the weights. The model converges into a local minima with flat open shape where changing the weights doesn't effect the output much
- adding noise to the labels. the final layers weights are pushed to predict largely varying values to get the maximum likelihood. Adding noise to label punishes this overconfident behavior.	this could be done by making the loss measure 1-p for the true label while all others have equal prob.
![[Pasted image 20241105014803_1.png]]



## Bayesian inference
150/164


# Transfer learning and multi-task learning
when training data are limited other datasets can be exploited to improve performance
in transfer learning the model is pre-trained to perform a related secondary task with more data. This model than can be applied to the original task.
This is done by removing the last layer and adding a few extra layers that we train while keeping the rest of the weights same(we might fine tune it all too)
the idea is that the secondary task will build good internal representation of the data.
we can think of this as initializing part of our networks weights in a super smart way.
##### multi-task learning
is a related technique where we train the model to solve several problems concurrently.
like segmenting an image, creating depth map, generating a caption. All of these require same fundamental understandings about the image so model performance might improve for each when learned simultaneously.

but these methods assume we have a lot of data to learn all these
## Self-supervised learning
If we don't have enough data we can generate more.
###### generative self-supervised learning:
mask a part of each data (i.e. remove pixels or words) and train a model to unmask it. (can use unlabeled data)
then this model can be fine-tuned for related tasks
###### contrastive self-supervised learning:
train a model to identify related pairs of data from unrelated ones without needing labels
positive pairs
	different crops of the same photo
	adjacent sentences from the same document
negative pairs
	crops from different photos
	sentences from different documents

Base use cases
- image retrieval / find similar images
- recognize speaker / accent
- image text matching
- multi-modal search engines

also this model might be able to learn key concepts about the problem to be used in transfer learning

![[Pasted image 20241105022012_1.png]]


## Data Augmentation
transfer learning improves perf  by exploiting a different dataset
multi-task learning improves perf using additional labels
A third option is to expand the dataset
we can transform data in a way that their labels stay the same
like rotating, flipping, blurring a bird photo
for text we can use synonyms or double-translations of the original sentence
for audio we can amplify or use different frequency bands




