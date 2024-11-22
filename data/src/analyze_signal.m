% Parameters for DTMF signal
f1 = 941;          % First frequency
f2 = 1336;         % Second frequency
Fe = 5000;         % Sampling frequency
t = 0:1/Fe:2;      % Time vector for 2 seconds

% Noise settings
sigma = 0.01;      % Variance of noise
snr = 10;          % Signal-to-Noise Ratio
noise = sqrt(sigma) * randn(size(t)); % Gaussian noise

% Generate DTMF signal (using custom dtmf function)
u = sin(2*pi*f1*t) + sin(2*pi*f2*t) + noise;

% Calculate autocorrelation and create Toeplitz matrix
N = length(t);
Ru = xcorr(u, 'biased') / N; % Normalized autocorrelation
R = toeplitz(Ru(N:N+4));     % Covariance matrix using a Toeplitz structure

% Eigenvalue decomposition
[V, Lambda] = eig(R);        % Eigenvalues and eigenvectors

% Minimum eigenvector
Vmin = V(:, 1);

% Frequency response plot
Nfft = 1024; % Number of FFT points
freqz(1, Vmin, Nfft, Fe); % Frequency response using the smallest eigenvector

% Add titles to the plots
subplot(2, 1, 1);
title('Magnitude Response');
subplot(2, 1, 2);
title('Phase Response');
