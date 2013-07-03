cd C:\neuron\kink\onlyaxon
vout=load('neuron_soma.dat');
vout=vout';
soma=vout(2,1:end-300);
timebin=0.01;
figure;plot(soma(2:end),diff(soma,1)./timebin)
axon=vout(end,1:end-300);
figure;plot(axon(2:end),diff(axon,1)./timebin)