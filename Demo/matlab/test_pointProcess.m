im = imread('2.png');
% im = rgb2gray(im);
ims = im;
[sy, sx] = size(im);
for y=1:sy
    for x=1:sx
        im(y,x) = (im(y,x)>128)*255;
    end
end

figure;
subplot(1,2,1);
imshow(ims);
subplot(1,2,2);
imshow(im);
