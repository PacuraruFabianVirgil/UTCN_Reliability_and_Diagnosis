load('failures_7.mat')

Pc = 100;
Pp = 50;
Ps = 10;
Pm = 1;

Ncvec = sum(c); Nc = sum(Ncvec);
Npvec = sum(p); Np = sum(Npvec);
Nsvec = sum(s); Ns = sum(Nsvec);
Nmvec = sum(m); Nm = sum(Nmvec);

N = 40;
D = (Nc*Pc+Np*Pp+Ns*Ps+Nm*Pm)/N;

fc = Ncvec/N;
fp = Npvec/N;
fs = Nsvec/N;
fm = Nmvec/N;

Ntotal = Nc+Np+Ns+Nm;
ftotal = Ntotal/N;