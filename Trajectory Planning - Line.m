 clc; clear all; clf; 

a1=1.5; % link lenghts are kept as 1.5 units for both links
a2=1.5; 
n=100; 
 
Px_Array=zeros(n,1); 
Py_Array=zeros(n,1); 
 
ax_array=zeros(n,1); 
ay_array=zeros(n,1); 
 
Sim_Time_Array=linspace(0,1,n); 
theta1_Array=zeros(n,1); 
theta2_Array=zeros(n,1); 
 
P1=[1.5;0];             % initial position
P2=[-1;-.2];            % final position
 
Delat_P = P2-P1; 
t_Array = linspace(0,1,n)'; 
 
for i=1:n 
    t=t_Array(i); 
    P=P1+(t*Delat_P); 
    Px_Array(i)=P(1); 
    Py_Array(i)=P(2); 
end 
 
[theta1_1,theta2_1,theta1_2,theta2_2]=IKIN(a1,a2,Px_Array(1),Py_Array(1)); 
theta1_Prev=theta1_1; 
theta2_Prev=theta2_1; 
 
for i=1:n 
    
[theta1_1,theta2_1,theta1_2,theta2_2]=IKIN(a1,a2,Px_Array(i),Py_Array(i)); 
    if ((((theta1_1-theta1_Prev)^2)-((theta2_1-theta2_Prev)^2))<(((theta1_2-theta1_Prev)^2)-((theta2_2-theta2_Prev)^2))) 
        theta1=theta1_1; 
        theta2=theta2_1; 
    else 
        theta1=theta1_2; 
        theta2=theta2_2; 
    end 
    theta1_Array(i)=theta1; 
    theta2_Array(i)=theta2; 
    ax_array(i)=a1*cos(theta1); 
    ay_array(i)=a1*sin(theta1); 
end 
 
xaxisxcoordinate=[-4 4]; 
xaxisycoordinate=[0 0]; 
 
yaxisxcoordinate=[0 0]; 
yaxisycoordinate=[-4 4]; 
 
for i=1:n 
    Trace_X_Array(i)=Px_Array(i); 
    Trace_Y_Array(i)=Py_Array(i); 
    
plot(xaxisxcoordinate,xaxisycoordinate,"r",yaxisxcoordinate,yaxisycoordinate,"r"); 
    hold on; 
    plot([0 ax_array(i)],[0 ay_array(i)],"b",[ax_array(i) Px_Array(i)],[ay_array(i) 
Py_Array(i)],"g") 
    hold on; 
    plot(Trace_X_Array,Trace_Y_Array,"black") 
    hold off; 
    pause(0.05); 
    title("Trajectory Planning of 2R planar manipulator-Line") 
    trace=Sim_Time_Array'; 
end