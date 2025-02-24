#### Capacity of a model
number of parameters/hidden units of the model (thus it's ability to fit complex functions) 
### Double Descent
130/144
as we increase the number of parameters, our model overfits the training data thus showing worse performance on the test data
but increase the model size even more it starts to generalize to test data again. Because for sparse parameter space (a few examples for every dimension in the latent space) model is able to learn a smooth curve between just a few examples. And the smoothness make it generalize well.
![[Pasted image 20241103145407_1.png]]

#### Why more parameters force the model to learn smoother curves?
![[Pasted image 20241103145808_1.png]]
- small initialization of weights like He init. might a starting point biased towards smooth functions
- some local minima might be a smoother function than the global minima
- Batch size and learning rate choices might create smoothness by adding noise and preventing large updates


double descent phenomena is more pronounced when we add noise to the data and when regularization techniques are used.

##### test performance
depends on the effective model capacity (number of examples model can learn with 0 loss) thus if the model has more capacity than the available training data, it devotes resources to interpolating smoothly. As such the performance also dedpends on the training algo and length. 
Also adding training data might worsen the test performance, because the critical(first) descent will move further in the training thus we might not reach the second descent




### Modern models and choosing hyprparameters 
calculating the exact bias and the variance of a large model is impossible so there is no way to tell how many parameters we need to add before test accuracy improves.
So we can try different values from the hyprparameter space and chose the ones that perform best on the validation test

#### Splitting the dataset: 
this division may cause problems where the
total number of data examples is limited; if the number of training examples is comparable to
the model capacity, then the variance will be large.
One way to mitigate this problem is to use k-fold cross-validation. The training and validation
data are partitioned into K disjoint subsets. For example, we might divide these data into
five parts. We train with four and validate with the fifth for each of the five permutations
and choose the hyperparameters based on the average validation performance. The final test
performance is assessed using the average of the predictions from the five models with the best
hyperparameters on an entirely different test set. There are many variations of this idea, but
all share the general goal of using a larger proportion of the data to train the model, thereby
reducing variance


#### Curse of dimentionality
as the model dimentionality increases the amount of data to densely sample it increases exponentially 
![[Pasted image 20241103154238_1.png]]

#### data drift
deployed model must be monitored because the real world characteristics of the data might change over time.
covariate shift: data might change
prior shift: labels might change
conpect shift: relations might change



### Hyperparameter search
Finding the best hyperparameters is a challenging optimization
task. Testing a single configuration of hyperparameters is expensive; we must train an entire
model and measure its performance. We have no easy way to access the derivatives (i.e., how performance changes when we make a small change to a hyperparameter). Moreover, many of the hyperparameters are discrete, so we cannot use gradient descent methods. There are multiple local minima and no way to tell if we are close to the global minimum. The noise level is high since each training/validation cycle uses a stochastic training algorithm; we expect different results if we train a model twice with the same hyperparameters. Finally, some variables are conditional and only exist if others are set. For example, the number of hidden units in the third hidden layer is only relevant if we have at least three hidden layers
136/150