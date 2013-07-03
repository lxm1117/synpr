These model files were for the paper:

Yu Y.G., Shu Y., Duque A., Haider B., and McCormick D.A.  
Cortical Action Potential Back-propagation Explains Spike Threshold
Variability and Rapid-Onset Kinetics.
Journal of Neuroscience, 28: 7260-7272, (2008).

and also

McCormick D.A., Shu Y., and Yu Y.G.     
Neurophysiology: Hodgkin and Huxley model - still standing?
Nature. 445: E1-E2, (2007).  

This simple axon-soma model explained how the rapid rising phase in
somatic spike is derived from propagated axon initiated spike.

Creates a single cell containing a dendrite, soma, an axon with 60
micrometer and a axon bleb to investigate generation of spike kink at
soma. As observed in experiment, spikes are usually initiated at the
axon site 40~70 micrometer away from soma.  There is a rapid rising
phase in somatic spike, due to the initial segment traveling spike.

After running the code, there is an output data file called
'neuron_soma.dat' Use the matlab code for_plot_spike.m to plot the
somatic spike and axon spike.

These files were contributed by
Yuguo Yu
Yale University

yuguo.yu@yale.edu

20111026 updated release.mod to derivimplicit method.  See file for
more info.
20120409 updated cad.mod capump.mod to derivimplicit method which
should have been changed with above 20111026 update. See
http://www.neuron.yale.edu/phpBB/viewtopic.php?f=28&t=592
20120515 Ted Carnevale supplied these updates which are THREADSAFE,
slightly cleaner code, and handle singularities correctly (ca.mod,
km.mod, and kv.mod didn't).
