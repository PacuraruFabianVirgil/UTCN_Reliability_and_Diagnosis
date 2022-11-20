load lab01_02.mat

plot(sdata,'-*');
grid;

x1 = min(data);

xn = max(data);

W = xn-x1;

xc = (x1+xn)/2;

m = floor(sqrt(n));

w = W/(m-1);

U1 = x1 - w/2;

U2 = U1 + w;

U3 = U2 + w;

U4 = U3 + w;

U5 = U4 + w;

U6 = U5 + w;

U7 = U6 + w;

vector1 = sdata(1);
vector2 = sdata(2);
vector3 = sdata(3:12);
vector4 = sdata(13:38);
vector5 = sdata(39);
vector6 = sdata(40);

xc1 = (U1 + U2)/2;
xc2 = (U2 + U3)/2;
xc3 = (U3 + U4)/2;
xc4 = (U4 + U5)/2;
xc5 = (U5 + U6)/2;
xc6 = (U6 + U7)/2;

f1 = length(vector1)/length(sdata);
f2 = length(vector2)/length(sdata);
f3 = length(vector3)/length(sdata);
f4 = length(vector4)/length(sdata);
f5 = length(vector5)/length(sdata);
f6 = length(vector6)/length(sdata);

right1 = f1*xc1;
right2 = f2*xc2;
right3 = f3*xc3;
right4 = f4*xc4;
right5 = f5*xc5;
right6 = f6*xc6;

xdneg = right1 + right2 + right3 + right4 + right5 + right6;

xneg = mean(sdata);
Mg = geomean(sdata);
Msq = norm(sdata)/sqrt(length(sdata));
Mh = harmmean(sdata);
Me = median(sdata);

ssquared = 1/(length(sdata)-1)*sum((sdata-xneg).^2);
thetasquared = 1/length(sdata)*sum((sdata-xneg).^2);

prctile(sdata,25);
prctile(sdata,50);
prctile(sdata,75);