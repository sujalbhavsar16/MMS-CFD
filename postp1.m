%Adv.Intro. to Computational Fluid Dynamic
%HW5 Problem 1
%Sujal Bhavsar
clear;clc

%post processing of Norm v/s h graph
% h=[32 16 8 4 2 1];
% k=1;
% for n=[5 9 17 33 65 129]
%     [L_infynew,L_2new,L_infy,L_2,T,L_1]=lnorm(n);
%    
%     L_infyvec(k)=L_infynew;
%     L_2vec(k)=L_2new;
%     L_1vec(k)=L_1;
%     k=k+1;
% end
% figure();
% set(gca, 'YScale', 'log')
% semilogy(h,L_infyvec,'-ro')
% hold on
% semilogy(h,L_2vec,'-bo')
% semilogy(h,L_1vec,'-yo')
% xlabel('h')
% ylabel('Norm')
% legend({'$L_\infty Norm_h$','$L_2 Norm_h$','$L_1 Norm_h$'},'Interpreter','latex','Location','SouthEast')
% title('Global discretization error at different mesh sapcing')  
% hold off
% 
% %Observed order of accuracy
% h=[32 16 8 4 2 1];
% k=1;
% for n=[5 9 17 33 65 129]
%     [L_infynew,L_2new,L_infy,L_2,T,L_1]=lnorm(n);
%    
%     L_infyvec(k)=L_infynew;
%     L_2vec(k)=L_2new;
%     L_1vec(k)=L_1;
%     k=k+1;
% end
% 
% p=log(L_infyvec(1:5)./L_infyvec(2:6))./log(2);
% plot([16 8 4 2 1],p,'-s')
%  ylim([1 3]);
% hold on
% pp=log(L_2vec(1:5)./L_2vec(2:6))./log(2);
% plot([16 8 4 2 1],pp,'-s')
% 
% ppp=log(L_1vec(1:5)./L_1vec(2:6))./log(2);
% plot([16 8 4 2 1],ppp,'-s')
% legend({'$L_\infty$ Norm','$L_2$ Norm','$L_1$ Norm'},'Interpreter','latex')


% %post processing to plot converging residual vs iteration
% figure();
% h=[32 16 8 4 2 1];
% k=1;
% for n=[5 9 17 33 65 129]
%     [L_infynew,L_2new,L_infy,L_2,T]=lnorm(n);
%    
%     Linfyr=L_infy;
%     L2r=L_2;
%     loglog([1:length(L2r)],L2r,'-')
%     k=k+1;
%     hold on
% end
% legend({'n=5','n=9','n=17','n=33','n=65','n=129'},'NorthEast')
% 
% % loglog([1:length(L_infyvecr)],L_infyvecr,'-r')
% % hold on
% % semilogy([1:length(L_infyvecr)],L_2vecr,'-b')
% xlabel('iteration')
% ylabel('Norm of iterative residual')
% % legend({'$L_\infty Norm_h$','$L_2 Norm_h$'},'Interpreter','latex','Location','SouthEast')
% title('$L_2$ Norm of iterative residual','Interpreter','latex')  
% hold off

%post processing to plot converged T 
figure();
x=[0:0.01:1];
T_exact=300+200.*sin(3*pi.*x./(2*1));
plot(x,T_exact,'-k','LineWidth',2);
hold on
for n=[5 9 17 33 65 129]
    [L_infynew,L_2new,L_infy,L_2,T]=lnorm(n);
    TT=T(:,end);
    plot(linspace(0,1,length(TT)),TT,':s')
    hold on
 
end
xlabel('Distance along the rod')
ylabel('Temperature')
legend({'Exact','n=5','n=9','n=17','n=33','n=65','n=129'},'SouthWest')
title('Converged Temperature profile at different meshes and exact solution')  
hold off





