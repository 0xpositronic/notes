RANK = output dimension of a linear transformation
column space  = set of all possible outputs of: Av
	columns of the matrix tells you where basis vectors land. And the span of the matrix is determined by them (span of columns)
null space (kernel) = set of values that get squished into (0, 0) after transformation

`Note - in **transformer language models**, we often have cases where m≪n,lm≪n,l, so we have a large, low-rank matrix ABAB. We use tools like singular value decomposition to understand these matrices (e.g. see [this post](https://www.lesswrong.com/posts/mkbGjzxD8d8XqKHzA/the-singular-value-decompositions-of-transformer-weight)), since SVD is a common tool for large low-rank matrices.`

![[Pasted image 20250221190059_1.png]]

if an observation cuts the spaceof possiblities in half;
it has 1 bit of information. cut into 1/4 => 2 bits ...
I = -log2(p)
Entropy: expected information value of a particular guess

L2 norm = sum of squared values => std withouth averaging