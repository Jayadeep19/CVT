%% Exercise 4
%    Program for creep test of a given stress curve
%    modelling and Analysis (SS 2021)(Material Modelling)

%% Step -1: Generate the given stress graph
%define the X-axis (time):
t0 = 0;
t1 = 1;
t2 = 4;
tend = 5;
dt = 0.1;       

%The desired time step
% Creating the time vectors with the dimension of the times and dt


time1 = t0:dt:t1;
time2 = t1:dt:t2;
time3 = t2:dt:tend;
time = [time1,time2,time3];
len_time = numel(time);



%Define the Y-axis (stress) and match the dimensions of the two vextors
%Creating the Sectional vectors for each section 
sect1 = zeros(size(time1));
sect2 = (1000-53)/(t2-t1)*(time2-t1)+53; %Sectional vector for a slope line using equation of line
sect3 = zeros(size(time3));

sigma = [sect1,sect2,sect3];

% time = t0:dt:tend;         %another way of writing the graph
% x=53;
% y=1000;
% z=linspace(x,y,(t2-t1)/dt);
% 
% sec1 = zeros(1,(t1-t0)/dt+1);
% sec2 = z.*ones(1,(t2-t1)/dt);
% sec3 = zeros(1,(tend-t2)/dt);
% 
% sigma = [sec1,sec2,sec3];

%Plot the given stress graph
figure(1);
hold on;
grid on;
xlabel('Time');
ylabel('Sigma');
title('Stress Curve');
plot(time,sigma,'r','LineWidth',3);
plot(1, 53,'o-');
legend('Given stress curve','Location','northwest')
hold off;
%% Using the given formulae plot the strain graph for the given stress graph acc to hooke element
%Hookes element
E = 750;
epsilon1 = hooks(sigma,E);  %Use the function name to call the function
figure(2); hold on; grid on; box on;
plot(time,epsilon1,'g','LineWidth',2);
xlabel('time');
ylabel('epsilon1');
title('Hooke strain curve');
legend('epsilon');

%% Using the given formulae plot the strain graph for the given stress graph acc to Newton element
%Newtons element
eta = 0.5;
epsilon2 = Newtons(sigma,eta,time);

figure(3); hold on; grid on; box on;
plot(time,epsilon2,'g','LineWidth',2);
xlabel('time');
ylabel('epsilon');
legend('epsilon');
title('Newton starin curve');

%% Using the given formulae plot the strain graph for the given stress graph
%acc to Max well Element
%Maxwell-element
 eta =1 ;
 E =7.5;
 dsigma = gradient(sigma, dt);      % to find the derivative of the sigma use 'gadient(value, increment)'
 epsilon3 = Maxwell(sigma,dsigma,eta,E,time);
 figure(4); hold on; grid on; box on;
 plot(time,epsilon3,'g','LineWidth',2);
 xlabel('time');
 ylabel('epsilon');
 legend('epsilon');
 title('Maxwell stain curve');
 
figure(5);          %plotting all the graphs in a single figure for better understanding
subplot(2,2,1);
    hold on;
    grid minor; box on;
    xlabel('Time');
    ylabel('Sigma');
    title('Stress Curve');
    plot(time,sigma,'r','LineWidth',3);
    axis([0 5 0 1050])
subplot(2,2,2);
    hold on;
    grid on; box on;
    plot(time,epsilon1, 'g', 'LineWidth', 2);
    xlabel('Time');
    ylabel('Epsilon1');
    title('Hooke strain curve');
    axis([0 5 0 2])
subplot(2,2,3);
    hold on;
    grid on; box on;
    plot(time,epsilon2,'g','LineWidth',2);
    xlabel('Time');
    ylabel('Epsilon');
    title('Newton starin curve');
    axis([0 5 0 4000])
subplot(2,2,4);
    hold on;
    grid on; box on;
    plot(time,epsilon3,'g','LineWidth',2);
    xlabel('Time');
    ylabel('Epsilon');
    title('Maxwell stain curve');
    axis([0 5 0 2000])
hold off;                    
    
% functions used in the program
 
 function [epsilon1] = hooks(sigma,E) 
 
 
epsilon1 = sigma/E;
 end
 
 function epsilon2_dot = Newtons(sigma,eta,time)
 epsilon = sigma/eta;
 epsilon2_dot = cumtrapz(time,epsilon);
 
 end
 
 function epsilon3_dor = Maxwell(sigma,dsigma,eta,E,time)
 
 epsilon = sigma/eta+dsigma/E;
 epsilon3_dor = cumtrapz(time,epsilon);
 
 end
 
 
