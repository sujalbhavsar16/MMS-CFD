function [L_infy,L_2,L_1,T]=p2(n)


%n=[5 9 17 33 65 129];


alpha=9.71*10^-5;L=1;
%n=[5 9 17 33 65 129];


del_x=L/(n-1);  
x=[0:del_x:L];

del_t=(del_x^2)/(2*alpha);

T(1,1)=300; 



T(1:length(x),1)=300; % initializing temp

f= @(x) 100*(0.25*(0.75-abs(x-(2/3))))^4; %source term in sub-function form


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
L_1(j)=abs(sum(R(:,j)));

T(1,j+1)=300; 

% Here we will update T at end boundary considering either 1st order
% scheme or second order scheme

%T(length(x),j+1)=T(length(x)-1,j+1)-200*del_x;  %for 1 order

T(length(x),j+1)=(-400*del_x+4*T(length(x)-1,j+1)-T(length(x)-2,j+1))/3; %for 2 order

Res=L_2(j);

%RR=Res/L_2(1)
 j=j+1;
% j
end
end