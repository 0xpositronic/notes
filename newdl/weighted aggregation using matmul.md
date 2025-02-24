a mathematical trick used in self-attention
### goal:
![[Pasted image 20250216155414_1.png]]
calculate tensor c where each row is aggregation of the rows of b until that point.
we can do this by multiplying a lower triangular matrix (a) with b
a @ b linear equation notation:
- where x, y, z are rows of b
$1x + 0y + 0z$
$1x + 1y + 0z$
$1x + 1y + 1z$

#### averaging using the same method 
we can set the rows of triangular matrix to sum to 1
$\begin{bmatrix}   1 & 0 & 0\\   0.5 & 0.5 & 0\\   0.333 & 0.333 & 0.333   \end{bmatrix}$

python code to produce this matrix of size (T, T)
```python
wei = torch.tril(torch.ones(T, T))
wei = wei / wei.sum(1, keepdim=True)

xbow = wei @ x # (B, T, T) @ (B, T, C) ---> (B, T, C)
# where B = batch size and pytorch adds it to T,T wei
# T = sequence/token length
# C = channels
# wei = affinity matrix
```

### Better way to do it with softmax
when dealing with real data our wei, weight matrix will not be triangular.
Since it shows how much each token attends to others, we do not want current token,
to be influenced by the future tokens. 

If we set the upper triangular tokens to -inf they will become 0 after exponentiation of softmax. after that softmax is just averages them.

```python
tril = torch.tril(torch.ones(T, T))
wei = torch.zeros((T, T))
wei = wei.masked_fill(trill == 0, float('-inf'))
wei = F.softmax(wei, dim=-1)
xbow = wei @ x
```

