clc; clear all; clf;

a1 = 1; m1 = 1;
a2 = 1; m2 = 1;
g = 9.81;
T = 10;
th1T = pi;
th2T = pi/2;

th10 = 0;
th20 = 0;


con = 2*pi/T;

del1T = th1T-th10;
del2T = th2T-th20;

for i = 1:51
    ti(i) = (i-1)*T/50;
    ang = con*ti(i);

    th1(i) = th10 + del1T*(ti(i)-sin(ang))/T;
    th1d(i) = del1T*(1-cos(ang))/T;
    th1dd(i) = del1T*(con*sin(ang))/(T);

    th2(i) = th20 + del2T*(ti(i)-sin(ang))/T;
    th2d(i) = del2T*(1-cos(ang))/T;
    th2dd(i) = del2T*(con*sin(ang))/(T);
end

thdd = [th1dd;th2dd];

i11 = m1*a1^2/3 + m2*(a1^2+(a2^2)/3+a1*a2*cos(th2));
i12 = m2*((a2^2)/3+a1*a2*cos(th2)/2);
i21 = i12;
i22 = m2*(a2^2)/3;

Im = [i11.*th1dd+i21.*th2dd;i21.*th1dd+i22.*th2dd];

h11 = -m2*a1*a2*sin(th2).*th2d.*(th1d+th2d/2);
h21 = m2*a1*a2*sin(th2).*th1d.^2;

H = [h11;h21];

g11 = m1*g*a1*cos(th1)/2 + m2*g*(a1*cos(th1)+a2/2*cos(th1+th2));
g21 = m2*g*a2/2*cos(th1+th2);

G = [g11;g21];

tau = Im + H + G;

figure(1)
plot(ti,th1,'-',ti,th2,':',LineWidth=2)

figure(2)
plot(ti,th1d,'-',ti,th2d,':',LineWidth=2)

figure(3)
plot(ti,th1dd,'-',ti,th2dd,':',LineWidth=2)

figure(4)
plot(ti,tau,'-',ti,tau,':',LineWidth=2)

