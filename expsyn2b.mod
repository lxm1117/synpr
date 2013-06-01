COMMENT

Two exponential synapse ampa and nmda with block

ENDCOMMENT

NEURON {
	POINT_PROCESS expsyn2b
	RANGE delay, tau1, tau2, tau3, tau4, g, gmax, gmax2
        RANGE e, i, scc, block, iampa, inmda, gampa, gnmda
	NONSPECIFIC_CURRENT i
}

UNITS {
	(nA) = (nanoamp)
	(mV) = (millivolt)
	(uS) = (microsiemens)
}

PARAMETER {
	delay=0 (ms)
	tau1=.2 (ms)
	tau2=10 (ms)
	tau3=3.5 (ms)
	tau4=40 (ms)
	gmax=0 (uS)
	gmax2=0 (uS)
        scca = 8e-6     (uS)
        sccn = 50e-6    (uS)
        e = 1.3827              (mV)
        mg = 1.2                (1)     : magnesium concentration (mM)

}

ASSIGNED { 
	v 	(mV) 
	i 	(nA) 
	g 	(uS) 
        gampa           (uS)
        gnmda           (uS)
        block   (1)
        iampa           (nA)
        inmda           (nA)
	factor 
	factor2 
}

INITIAL { LOCAL tp, tp2
	tp = (tau1*tau2)/(tau2-tau1) * log(tau2/tau1)
	tp2 = (tau3*tau4)/(tau4-tau3) * log(tau4/tau3)
	factor = exp(-tp/tau2) - exp(-tp/tau1)
	factor2 = exp(-tp2/tau4) - exp(-tp2/tau3)
	factor=1/factor
	factor2=1/factor2
}

BREAKPOINT {
	if  (gmax) { at_time(delay) }
        UNITSOFF
        block = 8.8*exp(v/12.5)/(mg + 8.8*exp(v/12.5))
        UNITSON
	gampa = gmax * factor*(d2((t-delay)/tau2) -d1((t-delay)/tau1)) 
	gnmda = gmax2 * block * factor2*(d3((t-delay)/tau4) -d3((t-delay)/tau3))
        g = gampa + gnmda 
        iampa = gampa*(v - e)
        inmda = gnmda*(v - e)
        i = iampa + inmda
}

FUNCTION  d1(x) {
	if(x < 0) {
		d1 = 0
	}else{
		d1= exp(-x)
	}
}
FUNCTION  d2(x) {
	if(x < 0) {
		d2 = 0
	}else{
		d2= exp(-x)
	}
}
FUNCTION  d3(x) {
	if(x < 0) {
		d3 = 0
	}else{
		d3= exp(-x)
	}
}
FUNCTION  d4(x) {
	if(x < 0) {
		d4 = 0
	}else{
		d4= exp(-x)
	}
}
