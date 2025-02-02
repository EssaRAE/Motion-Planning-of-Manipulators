clc; clear all; clf;

t = linspace(0,1,100);
for i = 1:100
    th(i) = 10+350*(t(i)^3)-525*(t(i)^4)+210*(t(i)^5);
    thd(i) = 350*3*(t(i))^2-525*4*(t(i))^3+210*5*(t(i))^4;
    thdd(i) = 350*6*(t(i))-525*4*3*(t(i))^2+210*5*4*(t(i))^3;
    thddd(i) = 350*6-525*4*6*(t(i))+210*5*12*(t(i))^2;
end


plot(t,th,t,thd/2,t,thdd/10,t,thddd/100,LineWidth=1.5)
