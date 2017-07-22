clc
clear all
close all
syms x1(t) x2(t) 
A = input('Enter the coefficient matrix A : ');
lambda = eig(A);
fprintf('eigen values of A are %f,%f\n\n',lambda);
for i=1:length(lambda)
   temp=null(A-lambda(i)*eye(size(A)),'r');
   P(:,i)=temp./min(temp);
end
disp('The Modal Matrix is :');
disp(P);
D = inv(P)*A*P;
X = [x1;x2];
sol1 = dsolve(diff(x1,2)+D(1)*x1==0);
sol2 = dsolve(diff(x2,2)+D(4)*x2==0);
disp('The solution of the system diff(X,2)+DX=0 is : ');
disp(sol1);
disp(sol2);
disp('The solution of the given system is : ');
Y = P*[sol1;sol2]