%% Exercise 7:(Oscillations 2)
%Name: Naga Jayadeep Narla             Matrikel Number : 419348
% Name : Sai Lalith Polawar            Matrikel number: 419278

clc;
clear all;
m_v = 470;
m_t = 40;
c_s = 36190;
c_t = 160000;
t0 = 0;
tend = 5;
t1 = 1;
t2 = 1.1;
dt = 0.01;
% d_s=0;
% d_t=0;
% y1 = 0;
% y2 = 0.1;
time1 = t1 - t0;
time2 = t2-t1;
time3 = tend - t2;
time = t0:dt:tend;
Tspan = [time(1) time(end)];
x1_0 = 0;
x2_0 = 0;
x3_0 = 0;
x4_0 = 0;
IC = [x1_0; x2_0; x3_0; x4_0];

t_ext = time;

y1 = zeros(1,(t1-t0)/dt +1);
y2 = linspace(0,0.1,(t2-t1)/dt);
y3 = 0.1*ones(1,(tend-t2)/dt);
y_ext =[y1,y2,y3];

figure(1);
hold on;grid on;
plot(time,y_ext,'g','LineWidth',2);
legend('step input');
xlabel('time');
ylabel("sine m");
axis([0 5 0 0.16]);
hold off;


%% Undamped System
%Task1
options = odeset('MaxStep',2e-2);
d_s1=0; 
d_t1=0;
[result_time, result_x] = ode23(@(t,z) equation_help(t,z,c_s,d_s1,c_t,d_t1,m_v,m_t,y_ext,t_ext,dt),Tspan,IC,options);
figure(2)
% title('Displacement and Velocity of undamped system');
subplot(2,1,1)
    hold on; grid on;
    plot(result_time,result_x(:,1),'g','LineWidth',2);
    plot(result_time,result_x(:,2),'r','LineWidth',2);
    legend('chasis movement','tire movement');
    title('Disp of Tire vs chasis')
    hold off;
subplot(2,1,2)
    hold on; grid on;
    plot(result_time,result_x(:,3),'g','LineWidth',2);
    plot(result_time,result_x(:,4),'r','LineWidth',2);
    legend('vel of chasis','vel of tire');
    title('vel of Tire vs chasis')
    hold off;
%% Task 2 (Damped system)
options = odeset('MaxStep',2e-2);
d_s2=10000; 
d_t2=100;
[result_time, result_x] = ode23(@(t,z) equation_help(t,z,c_s,d_s2,c_t,d_t2,m_v,m_t,y_ext,t_ext,dt),Tspan,IC,options);
figure(3)
subplot(2,1,1)
    hold on; grid on;
    plot(result_time,result_x(:,1),'g','LineWidth',2);
    plot(result_time,result_x(:,2),'r','LineWidth',2);
    legend('chasis movement','tire movement');
    title('Disp of Tire vs chasis')
    axis([0 5 -1 1]);
    hold off;
subplot(2,1,2)
    hold on; grid on;
    plot(result_time,result_x(:,3),'g','LineWidth',2);
    plot(result_time,result_x(:,4),'r','LineWidth',2);
    legend('vel of chasis','vel of tire');
    title('vel of Tire vs chasis')
    axis([0 5 -0.5 2]);
    hold off;
figure(5);
hold on;grid on;
plot(result_time,result_x(:,1));
hold off;
%% Task 3  (Overly Damped System)
options = odeset('MaxStep',2e-2);
d_s2=1000000; 
d_t2=1000;
[result_time, result_x] = ode23(@(t,z) equation_help(t,z,c_s,d_s2,c_t,d_t2,m_v,m_t,y_ext,t_ext,dt),Tspan,IC,options);
figure(4)
subplot(2,1,1)
    hold on; grid on;
    plot(result_time,result_x(:,1),'g','LineWidth',2);
    plot(result_time,result_x(:,2),'r','LineWidth',2);
    legend('chasis movement','tire movement');
    title('Disp of Tire vs chasis')
    axis([0 5 -1 1]);
    hold off;
subplot(2,1,2)
    hold on; grid on;
    plot(result_time,result_x(:,3),'g','LineWidth',2);
    plot(result_time,result_x(:,4),'r','LineWidth',2);
    legend('vel of chasis','vel of tire');
    title('vel of Tire vs chasis')
    axis([0 5 -0.5 2]);
    hold off;

%%
function z_dot = equation_help(t,z,c_s,d_s,c_t,d_t,m_v,m_t,y_ext,t_ext,dt)

% z(1) = x_v
% z(2) = z_dot(1) = x_v_dot
% z(3) = x_t
% z(4) = z_t_dot(3) = x_t_dot

 c1 = c_s/m_v;
 c2 = c_t/m_t;
 c3 = c_s/m_t;
 d1 = d_s/m_v;
 d2 = d_t/m_t;
 d3 = d_s/m_t;
 

ext = interp1(t_ext,y_ext,t);
ex_dot = gradient(y_ext,dt);
ext_dot = interp1(t_ext,ex_dot,t);

z_dot = [z(2);(-c1*(z(1)-z(3))-d1*(z(2)-z(4)));z(4);((-c3*(z(3)-z(1)))+(-d3*(z(4)-z(2)))-(c2*(z(3)))-(d2*z(4))+(c2*(ext))+(d2*(ext_dot)))];
% z_dot = [z(2);
%     ((-c1*z(1))+(c1*z(3))-(d1*z(2))+(d1*z(4)));
%     z(4);
%     ((c3*z(3))-(c3*z(1))+(d3*z(4))-(d3*z(2))-(c2*z(3))-(d2*z(4))+(c2*(ext))+(d2*(ext_dot)))];

%     M = [m_v 0;0 m_t];
%     C = [-c_s c_s;
%           c_s -(c_t+c_s)];
%     D = [-d_s d_s;
%           d_s -(d_s+d_t)];
%     RS = [0;0;0;(c_t*interp1(t_ext,y_ext,t)/m_t+d_t*interp1(t_ext,ydot_ext,t)/m_t)];
%     
%     z_dot = [zeros(2,2) [1 0; 0 1];inv(M)*C inv(M)*D]*x+RS;


end







