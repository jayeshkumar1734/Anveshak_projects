func = @(x)(FinalFunc(x(1),x(2),x(3),x(4),x(5),a,w,wl,stepx4));

global q t j
a = 100;
w = pi/250;
wl = 2*pi/w;

stepx4=1;
x0 = [445,345,221,111*pi/180,110.9*pi/180];
x = fminsearch(func,x0)