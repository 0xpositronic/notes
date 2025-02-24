#quantization 

1 sign bit
1 exponent bit
2 mantissa bits
### $FP4(x) = (-1)^s * 2^{e-1} * (1 + \frac m 4)$

this formula means all we have to
    subtract 1 from the *exponent*
    divide *mantissa* by 4

### exponent
subtracting one gives us the values {-1, 0} instead of {0, 1}
#### $2^{-1} = 0.5$    $2^0 = 1$
this gives us more more precision with the cost of smaller range
{1.0, 8.0} to {0.5, 4.0}

### mantissa
similarly, dividing by 4 gives us more precision with lower range



This quantization *parameters* 1 and 4 puts our FP4 number between
{-1.75, 1.75}
any results that fall outside of this range will be clamped
but most neural network weights lay in this range














