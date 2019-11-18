function [L_infynew,L_2new,L_infy,L_2,T,L_1]=lnorm(n)

%Adv.Intro. to Computational Fluid Dynamic
%HW5 Problem 1
%Sujal Bhavsar

%This function solves 1D heat transfer equation explicitely using local
%time step to obtaine steady state solution

% INPUT: n is the number of node
%n=[5 9 17 33 65 129]
% OUTPUT: L_infynew is the infinity norm of residuals of converged numerical
% solution and exact solution (manufactured one).
% L_2new is the second norm of residuals.
%L_infy and L_2 is the infinity and second norm of the converging solution ( which is yet to
%converged) 
%T is matrix that will give temperature as function of x and t. the last
%coumlm correspnods to converged solution


% L_infyc=L_infy(length(L_infy));
% L_2c=L_2(length(L_infy));



% Defining problem parameter
alpha=9.71*10^-5;L=1;

% Defining independent variables
del_x=L/(n-1);  
x=[0:del_x:L];

del_t=(del_x^2)/(2*alpha); % Here the value of r is assumed to be 1/2

%Defining BCs
T(1,1)=300; T(length(x),1)=100; 

T(2:length(x)-1,1)=0; % initializing temp

f= @(x) (alpha*450*(pi^2)*sin(3*pi*x/2)); %source term in sub-function form


%Number of iterative loops were tested using Residual ratio, Residual,
%Iteratiive erro as a deciding criteria

j=1;
Res=1;

iter_error=1;
%while RR>=10^-6
while Res>=10^-10
 %while iter_error>=10^-6   
%for j=1:round(40*n/5)
 
for i=2:length(x)-1
    
T(i,j+1)=(f(x(i))+(alpha/(del_x^2))*(T(i+1,j)-2*T(i,j)+T(i-1,j)))*del_t+T(i,j);

R(i,j)=f(x(i))+(alpha/(del_x^2))*(T(i+1,j)-2*T(i,j)+T(i-1,j));
end

iter_error=max((T(:,j+1)-T(:,j))./T(:,j));

L_infy(j)=max(R(:,j));
L_2(j)=(sum(R(:,j).^2)/length(R(:,j)))^0.5;


T(1,j+1)=300; T(length(x),j+1)=100;   
Res=L_2(j);

%RR=Res/L_2(1)
 j=j+1;
% j
end


%exact solution based on manufactured soluton
T_exact=300+200.*sin(3*pi.*x./(2*L));

%Global discretization errro in numerical solution
L_infynew= max(abs(T_exact'-T(:,end)));
L_2new=sqrt((sum((T_exact'-T(:,end)).^2))./n);
L_1=sum(abs(T_exact'-T(:,end)));
end


