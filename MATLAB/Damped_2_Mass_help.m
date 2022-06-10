

function xdot = ODE_car(t,x,m1,m2,c1,c2,d1,d2,t_RS,y_RS,ydot_RS)
    % x(1) = x1
    % x(2) = x2
    % x(3) = x1dot
    % x(4) = x2dot
    
    M = ;
    C = ;
    D = ;
    RS = [0;0;0;(c2*interp1(t_RS,y_RS,t)+d2*interp1(t_RS,ydot_RS,t))/m2];
    
    xdot = [zeros(2,2) [1 0; 0 1];-inv(M)*C -inv(M)*D]*x+RS;
end