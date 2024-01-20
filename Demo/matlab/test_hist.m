im = imread('2.png');

h = zeros(256, 1);
for i=0:255
    h(i+1) = sum(im(:) == i);
end
h = h/sum(h);
plot(h,'.');

imd = im;
for i=0:255
    idx=find(im==i);    
    imd(idx)=sum(h(1:i+1))*255;
end
imd = uint8(imd);
figure;
subplot(1,2,1);
imshow(im);
subplot(1,2,2);
imshow(imd);
