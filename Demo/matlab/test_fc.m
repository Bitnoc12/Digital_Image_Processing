ims = imread('2.bmp');
% im = uint8(double(im)/double(max(im(:)))*255);
% v = uint8(0:255)';

F = fftshift(fft2(ims));

FS = log(abs(F)+0.001);
im = uint8(FS/max(FS(:))*255);

figure;
imshow(FS, []);

% im = repmat(v, 1, 20);

remap = hot(256);

Rm = remap(:, 1);
Gm = remap(:, 2);
Bm = remap(:, 3);

figure;
hold on;
plot(Rm, 'r');
plot(Gm, 'g');
plot(Bm, 'b');


imD = [];
imD(:,:,1) = Rm(im+1);
imD(:,:,2) = Gm(im+1);
imD(:,:,3) = Bm(im+1);

figure;
subplot(121);
imshow(im);
subplot(122);
imshow(imD);
