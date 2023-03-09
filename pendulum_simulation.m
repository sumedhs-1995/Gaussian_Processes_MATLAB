clc; clear all;

% Ref: https://www.mathworks.com/matlabcentral/answers/604771-how-to-code-simple-pendulum-motion-using-ode45

theta0 = [0.5; 0]; % initial conditions: theta(t=0)=0.5; dtheta(t=0)=0.
tspan = [0 10];

[t, theta] = ode45(@odeFun, tspan, theta0);
plot(t, theta);
legend({'$\theta$', '$\dot{\theta}$'}, ...
    'Location', 'best', ...
    'Interpreter', 'latex', ...
    'FontSize', 16)
function dtheta = odeFun(t, theta)
    g = 9.8;
    l = 6;
    % theta(1) = theta, theta(2) = dtheta
    
    dtheta = zeros(2, 1);
    dtheta(1) = theta(2);
    dtheta(2) = -g/l*theta(1);
end