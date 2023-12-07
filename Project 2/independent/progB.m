function likindi = progB(x, y, dx, dy, k, m, T)

% hjarta
hjarta_x = @(t) 16*sin(t).^3;
hjarta_y = @(t) 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);

ferill = progA([x, dx, y, dy], k, m, T);

t = linspace(0, 2*pi, 100);
likindi = rms(ferill - [hjarta_x(t); hjarta_y(t)]');
end

