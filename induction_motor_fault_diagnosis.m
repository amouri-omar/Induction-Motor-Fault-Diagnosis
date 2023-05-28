% Parameters
N = 13000;         % Number of data points
L = 3000;          % Length of signals displayed in the graph
Te = 0.0001;       % Sampling period
Tf = Te * (L-1);   % Total duration of the displayed signals
t = 0:Te:Tf;       % Time vector
fc = 1500;         % Cutoff frequency
order = 20;        % Filter order
Fe = 1/Te;         % Sampling frequency
df = Fe/N;         % Frequency resolution
f = 0:df:Fe-df;    % Frequency vector

% Calculation of filter coefficients
coeffs = fir1(order, fc/(Fe/2));

% Acquisition and filtering of the healthy signal
datasain = VarName1;          % Replace VarName1 with the actual variable name containing the healthy data
inputDatasain = datasain;
filteredData = filtfilt(coeffs, 1, inputDatasain);

% Acquisition and filtering of the faulty signal
datadef = VarName2;           % Replace VarName2 with the actual variable name containing the faulty data
inputDatadef = datadef;
filteredData2 = filtfilt(coeffs, 1, inputDatadef);

% Initialization of vectors for healthy and faulty signals
Isain = zeros(1, N);
Ideff = zeros(1, N);

% Conversion of filtered data to current amplitudes
for i = 1:1:N
    a = filteredData(i) * 3.3 / 1024;   % Convert ADC value to voltage
    p = (a - 1.627) / 0.066;            % Adjust offset and gain
    Isain(i) = (p - 0.372) * 1.57;      % Convert voltage to current amplitude
    
    a1 = filteredData2(i) * 3.3 / 1024; % Convert ADC value to voltage
    p1 = (a1 - 1.627) / 0.066;          % Adjust offset and gain
    Ideff(i) = (p1 - 0.372) * 1.57;     % Convert voltage to current amplitude
end

% Plotting the signals in Figure 1
figure(1);
plot(t(1:L), Isain(1:L))
hold on
plot(t(1:L), Ideff(1:L))
xlabel('Time (s)', 'FontSize', 16);
ylabel('Current Amplitude (A)', 'FontSize', 16);
title('Comparison of Healthy and Faulty Signals', 'FontSize', 20);
grid on
legend('Faulty Current (Ideff)', 'Healthy Current (Isain)', 'FontSize', 12);
hold off

% Calculating the Fourier transforms of the healthy and faulty signals
Isainfft = abs(fft(Isain, N));
Idefft = abs(fft(Ideff, N));

% Calculating the power spectral density (PSD)
Dsain = (Isainfft.^2) / N;
Ddef = (Idefft.^2) / N;

% Plotting the PSD spectrum in dB in Figure 2
figure(2);
plot(f(1:600), 10*log10(Dsain(1:600)));
hold on
plot(f(1:600), 10*log10(Ddef(1:600)));
xlabel('Frequency (Hz)', 'FontSize', 16);
ylabel('PSD (dB)', 'FontSize', 16);
title('Power Spectral')
