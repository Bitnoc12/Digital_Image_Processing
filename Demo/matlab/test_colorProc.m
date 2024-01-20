im = im2double(imread('c1.png'));

hsi = rgb2hsi(im);

cmy = 1-im;

imd1 = im*0.7;

cmyd = cmy*0.7 + 0.3;
imd2 = 1-cmyd;

figure;
subplot(3,3,1);
imshow(im);

subplot(3,3,2);
imshow(imd1);

subplot(3,3,4);
imshow(cmy);
subplot(3,3,5);
imshow(imd2);

subplot(3,3,7);
imshow(hsi(:,:,1)/360);

subplot(3,3,8);
imshow(hsi(:,:,2));

subplot(3,3,9);
imshow(hsi(:,:,3));
