function hermite=hermite()
a1=input('for constant term ');
b1=input('for power1 ');
c1=input('for power2 ');
d1=input('for power3 ');
a2=input('for constant term ');
b2=input('for power1 ');
c2=input('for power2 ');
d2=input('for power3 ');
a3=input('for constant term ');
b3=input('for power1 ');
c3=input('for power2 ');
d3=input('for power3 ');
u=input('value of u for truncation');
x0=a1;
P0=b1;
syms x1 P1
eqn1 =3*(x1-x0)-2*P0-P1 ==c1;
eqn2 =P0+P1-2*(x1-x0) ==d1;
sol = solve([eqn1, eqn2], [x1,P1]);
xSol = sol.x1;
ySol = sol.P1;
y0=a2;
Py0=b2;
syms y1 Py1
eqn3 =3*(y1-y0)-2*Py0-Py1 ==c2;
eqn4 =Py0+Py1-2*(y1-y0) ==d2;
sol = solve([eqn3, eqn4], [y1,Py1]);
x1Sol = sol.y1;
y1Sol = sol.Py1;

z0=a3;
Pz0=b3;
syms z1 Pz1
eqn5 =3*(z1-z0)-2*Pz0-Pz1 ==c3;
eqn6 =Pz0+Pz1-2*(z1-z0) ==d3;
sol = solve([eqn5, eqn6], [z1,Pz1]);
x2Sol = sol.z1;
y2Sol = sol.Pz1;

disp(x0);
disp(xSol);
disp(P0);
disp(ySol);
disp(y0);
disp(x1Sol);
disp(Py0);
disp(y1Sol);
disp(z0);
disp(x2Sol);
disp(Pz0);
disp(y2Sol);




syms X
Z1=a1+b1*(X)+c1*(X.^2)+d1*(X.^3);
Z2=a2+b2*(X)+c2*(X.^2)+d2*(X.^3);
Z3=a3+b3*(X)+c3*(X.^2)+d3*(X.^3);
Y(X)=[Z1,Z2,Z3];



r1(X)=diff(Y(X));


r2(X)=diff(Y(X),2);


r3(X)=diff(Y(X),3);
k1(X)=cross(r1(X),r2(X));


modk1(X)=k1(X).*k1(X);
dummy1(X)=sum(modk1(X));
mag1(X)=sqrt(dummy1(X));
modr1(X)=r1(X).*r1(X);
dummy2(X)=sum(modr1(X));
mag2(X)=sqrt(dummy2(X));
mag3(X)=power(mag2(X),3);


k(X)=mag1(X)/mag3(X);
disp(k(X));
subplot(2,2,1);
fplot(k(X),[0,1],'-o');




dummy3(X)=dot(k1(X),r3(X));
mag4(X)=power(mag1(X),2);

t(X)=dummy3(X)/mag4(X);
disp(t(X));
subplot(2,2,2);
fplot(t(X),[0,1],'-o');



syms X

Z1(X)=a1+b1*(X)+c1*(X.^2)+d1*(X.^3);
Z2(X)=a2+b2*(X)+c2*(X.^2)+d2*(X.^3);
Z3(X)=a3+b3*(X)+c3*(X.^2)+d3*(X.^3);
L1(X)=P0*X;
L2(X)=Py0*X;
L3(X)=Pz0*X;
L4(X)=ySol*X;
L5(X)=y1Sol*X;
L6(X)=y2Sol*X;
subplot(2,2,3);
scatter3(Z1(0),Z2(0),Z3(0),'o');
hold on;
fplot3(Z1(X),Z2(X),Z3(X),[0,1]);
hold on;
scatter3(Z1(1),Z2(1),Z3(1),'o');
hold on;
fplot3(L1(X)+Z1(0),L2(X)+Z2(0),L3(X)+Z3(0),[0 1]);
hold on;
fplot3(L4(X)+Z1(1),L5(X)+Z2(1),L6(X)+Z3(1),[0 1]);

hold off;



xu=Z1(u);
yu=Z2(u);
zu=Z3(u);
Pux0=P0*(1-u);
Puy0=Py0*(1-u);
Puz0=Pz0*(1-u);

disp(xu);
disp(xSol);
disp(Pux0);
disp(ySol);
disp(yu);
disp(x1Sol);
disp(Puy0);
disp(y1Sol);
disp(zu);
disp(x2Sol);
disp(Puz0);
disp(y2Sol);

syms X

Z4(X)=(1-3*(X.^2)+2*(X.^3))*xu+(3*(X.^2)-2*(X.^3))*xSol+(X-2*(X.^2)+(X.^3))*Pux0+((X.^3)-(X.^2))*ySol;
Z5(X)=(1-3*(X.^2)+2*(X.^3))*yu+(3*(X.^2)-2*(X.^3))*x1Sol+(X-2*(X.^2)+(X.^3))*Puy0+((X.^3)-(X.^2))*y1Sol;
Z6(X)=(1-3*(X.^2)+2*(X.^3))*zu+(3*(X.^2)-2*(X.^3))*x2Sol+(X-2*(X.^2)+(X.^3))*Puz0+((X.^3)-(X.^2))*y2Sol;


M1(X)=P0*X;
M2(X)=Py0*X;
M3(X)=Pz0*X;
M4(X)=ySol*X;
M5(X)=y1Sol*X;
M6(X)=y2Sol*X;


subplot(2,2,4);
scatter3(Z4(0),Z5(0),Z6(0),'o');
hold on;
fplot3(Z4(X),Z5(X),Z6(X),[0,1]);
hold on;
scatter3(Z4(1),Z5(1),Z6(1),'o');
hold on;
fplot3(M1(X)+Z4(0),M2(X)+Z5(0),M3(X)+Z6(0),[0 1]);
hold on;
fplot3(M4(X)+Z4(1),M5(X)+Z5(1),M6(X)+Z6(1),[0 1]);

hold off;




















