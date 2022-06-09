% MSE 491: DSP Lab 01
% June 02, 2022
% Tanya Nookut
% Kim Jea Hong
clc; clear all; close all
%% Plotting Time Dependent Sinusoids

% Time vector from -1 to 1, size 10,000
time = linspace(-1,1, 10000); % [Seconds]

% Signal1, 3Hz sine wave. x1(t) = sin(2pift), f = 3Hz
signal1 = sin(2*pi*3*time);

% Signal2, 5Hz cosine wave. x2(t) = cos(2pift), f = 5Hz
signal2 = cos(2*pi*5*time);

% Sampling frequency:
% Fs = number of samples/duration
% Fs = 10000/2; --> Fs = 5000 Hz

% Sampling Time:
% Ts = 1/Fs; %  Ts = 0.2 ms

% Plot 1
figure(1);
% Plot signal1 vs time; Colour = black, LineWidth = 2;
plot(time, signal1,'Color','k', 'LineWidth',2)

% Plot signal2 vs. time; Colour = magenta; LineWidth = 2; LineStyle = --
hold on;
plot(time, signal2, 'LineWidth', 2, 'Color', 'm', 'LineStyle',"--")

% Set axis ticks font size to 12
set(gca, 'fontsize', 12);
set(gca, 'XMinorGrid', 'on');
set(gca, 'YMinorGrid', 'on');

% Set x-axis limits to max and min of time vector
xlim([min(time), max(time)]);

% Set y-axis limits to min-0.5 and max+0.5 of the larger signal
% singal1 and signal2 have the same amplitude.
% Therefore, the axis can be scaled based on signal1.
y_min = min(signal1) - 0.5;
y_max = max(signal1) + 0.5;
ylim([y_min, y_max]);

% Axis Titles
xlabel('Time (s)', 'FontSize', 14, "FontWeight","bold");
ylabel('Amplitude (V)', 'FontSize', 14, "FontWeight", 'bold');
% Legend
label1 = '$\lambda_1$';
label2 = '$\dot{\Theta_1^2}$';
legend(label1, label2, 'Interpreter', 'latex');

% Automatically save figure in svg and png formats
saveas(figure(1), 'Figure1_sinusoids.svg')
saveas(figure(1), 'Figure1_sinusoids.png')
%% 3D Circles

% Circle
% x = rcos(theta)
% y = rsin(theta)
% r is the radius.
figure(2)
% Create a linearly spaced vector of angle theta
theta = linspace(0, 2*pi, 1000);
x = cos(theta);
y = sin(theta);

% Radius vector from 1 to 100 with increment of 2
r = 1:2:100;

% z-axis seperation vector
z_seperation = 1:1:50;

% Plotting 3D circles
% For loop range from 1 to 50, incremented by 1
for n = z_seperation
    % For each iteration, index radius vector
    x = r(n)*cos(theta);
    y = r(n)*sin(theta);
    % Create a z vector
    z = n*ones(size(theta));
    plot3(x,y,z)
    hold on
end
grid on
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')

% Automatically save figure in svg and png formats
saveas(figure(2), 'Figure2_3DCircles.svg')
saveas(figure(2), 'Figure2_3DCircles.png')
%% Continuous and Discrete Time Signals

% Sampling rate
sampling_rate = 1000; % Samples per second
Ts = 1/sampling_rate;

% Time vector
t = -1:Ts:1;

% Sample number vector
n = t/Ts;

% Unit Step Function
figure(3)
% Unit step function has a value of 1 for time t >= 0 and
% has a value of zero elsewhere.
% Using logical experession to create a unit step function vector
unit_step = (t >= 0); 
% Continous Time Unit Step Plot
subplot(2, 1, 1);
plot(t, unit_step, "LineWidth", 2)
title('Continuous Time Unit Step Function')
ylim([-0.2, 1.2]);
grid on; grid minor;
xlabel('t', 'FontSize', 14, "FontWeight","bold")
ylabel('u(t)', 'FontSize', 14, "FontWeight","bold")
set(gca, 'fontsize', 12);

% Discrete Time Unit Step Plot
subplot(2,1,2)
stem(n, unit_step, 'filled', 'LineWidth', 2)
ylim([-0.2, 1.2]);
grid on; grid minor;
xlim([-10 10])
title('Discrete Time Unit Step Function')
xlabel('n', 'FontSize', 14, "FontWeight","bold")
ylabel('u[n]', 'FontSize', 14, "FontWeight","bold")
set(gca, 'fontsize', 12)
ylim([-0.2, 1.2]);
grid on; grid minor;
xlim([-10 10])
title('Discrete Time Unit Step Function')
xlabel('n', 'FontSize', 14, "FontWeight","bold")
ylabel('u[n]', 'FontSize', 14, "FontWeight","bold")
set(gca, 'fontsize', 12);
% Unit Impulse Function
figure(4)
% A unit impulse function has a value of 1 for time t = 0,
% and has a value of zero elsewhere.
unit_impulse = t == 0;

% Continuous Time Unit Impulse Plot
subplot(2, 1, 1);
plot(t, unit_impulse, "LineWidth", 2)
title('Continuous Time Unit Impulse Function')
ylim([-0.2, 1.2]);
xlim([-0.1 0.1])
grid on; grid minor;
xlabel('t', 'FontSize', 14, "FontWeight","bold")
ylabel('\delta(t)', 'FontSize', 14, "FontWeight","bold")
set(gca, 'fontsize', 12);

% Discrete Time Unit Impulse Plot
subplot(2,1,2)
stem(n, unit_impulse, 'filled', 'LineWidth', 2)
ylim([-0.2, 1.2]);
grid on; grid minor;
xlim([-10 10])
title('Discrete Time Unit Impulse Function')
xlabel('n', 'FontSize', 14, "FontWeight","bold")
ylabel('\delta[n]', 'FontSize', 14, "FontWeight","bold")
set(gca, 'fontsize', 12);

% Ramp Function
figure(5)
ramp = t.*unit_step;

% Continuous Time Ramp Plot
subplot(2, 1, 1);
plot(t, ramp, "LineWidth", 2)
title('Continuous Time Ramp Function')
ylim([-0.2, 1.2]);
grid on; grid minor;
xlabel('t', 'FontSize', 14, "FontWeight","bold")
ylabel('ramp(t)', 'FontSize', 14, "FontWeight","bold")
set(gca, 'fontsize', 12);

% Discrete Time Ramp Plot
subplot(2,1,2)
stem(n, ramp, 'filled', 'LineWidth', 2)
ylim([-0.005 0.015]);
grid on; grid minor;
xlim([-10 10])
title('Discrete Time Ramp Function')
xlabel('n', 'FontSize', 14, "FontWeight","bold")
ylabel('ramp[n]', 'FontSize', 14, "FontWeight","bold")
set(gca, 'fontsize', 12);

% Square Wave
figure(6)
% Square wave frequency
f_sq = 50; % Hz
squarewave = square(2*pi*f_sq*t);

% Continuous Time Square Wave Plot
subplot(2, 1, 1);
plot(t, squarewave, "LineWidth", 2)
title('Continuous Time 50 Hz Square Wave Function')
ylim([-1.2, 1.2]);
xlim([-0.05 0.05])
grid on; grid minor;
xlabel('t', 'FontSize', 14, "FontWeight","bold")
ylabel('Amplitude', 'FontSize', 14, "FontWeight","bold")
set(gca, 'fontsize', 12);

% Discrete Time Ramp Plot
subplot(2,1,2)
stem(n, squarewave, 'filled')
ylim([-1.2 1.2]);
grid on; grid minor;
xlim([-50 50])
title('Discrete Time 50 Hz Square Wave Function')
xlabel('n', 'FontSize', 14, "FontWeight","bold")
ylabel('Amplitude', 'FontSize', 14, "FontWeight","bold")
set(gca, 'fontsize', 12);