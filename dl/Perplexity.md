claude:
3. **Perplexity** Perplexity is a metric for evaluating language models, defined as the exponential of the average negative log-likelihood of a sequence:

Perplexity=exp⁡(−1N∑i=1Nlog⁡2P(xi∣x<i))\text{Perplexity} = \exp\left(-\frac{1}{N}\sum_{i=1}^N \log_2 P(x_i|x_{<i})\right)Perplexity=exp(−N1​i=1∑N​log2​P(xi​∣x<i​))

Lower perplexity means better prediction of the next token. A perplexity of 4.15 vs 4.23 means NF4 predicts the next token more accurately than FP4.