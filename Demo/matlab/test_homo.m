close all
im = im2double(rgb2gray(imread('4.png')));

[sy, sx] = size(im);
cy = sy/2;
cx = sx/2;
[yy, xx] = ndgrid(1:sy,1:sx);
D = sqrt((yy-cy).^2 + (xx-cx).^2);
D0 = 80;

Y = log(im+1);

F = fftshift(fft2(Y));
gL = 0.5;
gH = 2;
H = (gH - gL)*(1-exp(-D.^2/(2*D0^2))) + gL;

G = H.*F;

g = real(ifft2(ifftshift(G)));

x = exp(g) - 1;


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
imshow(mat2gray(x));

