function [theta11,theta12,theta21,theta22] = IKIN(a1,a2,px,py) 
 
C2 = (Px^2 + Py^2 - a1^2 - a2^2)/(2*a1*a2); 
if abs(C2) <= 1 
 S21 = sqrt(1-C2^2); 
 S22 = -sqrt(1-C2^2); 
 theta21 = atan2(S21,C2); 
 theta22 = atan2(S22,C2); 
 den1 = a1^2+a2^2+2*a1*a2*cos(theta21); 
 den2 = a1^2+a2^2+2*a1*a2*cos(theta22); 
 s11 = (Py*(a1+a2*cos(theta21))-Px*(a2*sin(theta21)))/den1; 
 s12 = (Py*(a1+a2*cos(theta22))-Px*(a2*sin(theta22)))/den2; 
 c11 = (Px*(a1+a2*cos(theta21))+Py*(a2*sin(theta21)))/den1; 
 c12 = (Px*(a1+a2*cos(theta22))+Py*(a2*sin(theta22)))/den2; 
 theta11 = atan2(s11,c11); 
 theta12 = atan2(s12,c12);
end