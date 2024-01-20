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

imAng = atan2(imgy, imgx);

img = sqrt(imgx.^2 + imgy.^2);

idx = find(img < 0.1);
img(idx) = 0;

imm = zeros(size(img));
for iy = 2: (sy-1)
    for ix = 2: (sx-1)
        f = 0;
        if img(iy, ix) > img(iy, ix-1) && img(iy, ix) > img(iy, ix+1)
            f = 1;
        end
        
        if img(iy, ix) > img(iy-1, ix) && img(iy, ix) > img(iy+1, ix)
            f = 1;
        end
        
        if img(iy, ix) > img(iy+1, ix+1) && img(iy, ix) > img(iy-1, ix-1)
            f = 1;
        end
        
        if img(iy, ix) > img(iy-1, ix+1) && img(iy, ix) > img(iy+1, ix-1)
            f = 1;
        end
        
        imm(iy, ix) = f;
    end    
end
    
figure;
imshow(im);

figure;
imshow(img);

figure;
imagesc(imAng);

figure;
imshow(imm);


