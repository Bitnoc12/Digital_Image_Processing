x = rand(1, 1024);

F = fftshift(fft(x));

r = 16;
cutidx = 512+(-r:r);

FC = F;
FC(:) = 0;
FC(cutidx) = F(cutidx);


figure;
subplot(121);
plot(abs(F));
subplot(122);
plot(abs(FC));


y = abs(ifft(ifftshift(FC)));

figure;
plot(x, 'r');
hold on
plot(y, 'b');

% figure;
% subplot(121);
% plot(x);
% subplot(122);
% plot(abs(F));
