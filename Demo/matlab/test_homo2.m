im = im2double(rgb2gray(imread('4.png')));


imh = log(im + 2);

F = fftshift(fft2(imh));

sy = size(im, 1);
sx = size(im, 2);

[yy, xx] = ndgrid(1:sy, 1:sx);

D = sqrt((yy-sy/2).^2 + (xx-sx/2).^2);

rH = 2;
rL = 0.5;
D0 = 80;
H = (rH - rL)*(1- exp(-D.^2/D0^2) ) + rL;

DF = F.*H;

imdh = real(ifft2(ifftshift(DF)));

imd = exp(imdh) - 2;

figure;

subplot(221);
imshow(im);

subplot(222);
imagesc(imd);
