#quantization
[[Quantization]]
#### model: Sao10K/L3-8B-Stheno-v3.2
bnb = bitsandbytes: quantization library
``` python
self.model = AutoModelForCausalLM.from_pretrained(
    quantization_config={
	    "load_in_4bit": True,
        "bnb_4bit_compute_dtype": "float16",
        "bnb_4bit_use_double_quant": True,
        "bnb_4bit_quant_type": "nf4",
    },
```
##### load_in_4bit: True
Enables quantization to FP4 ([[FP4 Quantization]] )
#### bnb_4bit_compute_dtype: float16
Sets computation type to FP16.
4bit floats are dequantized to 16 before computations
#### bnb_4bit_use_double_quant: True
Enables quantization of quantization parameters (s, z) to 2 bit
This is accepteble when using different quantization parameters for each block ([[block quantization]])
#### bnb_4bit_quant_type: nf4
Instead of FP4 ise NF4 which is better optimized for llms ([[NF4 Quantization]])





 






