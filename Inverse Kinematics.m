clc; clf; all clear;
Px = 0.12;
Py = 2.1;
a1 = 1;
a2 = 1.5;
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

    ax1 = a1*cos(theta11);          %coordinates for link orientation #1
    ay1 = a1*sin(theta11);

    ax2 = a1*cos(theta12);          %coordinates for link orientation #2
    ay2 = a1*sin(theta12);

    Xcoordx = [-2,2];
    Xcoordy = [0,0];
    Ycoordx = [0,0];
    Ycoordy = [-2,3];

    l1x1 = [0,ax1];                 %link 1 orientation #1
    l1y1 = [0,ay1];

    l1x2 = [0,ax2];                 %link 1 orientation #2
    l1y2 = [0,ay2];

    l2x1 = [ax1,Px];                %link 2 orientation #1
    l2y1 = [ay1,Py];
    
    l2x2 = [ax2,Px];                %link 2 orientation #2
    l2y2 = [ay2,Py];
    

    plot(Xcoordx,Xcoordy,'r',Ycoordx,Ycoordy,'r',l1x1,l1y1,'g',l2x1,l2y1,'b',l1x2,l1y2,'--c',l2x2,l2y2,'--m')
    title("Ikin Of 2R Planar Manipulator") 

end 

%radians to degree conversion of joint parameters
theta11 = theta11*180/pi
theta12 = theta12*180/pi
theta21 = theta21*180/pi
theta22 = theta22*180/pi