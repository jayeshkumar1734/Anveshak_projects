function f = FinalFunc(l1,l2,l3,phi1,phi2,a,w,wl,stepx4)

global  q t j  
a = 100;
w = pi/250;
wl = 2*pi/w;

stepx4=1;
q = sqrt((l3^2)+(l3^2)-(2*l3*l3*cos(phi2)));
j = l3*l3*sin(phi2)/q;
t = sqrt((l1^2)+(l2^2)-(2*l1*l2*cos(phi1)));

m = [];
for x4 = 0:stepx4:wl
    
    fun = @(x)(bnv(x,x4))
    lb = [x4];
    ub = [x4+ q];
    x = lsqnonlin(fun,((lb+ub)/2),lb,ub);
    m(round((x4/stepx4)+1),9)=x;
end

for i= 1:length(m)
    x4 =stepx4*(i-1);
    x5 = m(i,9);
    y4 = gr(x4,a,w);
    y5 = gr(x5,a,w);
    k = (y5-y4)/(x5-x4);
    
    xm = (x4+x5)/2;
    ym = (y4+y5)/2;
    
    x3 = xm - (j)*(k)/sqrt((k^2)+1);
    y3 = ym + (j)/sqrt((k^2)+1);
   
    m(i,5) =x3;
    m(i,6) =y3;
    
  
end


for i = 1:length(m)
    x3 = m(i,5);
    fund = @(x)(bnw(x,x3,m))
    
    lb1 = [x3-t];
    ub1 = [x3];
    xn = lsqnonlin(fund,lb1+0.01,lb1,ub1);
    
    m(i,1) = xn;
end

for i = 1:length(m)
    funck = @(x)f3(x,i,m,l1,l2)
    lb2 = [m(i,1),gr(m(i,1),a,w)];
    ub2 = [m(i,1)+l1,gr(m(i,1),a,w)+l1];
    xb = lsqnonlin(funck,(lb2+ub2)/2,lb2,ub2);
    
    m(i,3)= xb(1);
    m(i,4)= xb(2);
end
for i = 1:length(m)
    m(i,7) = (i-1)*stepx4;
    m(i,2) = gr(m(i,1),a,w);
    m(i,8) = gr(m(i,7),a,w);
    m(i,10) = gr(m(i,9),a,w);
    
end
m


f(1) = var(m(:,4))
end


