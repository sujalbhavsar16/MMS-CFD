% Residual vs iteration for finesh mesh

clear;clc


% %post processing to plot converging residual vs iteration
% 
% h=[32 16 8 4 2 1];
% k=1;
% % for second order
% %     [L_infy,L_2,L_1,T]=p2(129);
% %    
% %     Linfyr=L_infy;
% %     L2r=L_2;
% %     loglog([1:length(L2r)],L2r,'-')
% %     k=k+1;
%      hold on
% 
%      
%      % for 1st order
%     [L_infy,L_2,L_1,T]=p21(129);
%      Linfyr1=L_infy;
%     L2r1=L_2;
%     loglog([1:length(L2r1)],L2r1,'-')
%     
%     
% %legend({'n=5','n=9','n=17','n=33','n=65','n=129'},'NorthEast')
% legend({'@nd order BC','1st order BC'})
% title('Iterative residual for the fnest mesh')
% % loglog([1:length(L_infyvecr)],L_infyvecr,'-r')
% % hold on
% % semilogy([1:length(L_infyvecr)],L_2vecr,'-b')
% xlabel('iteration')
% ylabel('Norm of iterative residual')
% % legend({'$L_\infty Norm_h$','$L_2 Norm_h$'},'Interpreter','latex','Location','SouthEast')
% title('$L_2$ Norm of iterative residual','Interpreter','latex')  
% hold off



%numerical solution comparison

%post processing to plot converged T 
% figure();
% 
% for n=[5 9 17 33 65 129]
%     [L_infy,L_2,L_1,T]=p2(n);
%     TT=T(:,end);
%     plot(linspace(0,1,length(TT)),TT,':s')
%     hold on
%     end
%     
%   
% xlabel('Distance along the rod')
% ylabel('Temperature')
% legend({'n=5','n=9','n=17','n=33','n=65','n=129'},'Location','NorthWest')
%  title('Temperature profiles for second order BC')


%observed order of accuracy for 2nd order BC

r=2;
p=2; %Former order of accuracy
[L_infy1,L_21,L_11,T1] = p2(129);
[L_infy2,L_22,L_12,T2] = p2(65);
[L_infy3,L_23,L_13,T3] = p2(33);
[L_infy4,L_24,L_14,T4] = p2(17);
[L_infy5,L_25,L_15,T5] = p2(9);
[L_infy6,L_26,L_16,T6] = p2(5);

% Defining norms
L1 = (sum((T1(1:2:end,end)- T2(:,end)).^2)/129)^0.5;
L2 = (sum((T2(1:2:end,end) - T3(:,end)).^2)/65)^0.5;
L3 = (sum((T3(1:2:end,end) - T4(:,end)).^2)/33)^0.5;
L4 = (sum((T4(1:2:end,end) - T5(:,end)).^2)/17)^0.5;
L5 = (sum((T5(1:2:end,end) - T6(:,end)).^2)/9)^0.5;

%observed order of accuracy
p21 = log(L2/L1)/(log(r));
p22 = log(L3/L2)/(log(r));
p23 = log(L4/L3)/(log(r));
p24 = log(L5/L4)/(log(r));


if abs(p21-2)<=0.2;
    Fs1 = 1.25;
else
    Fs1 = 3;
end
gci1 = (Fs1/(r^p - 1))*(abs((T1(1:2:end,end) - T2(:,end))./T2(:,end)));
if abs(p22-2)<=0.2;
    Fs1 = 1.25;
else
    Fs2 = 3;
end
gci2 = (Fs2/(r^p - 1))*(abs((T2(1:2:end,end) - T3(:,end))./T3(:,end)));
if abs(p23-2)<=0.2;
    Fs3 = 1.25;
else
    Fs3 = 3;
end
gci3 = (Fs3/(r^p - 1))*(abs((T3(1:2:end,end)- T4(:,end))./T4(:,end)));
if abs(p24-2)<=0.2;
    Fs4 = 1.25;
else
    Fs4 = 3;
end
gci4 = (Fs4/(r^p - 1))*(abs((T4(1:2:end,end) - T5(:,end)))./T5(:,end));
Fs5 = 3;
gci5 = (Fs5/(r^p - 1))*(abs((T5(1:2:end,end) - T6(:,end)))./T6(:,end));


x1 = 0:1/64:1;
x2 = 0:1/32:1;
x3 = 0:1/16:1;
x4 = 0:1/8:1;
x5 = 0:1/4:1;
figure(1)
plot(x1,gci1,'-s');
hold on
plot(x2,gci2,'-s');
plot(x3,gci3,'-s');
plot(x4,gci4,'-s');
plot(x5,gci5,'-s');
xlabel('Distance along the rod')
ylabel('Grid Convergence Index')
legend('65 common nodes', '33 common nodes', '17 common nodes', '9 common nodes', '5 common nodes')
title('For 1st order BC')
