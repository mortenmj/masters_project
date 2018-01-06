% Specify model
g = 9.81;
M = @(t, Y)[Y(2); -g];

% Specify simulation parameters
h0 = 5;
y0 = [5 0];
t = [0 5];
options = odeset('Events', @events);

% Simulate 5 bounces
for i = 1:5
    sol = ode45(M, t, y0, options);
    y0(1) = sol.ye(1);
    y0(2) = -0.8*sol.ye(2);
    t = [sol.x(end) t(2)];
end

% Detect when the ball touches the surface
function [value, isterminal, direction] = events(t,y)
    ground = max(0, 4 - floor(t));
    value = y(1) - ground;
    isterminal = 1;
    direction = -1;
end
