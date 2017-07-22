clc;
clear all;
y=-1:0.01:1;
A=1,R=1,m=2,a=5.34;
subplot(2,2,1)
I0=besselj(0,i*sqrt(i)*y*a);
I1=besselj(0,i*sqrt(i)*a);
W1=A*R^2/(i*m*a^2)*(1-I0/I1)*exp(i*0);
W2=A*R^2/(i*m*a^2)*(1-I0/I1)*exp(i*pi/12);
W3=A*R^2/(i*m*a^2)*(1-I0/I1)*exp(i*pi/6);
W4=A*R^2/(i*m*a^2)*(1-I0/I1)*exp(i*pi/4);
W5=A*R^2/(i*m*a^2)*(1-I0/I1)*exp(i*pi/3);
plot(y,W1,'k','linewidth',0.5);hold on
plot(y,W2,'m','linewidth',0.5);hold on
plot(y,W3,'b','linewidth',0.5);hold on
plot(y,W4,'r','linewidth',0.5);hold on
plot(y,W5,'g','linewidth',0.5);
xlabel('y')
ylabel('velocity')