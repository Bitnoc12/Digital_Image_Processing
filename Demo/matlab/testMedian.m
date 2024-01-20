im = im2double(imread('3.png'));

imd1 = myMedian(im, 3);
imd2 = myMedian(im, 5);
imd3 = myMedian(im, 7);

imd1 = myGauss(im, 5, 1);
imd2 = myGauss(im, 5, 25);
imd3 = myGauss(im, 5, 100);

close all;
figure;
subplot(2,2,1);
imshow(im);

subplot(2,2,2);
imshow(imd1);

subplot(2,2,3);
imshow(imd2);

subplot(2,2,4);
imshow(imd3);
