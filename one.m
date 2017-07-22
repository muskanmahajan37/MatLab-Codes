clc
clear all 
syms t s Y
y2=diff(sym('y(t)'),2); 
y1=diff(sym('y(t)'),1); 
y0=sym('y(t)');
a=input('The Coefficient of D2y = '); 
b=input('The Coefficient of Dy = '); 
c=input('The Coefficient of y = '); 
nh=input('Enter the non homogeneous part = '); 
eqn=a*y2+b*y1+c*y0-nh;
LTY=laplace(eqn,t,s); 
if(a==0)
   d=input('The initial value at 0 is : '); 
   LTY=subs(LTY,{'laplace(y(t),t,s)','y(0)'},{Y,d})
else
   d=input('The initial value at 0 is : '); 
   e=input('The initial value at 0 is : ');
   LTY=subs(LTY,{'laplace(y(t),t,s)','y(0)','D(y)(0)'},{Y,d,e})
end
eq=collect(LTY,Y);
Y=simplify(solve(eq,Y));
y=simplify(ilaplace(Y,s,t))