TITLE ca1AH.mod Conductances for CA1 cells
 
COMMENT
 
ENDCOMMENT
 
UNITS {
        (/ms) = (1/millisecond)
        (mA) = (milliamp)
        (mV) = (millivolt)
        (molar) = (1/liter)
        (mM) = (millimolar)
}
 
NEURON {
        SUFFIX ca1AH
        USEION k READ ek WRITE ik
        NONSPECIFIC_CURRENT ih
        NONSPECIFIC_CURRENT il
	RANGE gkAbarp, gkAbard, ghbarf, ghbars
	RANGE eh, el
	RANGE ikA
	RANGE itot
	RANGE gh, gkA ,gl, gtot
	RANGE qsinc, qfinc, qvh, qslo
        GLOBAL apinf, adinf, binf, qsinf, qfinf
        GLOBAL aptau, adtau, btau, qstau, qftau
}
 
PARAMETER {
        gkAbarp=0               :gkAbarp = 1e-3 		(mho/cm2)
        gkAbard=0               :gkAbard = 1e-3 		(mho/cm2)
	ghbarf = .025e-3 	(mho/cm2)
	ghbars = .025e-3 	(mho/cm2)
	gl     = .025e-3 	(mho/cm2)
        ek = -90 (mV)
        el = -90 (mV)
	eh = -20 (mV)
	qvh = -92 (mV)
	qslo = 10.4
	qsinc=0
	qfinc=0

}
 
STATE {
         ap ad b qf qs 
	   }
 
ASSIGNED {
        v (mV)
        celsius  (degC)
	ik (mA/cm2)
        ikA (mA/cm2)
	ih (mA/cm2)
	il (mA/cm2)
	itot (mA/cm2)
	gkA (mho/cm2)
	gh (mho/cm2)
        gk (mho/cm2)
        gtot (mho/cm2)
	 apinf adinf binf qsinf qfinf 
	 aptau adtau btau qstau qftau
        cai  (mM)
}
 
BREAKPOINT {
        SOLVE states METHOD cnexp 
	gkA = gkAbarp*ap*ap*ap*ap*b+gkAbard*ad*ad*ad*ad*b
	ikA = gkA*(v - ek)
	gh = ghbars*qs*qs+ghbarf*qf*qf
	ih = gh*(v - eh)
        gk =  gkA 
	ik =  ikA
	il = gl*(v - el)
        gtot = gk  + gh + gl
        itot = ik  + ih + il
}

INITIAL {
	rates(v)
	ap = apinf
	ad = adinf
	b = binf
        qs = qsinf
	qf = qfinf

}
UNITSOFF

DERIVATIVE states {
        rates(v)
	  ap' = (apinf - ap) / aptau		: A act
	  ad' = (adinf - ad) / adtau		: A act
	  b' = (binf - b) / btau		: A inact
	  qs' = (qsinf - qs) / qstau		: H slow
	  qf' = (qfinf - qf) / qftau		: H fast
}
 
PROCEDURE rates(v (mV)) {  :Computes rate and other constants at current v.
                      :Call once from HOC to initialize inf at resting v.
        LOCAL  q10, alpha, beta

	  q10 = 3^((celsius - 6.3)/10)


			:"ap" potassium(A) activation system  proximal
			:  from Hoffman (1997) corrected

	  alpha = -0.1 * vtrap((v + 31.3), -25)
:			-.01*(v+31.3)/(exp((v+31.3)/-25)-1)
	  beta = 0.1* vtrap((v + 31.3), 25)
:			0.01*(v+31.3)/(exp((v+31.3)/25)-1)

        aptau = 1/(alpha + beta)
        apinf = alpha/(alpha+beta)

			:"ad" potassium(A) activation system  distal  
			:  from Hoffman (1997) corrected

	  alpha = -0.1 * vtrap((v + 34.4), -21)
:			-.01*(v+34.4)/(exp((v+34.4)/-21)-1)
	  beta = 0.1* vtrap((v + 34.4), 21)
:			0.01*(v+34.4)/(exp((v+34.4)/21)-1)

        adtau = 1.0/(alpha + beta)
        adinf = alpha/(alpha+beta)

			:"b" potassium(A) inactivation system
			:  from Hoffman (1997) corrected

	  alpha = 0.01 * vtrap((v + 58), 8.2)
:        	     0.01 * (v+58)/(exp((v+58)/8.2)-1)
	  beta = -0.01 * vtrap((v + 58), -8.2)
:                   -0.01*(v+58)/(exp(-(v+58)/8.2)-1)

        binf = alpha/(alpha + beta)
        btau = 5
        if (v>-20) {
	   btau = 5 + 2.6*(v+20)/10
	}

			:"q" mixed (H) inactivation system
			:  from Vasilyev and Barish JNS 2002   
			:  qvh = -92  qslo = 10.4

	  qsinf = 1 / (1 + exp((v - qvh)/qslo))
	  qfinf = 1 / (1 + exp((v - qvh)/qslo))
 
	if(v < -83) {
	     qstau = 177+qsinc + 67*exp((v+159)/35.5) 
	} else {
	     qstau = 267+qsinc + 542*exp(-(v+85)/20)
	}
	if(v < -87) {
	     qftau = 17+qfinc + 7.2*exp((v+124)/22.5) 
	} else {
	     qftau = 27+qfinc + 24*exp(-(v+85)/20)   
	}


}

FUNCTION vtrap(x,y) {  :Traps for 0 in denominator of rate eqns.
        if (fabs(x/y) < 1e-6) {
                vtrap = y*(1 - x/y/2)
        }else{
                vtrap = x/(exp(x/y) - 1)
        }
}
 
UNITSON

