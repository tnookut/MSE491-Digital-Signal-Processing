clc; clear all; close all
%% DTMF Encoding
%
% Encode a digit in a telephone number into a tone
%
% Sampling Frequency
Fs = 2^15;
% Generate a random integer between 0 and 9
r = randi([0, 9], 1);
% Encode a random integer into a tone
[y, t] = encode_DTMF(r);
% Plot 16ms of the tone waveform
figure()
plot(t, y);
xlabel('Time (s)')
ylabel('Amplitude')
title(['y(',num2str(r),')'])

% Fourier transform of the dial tone
Y = fft(y);
% Frequency Vector (f=k/N where k is the index and N is the total number of
% sample points)
f = (0:length(y)-1)*Fs/length(y);
% Plot the absoulte value of the Fourier Transform, Y[f]
figure()
abs_Y = abs(Y);
plot(f, abs_Y)
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title(['Absolute Value of Y, y(',num2str(r),')'])
% Discrete data only contain frequencies between DC and one-half the
% sampling rate. Therefore, only plot up to half the sampling rate.
xlim([0, Fs/2]);

%% DTMF Decoding
%
% Decode a tone into a digit
%
digit = decode_DTMF(abs_Y);
disp(['Decoded Digit: ', num2str(digit)])


%% Encode DTMF Function
% This function encodes DTMF tone.
% Input: Integer 0 to 9
% Output: A sum of two sine waves whose frequencies are associated
% with a digit in a telephone number.
% 
function [y, t] = encode_DTMF(r)
    Fs = 2^15;                       % Sampling frequency (Hz)
    t = 0:1/Fs:16E-3;                % 16 ms Time Vector


    % Lookup table for frequency pair associated with each digit
    freq_pairs = [[697, 1209]; [697, 1336]; [697, 1477]; ...
                  [770, 1209]; [770, 1336]; [770, 1477]; ...
                  [852, 1209]; [852, 1336]; [852, 1477]; ...
                  [941, 1336]];
              
    % Offset input for 0
    if (r == 0)
        r = 10;
    end
   
   % Decouple frequency pairs
   f1 = freq_pairs(r, 1);
   f2 = freq_pairs(r, 2);

   % Sum two sine waves
   y = sin(2*pi*f1*t) + sin(2*pi*f2*t);
   
   % Play sound of the tone corresponding to the input digit
%    sound(y, Fs)
end


%% Decode DTMF Function
% This function decodes a DTMF tone by reading the peaks of the frequency
% domain signal and converting it into into its corresponding digit.
% Input: Frequency domain signal representing the tone
% Ouput: An integer value representing a digit in a telephone number
%
function d = decode_DTMF(Y)
    % Sampling frequency
    Fs = 2^15;

    % Locate the peaks
    [pks, locs] = findpeaks(Y);

    % locs returns the index of frequency in the array, subtract 1 and convert
    % to frequency

    f1 = (locs(1)-1)*Fs/length(Y);
    f2 = (locs(2)-1)*Fs/length(Y);
    
    % Print frequency pair
    disp(['Frequency pair from generated tone: (' num2str(round(f1)),', ', num2str(round(f2)),')'])

    % Lookup table for frequency pair associated with each digit
    freq_pairs = [[697, 1209]; [697, 1336]; [697, 1477]; ...
                  [770, 1209]; [770, 1336]; [770, 1477]; ...
                  [852, 1209]; [852, 1336]; [852, 1477]; ...
                  [941, 1336]];
              
    % Match frequency pairs found the the freq_pairs look up table
    % Match location of low frequency
    [val, i] = min(abs(f1 - freq_pairs(:, 1)));
    
    % Catch frequency pair for 0
    if (i == 10)
       d = 0;
    else
        % Match location of high frequency
        [val, j] = min(abs(f2 - freq_pairs(i:i+2, 2)));

        % Find digit from look up table
        d = i+j-1;
    end
end

