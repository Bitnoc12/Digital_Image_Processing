
x = zeros(1, 512);
x(257:end) = 1;

F = fft(x);
xx = ifft(F);

Fs = fftshift(F);


M = abs(F);
Ms = abs(Fs);

figure;
subplot(141);
plot(x, '.');
ylim([-1 2]);


subplot(142);
plot(xx);
ylim([-1 2]);

subplot(143);
plot(Ms);
