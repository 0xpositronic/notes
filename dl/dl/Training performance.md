114/128
Reducing memory requirements:
Training neural networks is memory intensive. We must
store both the model parameters and the pre-activations at the hidden units for every member
of the batch during the forward pass. Two methods that decrease memory requirements are
gradient checkpointing (Chen et al., 2016a) and micro-batching (Huang et al., 2019). In gradient
checkpointing, the activations are only stored every N layers during the forward pass. During
the backward pass, the intermediate missing activations are recalculated from the nearest check-
point. In this manner, we can drastically reduce the memory requirements at the computational
cost of performing the forward pass twice (problem 7.11). In micro-batching, the batch is sub-
divided into smaller parts, and the gradient updates are aggregated from each sub-batch before
being applied to the network. A completely different approach is to build a reversible network
(e.g., Gomez et al., 2017), in which the activations at the previous layer can be computed from
the activations at the current one, so there is no need to cache anything during the forward pass
(see chapter 16). Sohoni et al. (2019) review approaches to reducing memory requirements.
Distributed training:
For sufficiently large models, the memory requirements or total re-
quired time may be too much for a single processor.
In this case, we must use distributed
training, in which training takes place in parallel across multiple processors. There are several
approaches to parallelism. In data parallelism, each processor or node contains a full copy of
the model but runs a subset of the batch (see Xing et al., 2015; Li et al., 2020b). The gradients
from each node are aggregated centrally and then redistributed back to each node to ensure
that the models remain consistent. This is known as synchronous training. The synchronization
required to aggregate and redistribute the gradients can be a performance bottleneck, and this
leads to the idea of asynchronous training. For example, in the Hogwild! algorithm (Recht
et al., 2011), the gradient from a node is used to update a central model whenever it is ready.
The updated model is then redistributed to the node. This means that each node may have a
slightly different version of the model at any given time, so the gradient updates may be stale;
however, it works well in practice. Other decentralized schemes have also been developed. For
example, in Zhang et al. (2016a), the individual nodes update one another in a ring structure.
Data parallelism methods still assume that the entire model can be held in the memory of a
single node. Pipeline model parallelism stores different layers of the network on different nodes
and hence does not have this requirement. In a naïve implementation, the first node runs the
forward pass for the batch on the first few layers and passes the result to the next node, which
runs the forward pass on the next few layers and so on. In the backward pass, the gradients are
updated in the opposite order. The obvious disadvantage of this approach is that each machine
lies idle for most of the cycle. Various schemes revolving around each node processing micro-
batches sequentially have been proposed to reduce this inefficiency (e.g., Huang et al., 2019;
Narayanan et al., 2021a). Finally, in tensor model parallelism, computation at a single network
layer is distributed across nodes (e.g., Shoeybi et al., 2019). A good overview of distributed
training methods can be found in Narayanan et al. (2021b), who combine tensor, pipeline, and
data parallelism to train a language model with one trillion parameters on 3072 GPUs.