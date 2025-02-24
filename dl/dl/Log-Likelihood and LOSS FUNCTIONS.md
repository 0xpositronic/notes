58/72

A conditional probability $Pr(z | \psi)$ can be considered in two ways.
### As a function of $z$
Meaning if we select fixed $\psi$, what is the prob of different z values.
i.e. Probabilities of heads and tails in a weighted (parameter = 0.7) coin.
	$Pr(Heads | \psi = 0.7) = 0.7$
	$Pr(Tails | \psi = 0.7) = 0.3$
	Note: $\psi$ is the weight that determines how biased the coin is for the HEADS.
This probability distribution sums to one.
### As a function of $\psi$ (Likelihood)
For the selected outcome z, what weights $\psi$ can produce it
i.e. Likelihood of our weight (for heads) being 0.7 given we rolled a Heads
	$L(\psi = 0.7 | Heads) = 0.7$
	$L(\psi = 0.9 | Heads) = 0.9$
	$L(\psi = 0.7| Heads) = 0.7$
This values don't have to sum to one

## Likelihood vs Probability
Probability: About the results: fix model, check possible data(z)
Likelihood:  About the past/cause: fix the data, check model($\psi$)


### Model example
if we define a model to output a prob dist by making the model predict mean ($\mu$)  and variance ($\sigma^2$)  of a normal dist for given input.
output theta = {mean. variance}
#### $\theta_i = f[x_i, \phi_i]$
Each observed training output $y_i$ should have a high prob under its corresponding dist $Pr(y_i | \theta_i)$

###### Maximum likelihood criterion
So we need to chose model parameters $\phi$ such that it maximizes combined prob across all $I$ training examples.
#### $argmax_{\phi} [\prod_{i=0}^n Pr(y_i | f[x_i, \phi])]$

since we know iterate over all data points. We can think of this as a likelihood where our data is fixed and we're changing the $\phi$ to find to find it's value that maximizes this likelihood
##### assumptions: 
- the form of data dist over the outputs y is the same for each data point
- predictions are independent


### Where the log comes in :log:
the multiplication in the previous formula usually performed on small values which get even smaller and hard to represent in limited precision binary.
Instead we can maximize the logarithm of the likelihood.
![[Pasted image 20241030205144_1.png]]
![[Pasted image 20241030205225_1.png]]
so the weights that maximize the log likelihood are the same without the log

![[Pasted image 20241030210522_1.png]]


Why we want the full distribution even if we sometimes just use the maximum:
Uncertainty Quantification:
- If model predicts μ=10, σ²=1 for house_1
- And μ=10, σ²=100 for house_2
- Both give same point estimate (10)
- But second prediction is much less certain!
- We can say: "House_1 will cost $10K ± $2K with 95% confidence"
- But: "House_2 will cost $10K ± $20K with 95% confidence"


#### 62/76
cool stuff comparing least squares and log likelihood.




![[Pasted image 20241030215326_1.png]]




# Loss function recipe
![[Pasted image 20241030220135_1.png]]


### Softmax
takes a vector of real values and converts them into probabilities that sum to 1
For an output vector z, softmax(z)ᵢ = exp(zᵢ)/Σⱼexp(zⱼ)


### 71/85 CROSS ENTROPY
# UNDERSTAND



