im = rgb2gray(imread('pp.png')) > 128;


B = [0 1 0; 1 1 1; 0 1 0];

imD = myDilation(im, B);
imE = myErosion(im, B);

imC = myErosion(imD, B);
imO = myDilation(imE, B);

figure;
subplot(321);
imshow(im);

subplot(322);
imshow(imE);

subplot(323);
imshow(imD);

subplot(324);
imshow(imC);

subplot(325);
imshow(imO);

subplot(326);
imshow(B);
