function interactivePendulumPlot()
    % Initial parameters
    T = 60;
    n = 18000;
    s0 = 0.5;
    theta0 = pi/3;
    epsilon = 10^(-3);

    % Create a new figure
    fig = figure('Name', 'Interactive Pendulum Plot', 'NumberTitle', 'off', 'Position', [100, 100, 600, 400]);
    y_diff = 0;
    % Create slider
    b = uicontrol('Parent',fig,'Style','slider','Position',[81,10,419,23],...
              'value',y_diff, 'min',0, 'max',1);
    bgcolor = fig.Color;
    bl1 = uicontrol('Parent',fig,'Style','text','Position',[50,54,23,23],...
                    'String','0','BackgroundColor',bgcolor);
    bl2 = uicontrol('Parent',fig,'Style','text','Position',[500,54,23,23],...
                    'String','1','BackgroundColor',bgcolor);
    bl3 = uicontrol('Parent',fig,'Style','text','Position',[240,25,100,23],...
                'String','Damping Ratio','BackgroundColor',bgcolor);
    slider = uicontrol('Parent', fig, 'Style', 'slider', 'Position', [20, 20, 60, 20], ...
                       'value', 0.5, 'min', 0, 'max', 10);
    addlistener(slider, 'Value', 'PostSet', @(src, event) updatePlot(slider.Value));

    % Initial plot
    updatePlot(slider.Value);

    function updatePlot(y_diff)
        clf;
        w = RKsolver(s0, theta0, T, n, y_diff);
        w2 = RKsolver(s0 + epsilon, theta0 + epsilon, T, n, y_diff);

        subplot(1, 2, 1);
        plot(w(:, 1), w(:, 3));
        title("Án \epsilon", "interpreter", "tex");
        xlabel('x');
        ylabel('y');

        subplot(1, 2, 2);
        plot(w2(:, 1), w2(:, 3), 'm');
        title("Með \epsilon", "interpreter", "tex");

        skekkjur = sqrt((w2(:, 1) - w(:, 1)).^2 + (w2(:, 3) - w(:, 3)).^2);
        maxskekkja = max(skekkjur);
        sgtitle("y'(0) = " + y_diff + " Hámarks bil milli ferla = " + maxskekkja);
    end
end

