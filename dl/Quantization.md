 #quantization 

Quantization is used to decrease memory taken by varibles by converting them into a lower bit count format
- Can introduce noise in the form of rounding errors
- Accumulators in matrix multiplication still need higher bit-width to prevent overflows from multiplying two large INT8 numbers, followed by requantization
- values can be dequantized before calculations for more precision
we can calculate the error by taking the difference between dedquantized and the original version of our data

## Types of Quantization

### Uniform Affine (Asymmetric) Quantization
- **s** = scale factor (floating point number)
  - Determines step-size of the quantizer
- **z** = zero-point (integer)
  - Ensures real zero is quantized correctly
  - We need real 0.0 to map exactly (without rounding) to an integer
  - If you apply quantization and then ReLU without this, all previously negative values would have an error
- **b** = bit-width

#### to INT-B
where b is the target size in bits 

Quantization:
### $x_{\text{int}} = \text{clamp}(\lfloor\frac{x}{s}\rceil + z, 0, 2^b-1)$

Dequantization
### $x \approx \hat{x} = s(x_{int} - z)$


Scale factor calculation:
### $s = \frac{max_{float} - min_{float}}{target_{max} - target_{min}}$

Zero-point calculation:
### $z = round(\frac{target_{min} - min_{float}}{s})$


#### to FP4
[[floats]]
1 sign bit
1 exponent bit
2 mantissa bits




> Trade-off between rounding and clipping error: Through the de-quantization step, we can also define the quantization grid limits (qmin, qmax) where qmin = −sz and qmax = s(2^b − 1 − z). Any values of x that lie outside this range will be clipped to its limits, incurring a clipping error. If we want to reduce the clipping error we can expand the quantization range by increasing the scale factor. However, increasing the scale factor leads to increased rounding error as the rounding error lies in the range [−1/2s, 1/2s].

### Symmetric Quantization
- Less overhead as the zero-point is always zero

### Power-of-Two Quantizer
- Scale factor (s) limited to be a power of 2
- Computationally efficient

## Granularity
Quantization granularity defines how we divide tensors when assigning different quantization parameters:
- Increasing granularity improves performance at the cost of overhead
- Above methods show quantization per-tensor
- Can use more computationally heavy methods to increase granularity which improves performance
- Possible to use different quantization parameters per output channel of a layer's weight tensors

Note: The image reference `![[Pasted image 20241022011640_1.png]]` appears to be from Obsidian. To include images in a more portable way, consider using standard Markdown image syntax:
```markdown
![Quantization Process](~/Documents/notes/*.jpg)
```
