clear all
close all
clc
syms A B x m
p=input('Enter coefficient a,b,c : ');
f=input('Enter the RHS function f(x) : ');
a=p(1);
b=p(2); 
c=p(3);
disc=b^2-4*a*c;
m=subs(solve('a*m^2+b*m+c'));
if(disc>0)
    CF=A*exp(m(1)*x)+B*exp(m(2)*x);
    u=exp(m(1)*x);
    v=exp(m(2)*x);
elseif(disc==0)
    CF=(A+B*x)*exp(m(1)*x);
    u=exp(m(1)*x);
    v=x*exp(m(1)*x);
else
    alfa=real(m(1));
    beta=imag(m(1));
    CF = exp(alfa*x)*(A*cos(beta*x)+B*sin(beta*x));
    u = exp(alfa*x)*cos(beta*x);
    v = exp(alfa*x)*sin(beta*x);
end
f1=f/a;
jac=u*diff(v,x)-diff(u,x)*v;
P=int(-v*f1/jac,x);
Q=int(u*f1/jac,x);
PI=P*u+Q*v;
y_gen=CF+PI;
dy_gen=diff(y_gen);
cond=input('Enter the initial conditions x0,y(x0) and Dy(x0) : ');
eq1 = (subs(y_gen,x,cond(1))-cond(2));
eq2 = (subs(dy_gen,x,cond(1))-cond(3));
[A B]=solve(eq1,eq2);
y=subs(CF+PI)