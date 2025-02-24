Compressed, abstract representation of data where similar items are mapped close to each other. Based on underlying (latent) features or patterns.
#### Observable space / latent space
Given an image, observable space is populated by the values of millions of pixels.
When we encode this image into a latent space (like a nn does) it is transformed into
a more compact representation of the observable space.
New latent space is populated by latent variables. In the context of a portrait image these can represent age, expression, hair style...

Some unsupervised deep learning models that aims to learn latent spaces
Autoencoders, PCA, Word2Vec

These learned latent variables have a simple (normal) probability distribution by design.
This makes it easier to sample from and perform calculations. (No crazy results)

#### Interpolating between latent variables
We have 2 real images and want to generate an image similar to both.
- Create Latent space representations of both
- Interpolate (find points between) between their latent variables.
- Map those latent variables back into data/observable space.
![[Pasted image 20241028224523_1.png]]
#### Disentanglement
In well designed latent spaces different variables should control/represent independent features. This property is called disentanglement.


#### Connecting supervised and unsupervised models using latent spaces
Generative unsupervised models with latent variables can benefit supervised models where the outputs have a structure.
For the process of generating images from a caption, creating a model to learn direct mappings between text and images would be hard. Instead We can create a model that just learn relations between two latent variables that explain images and texts.
Advantages
- Model needs less image/text pairs because inputs are lower dimensional
- Any sensible values in the latent space should generate plausible outputs
- We can introduce randomness to to the mapping operation we can generate multiple images that fit the caption.
