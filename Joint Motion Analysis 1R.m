clc; clear all; clf;
a=1;			
T=10;			
thetaT=pi;		
th0=0; 
m=1; 
g=9.81; 

co=2*pi/T; 
deltah=thetaT-th0;
inertia=m*a*a/3;
gravitational=m*a*g/2;
for i=1:51
    time(i)=(i-1)*T/50;
    angular=co*time(i);
%joint trajectory
th(i)=th0+(deltah/T)*(time(i)-sin(angular)/co);
thd(i)=deltah*(1-cos(angular))/T;
thdd(i)=deltah*(co*sin(angular))/T;
%joint torque
tau(i)=inertia*thdd(i)+gravitational*sin(th(i));
end

figure(1)
plot(time,th,"-",time,thd,".",time,thdd,"-.");
title("Joint Motion analysis of 1 link 1 DOF arm")

figure(2)
plot(time,tau);
title("Joint Torque analysis of 1 link 1 DOF arm")
