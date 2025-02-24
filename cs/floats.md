#low-level 
## Decimal System
In the decimal system, we use scientific notation:
$32.52 = 3.252 × 10^1$
where:
- exponent = 1
- mantissa = 3.252
- normalized form (always one digit before decimal point)

## Binary System
In binary, we follow similar principles but with base 2.

### Sign Bit
- 0 for positive numbers
- 1 for negative numbers

### Exponent (8 bits)
The exponent indicates how many bits and which direction we shifted the binary point to achieve normalized form.

To handle negative exponents, we add a bias of 127:
- Positive: 2 → 2 + 127 = 129 → 10000001
- Negative: -2 → -2 + 127 = 125 → 01111101

Range:
- All zeros (0): Reserved for zero and denormals
- All ones (255): Reserved for infinity and NaN
- Actual range: -126 to 127 after removing bias

### Mantissa (23 bits)
- Each bit represents a negative power of two
- The leading 1 is implicit (not stored) because in normalized form it's always 1
- Format: 1.xxxxx (where xxxxx is stored in mantissa)
- Precision: 23 bits + 1 implicit bit = 24 bits total

## Complete Example
Converting 5.25 to floating point:

1. Convert to binary:
   $5.25_{10} = 101.01_2$

2. Convert to normalized scientific notation:
   $101.01_2 = 1.0101_2 × 2^2$

3. Extract components:
   - Sign = 0 (positive)
   - Exponent = 2 + 127 = 129 = 10000001
   - Mantissa = 0101 (followed by 19 zeros)

4. Final 32-bit representation:
   0 10000001 01010000000000000000000
   │ │        └── Mantissa (23 bits)
   │ └── Exponent (8 bits)
   └── Sign (1 bit)


![[Pasted image 20241026230048_1.png]]