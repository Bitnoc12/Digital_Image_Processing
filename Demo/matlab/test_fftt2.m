im = im2double(rgb2gray(imread('br.png')));

sy = size(im, 1);
sx = size(im, 2);

F = fftshift(fft2(im));

[yy, xx] = ndgrid(1:sy, 1:sx);

D0 = 93;

D = sqrt((xx - sx/2).^2 + (yy - sy/2).^2);

% figure;
% hold on;
% for n = 1:10
%     
%     H = 1./(1 + (D/D0).^(2*n));
%     
%     plot(H(round(end/2), :));
%     pause;
% end

% H = 1 - (D <= D0);
 
% n = 2;
% H = 1 - 1./(1 + (D/D0).^(2*n));

% H = 1 - exp(- D.^2 / (2*D0^2));

W = 80;

H = exp(- 0.5* ((D.^2 - D0^2) ./ (D*W)).^2 );

% h = fftshift(real(ifft2(ifftshift(H))));
% 
% figure;
% imagesc(h);

DF = H.*F;

iftRes = ifft2(ifftshift(DF));
dstIm = real(iftRes);

FS = log(abs(F)+1);
DFS = log(abs(DF)+1);

close all
figure;

subplot(221);
imshow(im);

subplot(222);
imagesc(FS);

subplot(223);
imagesc(DFS);

subplot(224);
imshow(dstIm+0.5);

% figure;
% imagesc(dstIm);
