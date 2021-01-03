

syms l1 l2 l3 l4 a b m4 m5 m6 m7 m8 m9 

p=2700;
max=0;


H=0.35; %height of chassis
W=0.9; %span of chassis
R=0.125; %Wheel Radius
SH=0.34; %stair height
count=0;
aslimax=0;
% soll4=0.5031;
% sola=0.4636;

for t1=2*pi/3:pi/18:2*pi/3
    
    for t2=2*pi/3+pi/18:pi/18:2*pi/3+pi/18
        %startung all values from 1,1,1,1,1,1 ia better i think
        %we need to use if condition to check if the values are actual as
        %in solvable or not
        [soll1,soll2,soll3,soll4,sola,solb] = vpasolve([l1*cos(t1/2)+l3*sin(t2+a)==H-R,l1*sin(t1/2)-l3*cos(t2+a)+l4*cos(a)==W,l1*sin(t1-b)+l2*sin(b)==SH,l1*cos(t1-b)-l2*cos(b)==2*R,l4*cos(a)==W/2,l4*sin(a)==H-R],[l1,l2,l3,l4,a,b],[1,1,1,1,1,1]);
%         a1=double(soll1);
%         a2=double(soll2);
%         a3=double(soll3);
        %a4=double(soll4);
        
        
        %disp([a1,a2,a3,a4,t2,t1]);
        
        
        disp([soll1,soll2,soll3,soll4,sola,solb]);
        if soll1>0 & soll2>0 & soll3>0 &soll4>0
            l9=2*R/2+soll1*sin(90-t1/2);
         
            l6=soll3*sin(180-t2-sola);
        
            l7=soll2*cos(180-t2-sola);
            l5=soll3*cos(180-t2-sola);
            l8=soll1*cos(90-t1/2);
            m4=p*soll4;
            m5=p*l5;
            m6=p*l6;
            m7=p*l7;
            m8=p*l8;
            m9=p*l9;
            xcom=((-m4*(soll4*cos(sola)/2))+(m5*l5/2+m6*l5+m9*l5-m9*l7+m5*(l5-l7/2)+m8*(l5+l8/2)+m9*(l5+l8)))/(m4+m5+m6+m7+m8+2*m9);
            ycom=(m4*(H-(soll4*sin(sola)/2))+m5*H+m6*(H-l6/2)+m9*(2*R/2+l9)+(m7+m8)*(l9+2*R/2))/(m4+m5+m6+m7+m8+2*m9);
            soltan=(180/pi)*atan((soll4*cos(sola)+xcom)/(ycom));
            
        
            disp(soltan)  
            
            disp([soll1,soll2,soll3,soll4,sola,solb]);
            max=soltan;
            
            
            
            
            
%         
%         if max>aslimax
%             aslimax=max;
%             l1=soll1;
%             l2=soll2;
%             l3=soll3;
%             l4=soll4;
%             a=sola;
%             b=solb;
%            
%         end
%         
            count=count+1;
            disp(count);
            disp(t1*180/pi);
            disp(t2*180/pi);
%             global a w wl q t 
%             a = 500;
%             w = pi/250;
%             wl = 2*pi/w;


% l4=377.0561;
% l3=268.9857;
% l1=251.4998;
% l2=251.4998;
% phi1=110.9*pi/180;
% phi2=111*pi/180;
%             stepx4=1;
%             q = sqrt((a1^2)+(a2^2)-(2*a1*a2*cos(t1)));
%             j = (a1*a2*sin(t1)/q);
%             t = (sqrt((a4^2)+(a3^2)-(2*a4*a3*cos(t2))));
% 
%             m = [];
%             for x4 = 0:stepx4:wl
% 
%                 fun = @(x)(bnv(x,x4,q));
%                 lb = [x4];
%                 ub = [x4+ q];
%                 x = lsqnonlin(fun,((lb+ub)/2.00),lb,ub);
%                 m(round((x4/stepx4)+1),9)=x;
%             end
% 
%             for i= 1:length(m)
%                 x4 =stepx4*(i-1);
%                 x5 = m(i,9);
%                 y4 = gr(x4,a,w);
%                 y5 = gr(x5,a,w);
%                 k = (y5-y4)/(x5-x4);
% 
%                 xm = (x4+x5)/2;
%                 ym = (y4+y5)/2;
% 
%                 x3 = xm - (j)*(k)/sqrt((k^2)+1);
%                 y3 = ym + (j)/sqrt((k^2)+1);
% 
%                 m(i,5) =x3;
%                 m(i,6) =y3;
% 
% 
%             end
% 
% 
%             for i = 1:length(m)
%                 x3 = m(i,5);
%                 fund = @(x)(bnw(x,x3,m));
% 
%                 lb1 = [x3-t];
%                 ub1 = [x3];
%                 xn = lsqnonlin(fund,lb1+0.01,lb1,ub1);
% 
%                 m(i,1) = xn;
%             end
% 
%             for i = 1:length(m)
%                 funck = @(x)f3(x,i,m,a4,a3);
%                 lb2 = [m(i,1),gr(m(i,1),a,w)];
%                 ub2 = [m(i,1)+a4,gr(m(i,1),a,w)+a4];
%                 xb = lsqnonlin(funck,(lb2+ub2)/2,lb2,ub2);
% 
%                 m(i,3)= xb(1);
%                 m(i,4)= xb(2);
%             end

%             for i = 1:length(m)
%                 m(i,7) = (i-1)*stepx4;
%                 m(i,2) = gr(m(i,1),a,w);
%                 m(i,8) = gr(m(i,7),a,w);
%                 m(i,10) = gr(m(i,9),a,w);
% 
%             end
%             disp(var(m(:,4)));
        end
        
%         
%         disp(aslimax);
    end
end
% disp(aslimax);
% disp(l1);
% disp(l2);
% disp(soll3);
% disp(l4);
% disp(a);
% disp(b);
    

            
            
            
             
           