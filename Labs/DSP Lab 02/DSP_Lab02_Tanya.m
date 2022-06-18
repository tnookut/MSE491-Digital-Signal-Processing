% June 16, 2022
% DSP Lab 02: Frequency Domain
%
clc; clear all; close all;

%% 1. DFT

% Time domain signal
x = [2,1,-1,-2];
N = length(x);

% X vector
X = zeros(N, 1);

% DFT by Definition
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1)*exp(-j*2*pi*k*n/N);
    end
end

% FFT
X_fft = fft(x);

% Plot results
figure(1)
subplot(2,1,1)
stem(X, 'filled', 'linewidth', 2)
xlabel('n')
ylabel('X[n]')
title('DFT by Definition')
subplot(2,1,2)
stem(X_fft, 'filled', 'linewidth', 2)
xlabel('n')
ylabel('X[n]')
title('DFT using FFT')

%% 2. IDFT
% IDFT by definition
xx = zeros(N, 1);
for k = 0:N-1
    for n = 0:N-1
        xx(k+1) = (xx(k+1) + X(n+1)*exp(j*2*pi*k*n/N)/N);
    end
end

% IFFT
x_ifft = ifft(X);

% Plot results
figure(2)
subplot(2,1,1)
xlabel('n')
ylabel('X[n]')
stem(xx, 'filled', 'linewidth', 2)
title('IDFT by Definition')
subplot(2,1,2)
stem(x_ifft, 'filled', 'linewidth', 2)
xlabel('n')
ylabel('X[n]')
title('IDFT using IFFT')

%% 3.a) Analytical DFT
% Solve symbolically first
syms x n

x(n) = piecewise(0<= n <= 7, 0.7^n);
