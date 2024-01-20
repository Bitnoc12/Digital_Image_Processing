% close all;
im = im2double((imread('lena.jpg')));

F = fftshift(fft2(im));

[sy, sx] = size(im);
cy = sy/2;
cx = sx/2;
[yy, xx] = ndgrid(1:sy,1:sx);
D = sqrt((yy-cy).^2 + (xx-cx).^2);
D0 = 20;
n = 2;
W = 4;

H = exp(-((D.^2-D0^2)./(D*W)).^2/2);

% H = 1-1./(1+(D*W./(D.^2-D0^2)).^(2*n));
% H = double(D<=D0+W/2 & D>=D0-W/2);

% H = 1- exp(-D.^2/(2*D0^2));
% H = 1./(1+(D/D0).^(2*n));

% H = 1-double(D<=D0);

G = H.*F;

g = real(ifft2(ifftshift(G)));

figure;
subplot(221);
imshow(mat2gray(log(abs(F)+1)));
subplot(222);
imshow(H);
subplot(223);
imshow(mat2gray(log(abs(G)+1)));

figure;
subplot(121);
imshow(im);
subplot(122);
imshow(mat2gray(g));
