%% Exercise 6(Oscillator)

%% Code:
clc;
dt = 1;
time =(0:dt:25); % determine the time vector

phi_0 = linspace(-pi,pi,5);    %(use for loop);
phi_dot_0 = linspace(-4,4,5);  %(use for loop);
tspan = [time(1) time(end)];    %Time span for the ode solver
options=odeset('MaxStep',2e-2);





% Create a for loop for the ode solver and directly plot the graphs for phi
% and phi_dot
for i = 1:length(phi_0)
    for j =1: length(phi_dot_0)
       [r_t,r_y] = ode23(@(t,y)oscillator(t,y), tspan, [phi_0(i);phi_dot_0(j)],options);
       hold on;grid on;box on;
       phi = r_y(:,1);
       phi_dot = r_y(:,2);
       plot(phi,phi_dot);
       axis([-pi, pi ,-8, 8]);
       xlabel('phi dot');
       ylabel('phi');
       legend('phi','phi dot')
       hold off;
    end
end



% Write the function to determine the equation for the ode solver. 

function dydt = oscillator(t,y)
%y(1) = phi
%y(2) = phi_dot
  g = 9.81;
  l = 1;
  k = (-g/l);

dydt = [y(2);(k*sin(y(1)))];

end


