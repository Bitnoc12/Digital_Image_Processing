im = im2double(rgb2gray(imread('seg.png')));

close  all;

H = [-1 1];

imgx = im;
imgx(:) = 0;
imgy = im;
imgy(:) = 0;

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

imgs = sqrt(imgx.^2 + imgy.^2);


w = 15;
h = ones(w,w)/(w*w);

[sy, sx] = size(imgs);
img = zeros(sy-w+1, sx-w+1);
for y=1:(sy-w+1)
    for x=1:(sx-w+1)
        %imd(y,x) = boxfilter
        %im(y+0:2, x+0:2) * h
        img(y,x) = sum(sum(imgs(y+(0:w-1), x+(0:w-1)) .* h));
    end
end

L = watershed(img); 

figure;
subplot(2,2,1);
imshow(im);

subplot(2,2,2);
imshow(img,[]);

rgb = label2rgb(L,'jet',[.5 .5 .5]);
subplot(2,2,3);
imshow(rgb,'InitialMagnification','fit')
% figure;
% imagesc(img);

% 
% subplot(2,2,4);
% imshow(imd+0.5);
% 
% subplot(2,2,3);
% imshow(imp);
