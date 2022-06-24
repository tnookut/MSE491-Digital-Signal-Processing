w = -pi:0.01:pi;
X = (1-(0.7*exp(-1j*w)).^8)./(1-0.7*exp(-1j*w));

% Plot
figure;
subplot(211);
plot(w/pi, abs(X))
xlabel('\omega'), title('Magnitude response')

subplot(212);
plot(w/pi, angle(X)*180/pi)
xlabel('\omega'), ylabel('Degree'), title('Phase response')

% 8-point DFT
n = 0:7;
x = (0.7).^n;
X = fftshift(fft(x))

figure;
subplot(211);
stem(n,abs(X))
xlabel('k'), ylabel('Magnitude'),title('8-point DFT')

subplot(212);
stem(n,angle(X))
xlabel('k'), ylabel('Angle'),title('8-point DFT')

% 16-point DFT
x = [x zeros(1,8)];
n = 0:15;
X = fftshift(fft(x,16))

figure;
subplot(211);
stem(n,abs(X))
xlabel('k'), ylabel('Magnitude'),title('16-point DFT')

subplot(212);
stem(n,angle(X))
xlabel('k'), ylabel('Angle'),title('16-point DFT')

% Comment on Zero-padding
% By zero-padding the signal, the DFT of the signal
% is interpolated, allowing a better estimation of
% the magnitudes of signal components.