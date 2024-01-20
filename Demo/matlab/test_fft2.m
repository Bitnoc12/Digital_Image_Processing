% x = zeros(1024, 1024);
% x(512+(-128:128), 512+(-128:128))=1;

x = im2double(imread('lena.jpg'));

F = fftshift(fft2(x));

r = 16;
[yy, xx] = ndgrid(-r:r, -r:r);
yy = yy(:) + 255;
xx = xx(:) + 255;
idx = yy(:) + (xx(:)-1)*511;
FC = F;
% FC(:) = 0;
% FC(idx) = F(idx);

y = mat2gray(real(ifft2(ifftshift(FC))));


FS = mat2gray(log(abs(FC)+1));

figure;
subplot(121);
imshow(x);
subplot(122);
imshow(FS);

figure;
subplot(121);
imshow(x);
subplot(122);
imshow(y);
