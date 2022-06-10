% Exercise 5
% 

%% Creep behaviour
% For the first stress graph.
clc
close all
%initial parameters
t0 = 0;
t1 = 1;
t2 = 4;
tend = 5;
dt = 0.01;

%define time vector

time = t0:dt:tend;

%sigma vector

sigma1 = zeros(1, (t1-t0)/dt+1);
sigma2 = 50*ones(1,(t2-t1)/dt);
sigma3 = zeros(1, (tend-t2)/dt);
sigma = [sigma1,sigma2,sigma3];


%plot the graph
figure(1);
hold on;grid on;
plot(time,sigma,'r','LineWidth',3);
xlabel('time');
ylabel('stress');
legend('given stress');
axis([0 5 0 100]);
title('Stress 1');
hold off;

% Code for the first stress

sigma_dot = gradient(sigma,dt);
t_sig = time;
tspan = [time(1) time(end)];
y0 = 0;
options=odeset('MaxStep',1e-3);

[result_time, strain_1] = ode23(@(t,eps)eps1(t,eps,sigma,t_sig,sigma_dot),tspan,y0,options);

figure(2);
hold on;grid on;
plot(result_time,strain_1,'g', 'LineWidth',3);
plot(time,sigma,'r','LineWidth',3);
xlabel('Time');
legend('strain','stress');
title('Creep behavior of stress 1')
axis([0 5 0 0.05]);
hold off;

%plot combined graphs
figure(3);
subplot(1,2,1);
    hold on; grid on;
    plot(time,sigma,'r','LineWidth',3);
    xlabel('time');
    ylabel('stress');
    legend('given stress');
    axis([0 5 0 100]);
    title('Stress 1');
subplot(1,2,2);
    hold on; grid on;
    plot(result_time,strain_1,'g', 'LineWidth',3);
    plot(time,sigma,'r','LineWidth',3);
    xlabel('Time');
    legend('strain','stress');
    title('Creep behavior of stress 1')
    axis([0 5 0 0.05]);
hold off;

%% For second sigma

sigma1 =zeros(1, (t1-t0)/dt+1);
sigma2 = linspace(50,80,(t2-t1)/dt);
sigma3 = zeros(1,(tend-t2)/dt);

sigma_2 = [sigma1,sigma2,sigma3];

%plot the graph

figure(4);
hold on;grid on;
plot(time,sigma_2,'r','LineWidth',3);
xlabel('time');
ylabel('stress');
legend('given  second stress');
axis([0 5 0 100]);
title('Stress curve 2');
hold off;

% Code for the second stress

sigma_dot_2 = gradient(sigma_2,dt);
t_sig_2 = time;
tspan = [time(1) time(end)];
y0 = 0;
options=odeset('MaxStep',1e-3);

[resul_time, strain_2] = ode23(@(t,eps_2)eps2(t,eps_2,sigma_2,t_sig_2,sigma_dot_2),tspan,y0,options);

figure(5);
hold on;grid on;
plot(resul_time,strain_2,'g', 'LineWidth',3);
plot(time,sigma_2,'r','LineWidth',3);
xlabel('Time');
legend('strain','stress');
axis([0 5 0 0.08]);
title('Creep bahavior for the stress graph 2');
hold off;



%% Plot the strains
%strain 1

section11 = zeros(1,(t1-t0)/dt+1);
section21 = 0.02*ones(1,(t2-t1)/dt);
section31 = zeros(1,(tend-t2)/dt);

strain_1 = [section11,section21,section31];

figure(6);
hold on; grid on
plot(time,strain_1,'g','LineWidth',3);
xlabel('time');
ylabel('strain');
legend('given strain');
title('Strain 1')
axis([0 5 0 0.05]);
hold off;

epsdot_1 = gradient(strain_1,dt);
t_epsdot_1 = time;
Tspan =[time(1) time(end)];
IC = 0;
options=odeset('MaxStep',1e-4);

[result_time, result_sigma] = ode23(@(t,sigma)ODEMaxwell1_help1(t,sigma,strain_1,t_epsdot_1,epsdot_1),Tspan,IC,options); 

% plot the stress response
figure(7);
hold on;grid on;
plot(result_time, result_sigma,'g', 'LineWidth',3);
plot(time,strain_1,'r','LineWidth',3);
xlabel('Time');
legend('stress response','applied strain');
axis([0 5 0 0.08]);
title('Relaxation bahavior for the strain graph 1');
hold off;



%% second strain

section1 = zeros(1, (t1-t0)/dt+1);
section2 = linspace(0.02, 0.05, (t2-t1)/dt);
section3 = zeros(1,(tend-t2)/dt);

strain_2 = [section1, section2,section3];

%plot the graphs
figure(8);
hold on;grid on;
plot(time,strain_2,'g','LineWidth',3);
xlabel('time');
legend('given strain');
title('Given strain2');
axis([0 5 0 0.07]);
hold off;

epsdot_2 = gradient(strain_2,dt);
t_epsdot_2 = time;

Tspan =[time(1) time(end)];     
IC = 0;           
options=odeset('MaxStep',1e-4);     

%%%% solve the ODE %%%%%
[result_time, result_sigma2] = ode23(@(t,sigma_2)ODEMaxwell1_help2(t,sigma_2,strain_2,t_epsdot_2,epsdot_2),Tspan,IC,options); 


% plot the stress response
figure(9);
hold on; grid on; box on;
plot(result_time,result_sigma2,'r','LineWidth',3);
plot(time,strain_2,'g','LineWidth',3);
xlabel('Time');
legend('Stress Response','Applied strain');
title('Relaxation Behavior for strain 2')
hold off;

%%
function eps_dot = eps1(t,eps,sig,ts,sig_dot)
E1 = 750;
E2 = 1000;
eta = 500;

g = eta +(eta*(E2/E1));

sigm = interp1(ts, sig ,t);

sigm_dot = interp1(ts,sig_dot,t);

eps_dot = (sigm/g)+(((eta/E1)*sigm_dot)/g)-((E2*eps)/g);

end


function eps_dot2 = eps2(t,eps,sig,ts,sig_dot)
E1 = 750;
E2 = 1000;
eta = 500;

g = eta +(eta*(E2/E1));

sigm = interp1(ts, sig ,t);

sigm_dot = interp1(ts,sig_dot,t);

eps_dot2 = (sigm/g)+(((eta/E1)*sigm_dot)/g)-((E2*eps)/g);

end


function sigmadot = ODEMaxwell1_help1(t,sigma,epsilon1,t_epsdot,epsilondot)
 E1=750;
 E2=1000;
 eta = 500;
% define parameters
epsdot = interp1(t_epsdot,epsilondot,t);
epsilon = interp1(t_epsdot,epsilon1,t);


% ODE to be solved
sigmadot =(E1*E2*epsilon)/eta+(E1+E2)*epsdot-(E1*sigma)/eta ;

end



function sigmadot = ODEMaxwell1_help2(t,sigma,strain_2,t_epsdot,epsilondot)
 E1=750;
 E2=1000;
 eta = 500;
% sigma = 50;
% define parameters
epsdot = interp1(t_epsdot,epsilondot,t);
epsilon = interp1(t_epsdot,strain_2,t);


% ODE to be solved
sigmadot =(E1*E2*epsilon)/eta+(E1+E2)*epsdot-(E1*sigma)/eta ;

end






