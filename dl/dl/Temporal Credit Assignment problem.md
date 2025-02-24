#RL

Book: 1.3.1 page 12/26

One complication is that the reward may occur some time after the action is taken,
so associating a reward with an action is not straightforward. This is known as the
temporal credit assignment problem. As the agent learns, it must trade off exploration
and exploitation of what it already knows; perhaps the agent has already learned how to
receive modest rewards; should it follow this strategy (exploit what it knows), or should
it try different actions to see if it can improve (explore other opportunities)?

### Examples
Consider teaching a humanoid robot to loco-mote. The robot can perform a limited
number of actions at a given time (moving various joints), and these change the state of
the world (its pose). We might reward the robot for reaching checkpoints in an obstacle
course. To reach each checkpoint, it must perform many actions, and it’s unclear which
ones contributed to the reward when it is received and which were irrelevant. This is an
example of the temporal credit assignment problem.

A second example is learning to play chess. Again, the agent has a set of valid actions
(chess moves) at any given time. However, these actions change the state of the system
in a non-deterministic way; for any choice of action, the opposing player might respond
with many different moves. Here, we might set up a reward structure based on capturing
pieces or just have a single reward at the end of the game for winning. In the latter case,
the temporal credit assignment problem is extreme; the system must learn which of the
many moves it made were instrumental to success or failure.

The exploration-exploitation trade-off is also apparent in these two examples. The
robot may have discovered that it can make progress by lying on its side and pushing
with one leg. This strategy will move the robot and yields rewards, but much more slowly
than the optimal solution: to balance on its legs and walk. So, it faces a choice between
exploiting what it already knows (how to slide along the floor awkwardly) and exploring
the space of actions (which might result in much faster locomotion). Similarly, in the
chess example, the agent may learn a reasonable sequence of opening moves. Should it
exploit this knowledge or explore different opening sequences?
It is perhaps not obvious how deep learning fits into the reinforcement learning frame-
work. There are several possible approaches, but one technique is to use deep networks
to build a mapping from the observed world state to an action. This is known as a
policy network. In the robot example, the policy network would learn a mapping from
its sensor measurements to joint movements. In the chess example, the network would
learn a mapping from the current state of the board to the choice of move (figure 1.13).