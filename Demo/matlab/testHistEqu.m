im = imread('2.bmp');

histBin = myHist(im);

cdf = cumsum(histBin);

remap = uint8(round(cdf/max(cdf)*255));

imd = remap(im+1);
histBin2 = myHist(imd);

figure;
subplot(2,2,1);
imshow(im);

subplot(2,2,2);
imshow(imd);

subplot(2,2,3);
bar(histBin);
xlim([1 256]);

subplot(2,2,4);
bar(histBin2);
xlim([1 256]);

