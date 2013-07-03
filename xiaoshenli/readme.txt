NEURON mod files from the paper:
Computational simulation of the input-output relationship in hippocampal
pyramidal cells
by Xiaoshen Li, Giorgio A. Ascoli
Journal of computational neuroscience, In press

The model shows how different input patterns (irregular &
asynchronous, irregular & synchronous, regular & asynchronous, regular
& synchronous) affect the neuron's output rate when 1000 synapses are
distributed in the proximal apical dendritic tree of a hippocampus CA1
pyramidal neuron. It shows four different input frequencies (1 Hz, 4
Hz, 7 Hz and 10 Hz) as shown in the paper fig5A.

In the irregular input cases (irregular asynchronous and irregular
synchronous), because the random number generated is dependent on the
seed and the seed is dependent on the simulation environment, the
simulation gives different spiking traces on each run. For the long
simulation period (2 seconds), the overall output frequency is
constant and is only related to the input frequency.

Under unix systems:
to compile the mod files use the command
nrnivmodl
and run the simulation hoc file with the command
nrngui mosinit.hoc

Under Windows systems:
to compile the mod files use the "mknrndll" command.
A double click on the simulation file
mosinit.hoc
will open the simulation window.

Questions on how to use this model
should be directed to xsli2@yahoo.com
