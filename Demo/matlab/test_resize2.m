im = imread('1.png');
img = im2double(rgb2gray(im));

imd1 = myRotate(img, 10);
imd2 = myRotate(img, -10);

% imd2 = myResize(img, 2);
% imd22 = myResizeZero(img, 2);

close all
figure;
imshow(img);
title('Source');

figure;
imshow(imd1);
title('Rotate 10');

figure;
imshow(imd2);
title('Rotate -10');

