#quantization 

NF4(x)=μ+σ×qNF4​(σx−μ​)
according to given formula to quantize and dequantize:

where qNF4 is a list with precomputed values for the normal distrubution
levels = {-1.526, -0.761, -0.323, -0.101, 0.101, 0.323, 0.761, 1.526}
where mu and sigma are the mean and varience of our block
we first normalize the data in a block and map them to nearest values in the qNF4

better when our model doesn't have saturated weights 
vision models usually have high value weights for edge detection etc.

