im = im2double(imread('lena.jpg'));
M = size(im, 1);

h = fspecial('gaussian', 7, 1);

imb=filter2(h, im)+rand(M,M)/10;

figure;
subplot(121);
imshow(im);
subplot(122);
imshow(imb);


Y = fft2(imb);
H = fft2(h, M, M);

invH = 1./H;
idx = find(abs(H)<0.1);
invH(idx) = 0;
X = Y.*invH;

imX = abs(ifft2(X));

figure;
subplot(121);
imshow(imb);
subplot(122);
imshow(imX);
