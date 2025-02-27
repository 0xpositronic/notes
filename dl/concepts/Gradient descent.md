Stochastic gradient descent adds a random noise to the gradient at each step thus giving the model the opportunity to even go up-hill to escape from one valley to another.
![[Pasted image 20241101162407_1.png]]
it achieves this noise by just calculating gradient descent on a batch of data:
![[Pasted image 20241101162634_1.png]]
##### update rule for the step $t$ with the batch $B_t$

Algorithm works thorough the entire dataset in batches. Then starts sampling from the full dataset again.
A single pass through the entire data is called an **epoch**.

An alternative way to interpret this is to think it optimizes a slightly different(calculated based on different data) loss function at each step. 
In this view SGD performs deterministic(same output for the same batch) gradient descent on the a constantly changing loss function.

? Despite this expected loss and expected gradient at any point remain the same for gradient descent in average.

so SGD is
- cheaper to compute
- more likely to escape saddle points and local minima
- might find better parameters that can generalize to new data

#### in practice,
SGD is applied with a learning rate schedule; where $\alpha$ starts high and decreased by a constant factor every N epochs
The logic is that in the early stages of the training we want the algorithm to explore the parameter space, jumping from valley to valley to find a sensible region.

## Momentum
Update the parameters with a weighted combination of the gradient from the current and the previous batch.
![[Pasted image 20241101165603_1.png]]
the recursive formation of the momentum calculation means that the gradient at each step is an infinite weighted sum of all the previous gradients, where the weights get smaller as we move back in time.
The effective learning rate increases if all these gradients are aligned over multiple iterations but decreases if the gradient direction repeatedly changes as the terms in the sum cancel out. The overall effect is a smoother trajectory and reduced oscillatory behavior in valleys.
![[Pasted image 20241101170026_1.png]]


#### Nesterov momentum
The momentum term can be considered a coarse prediction of where the SGD will move next. Nesterov accelerated momentum computes the gradients at this predicted point instead of the current point:
![[Pasted image 20241101171554_1.png]]
only change is inside the loss function.
Can think of this as looking ahead before moving.
![[Pasted image 20241101173020_1.png]]


## ADAM (adaptive moment estimation)
88/102
Gradient descent with a fixed step size has the following undesirable property: it makes
large adjustments to parameters associated with large gradients (where perhaps we
should be more cautious) and small adjustments to parameters associated with small
gradients (where perhaps we should explore further).
When the gradient of the loss
surface is much steeper in one direction than another, it is difficult to choose a learning
rate that (i) makes good progress in both directions and (ii) is stable

A straightforward approach is to normalize the gradients so that we move a fixed
distance (governed by the learning rate) in each direction. To do this, we first measure
the gradient mt+1 and the point wise squared gradient vt+1:
![[Pasted image 20241101174232_1.png]]
###### the squaring and taking the root makes the operation preserve the sign by ensuring we divide by a positive value.
	squaring the gradients in adaptive methods like AdaGrad serves several important purposes beyond just ensuring positivity:
	
	1. Scale-Sensitive Adaptation
	
	- Squaring means larger gradients get penalized more heavily in the denominator
	- This creates an adaptive learning rate that's inversely proportional to the historical magnitude of gradients for each parameter
	- Parameters that receive consistently large gradients get smaller updates, while parameters with small gradients get larger updates
	- This is especially helpful for dealing with features that occur at different frequencies or scales in the data
	
	2. Historical Information
	
	- The squared form accumulates historical gradient information in an interpretable way
	- It preserves the relative magnitudes of past gradients, not just their signs
	- This gives the algorithm a kind of "memory" about which parameters have been historically volatile
	
	3. Statistical Interpretation
	
	- From a statistical perspective, the squared gradients relate to the second moment (variance) of the gradients
	- This helps adapt to the local geometry of the optimization landscape
	- It's similar to approximating the diagonal of the Hessian matrix in second-order optimization methods
	
	4. Mathematical Properties
	
	- Squaring makes the expression differentiable everywhere except at zero (hence the ε term)
	- The square root in the denominator of the update rule balances out the squaring, keeping the units consistent
	- This form works well with momentum and other optimization techniques
	
	The key insight is that squaring doesn't just force positivity - it provides a mathematically sound way to adapt learning rates based on the geometry of the optimization landscape.

##### -
e is a small constant to prevent 0 division.
With this algorithm the step size is same in every chosen(by the gradient) direction. But it doesn't change as we get close to the minima so it fails to converge unless it lands exactly on the minima. (regular SGD doesn't have this problem because step size is directly correlated with the gradient magnitude, here normalization removes the effect of the magnitude)

**ADAM** takes this idea and adds momentum to both the estimate of the gradient and the squared gradient
![[Pasted image 20241101211401_1.png]]
![[Pasted image 20241101212053_1.png]]
this bias correction step makes the m and v values larger at the early stages of the training(low t) we need this because training would start slowly with m and v values at 0.

![[Pasted image 20241101212423_2.png]]






![[Pasted image 20241101203101_1.png]]
### Line search
Search to select a learning rate by looking ahead and checking losses with different learning rates used and choose the best one.
Gradient provides the direction as just the negative of the gradient.
line search modifies the parameters for a couple learning rates multiplied by the direction, and selects the best one. At each step

compared to modern optimizations like ADAM, line search;
- Expensive
- Noisy with mini batches
line search is used in classical optimization problems where exact optimization is important

##### there are also alternatives to gradient descent but none of them scales as well
Exhaustive search:
All the algorithms discussed in this chapter are iterative. A completely
different approach is to quantize the network parameters and exhaustively search the resulting
discretized parameter space using SAT solvers (Mézard & Mora, 2009).
This approach has
the potential to find the global minimum and provide a guarantee that there is no lower loss
elsewhere but is only practical for very small models.




