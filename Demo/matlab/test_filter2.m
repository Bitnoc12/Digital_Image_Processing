im = im2double(imread('lena.jpg'));

close  all;

H = [-1 1];

imgx = im;
imgy = im;

sy = size(im, 1);
sx = size(im, 2);

for iy = 1: (sy-1)
    for ix = 1: (sx-1)
        c = im(iy, ix:ix+1).*H;
        imgx(iy, ix) = sum(c(:));

        c = (im(iy:iy+1, ix)').*H;
        imgy(iy, ix) = sum(c(:));
    end
end

img = sqrt(imgx.^2 + imgy.^2);

% w = sqrt(2)/2;
% 
% 
% imga = imgx*w + imgy*w; 


figure;
subplot(2,2,1);
imshow(im);

subplot(2,2,2);
imshow(imgx+0.5);

subplot(2,2,3);
imshow(imgy+0.5);

subplot(2,2,4);
imshow(img);

% figure;
% imagesc(img);

% 
% subplot(2,2,4);
% imshow(imd+0.5);
% 
% subplot(2,2,3);
% imshow(imp);
