im = imread('imp.png');

mask = im(:,:,1) > 250;

img = im2double(rgb2gray(im));

sy = size(img, 1);
sx = size(img, 2);

imd = img;

for iy = 1:sy
    for ix = 1:sx
        if 0 == mask(iy, ix)
            continue;
        end
        
        idx = find(0 == mask(iy, 1:ix));
        idxL = idx(end);
        
        idx = find(0 == mask(iy, ix:end));
        idxR = ix - 1 + idx(1);
        
        idx = find(0 == mask(1:iy, ix));
        idxU = idx(end);
        
        idx = find(0 == mask(iy:end, ix));
        idxD = iy - 1 + idx(1);
        
        if idxR - idxL > idxD - idxU
            % y
            alpha = (iy - idxU)/(idxD - idxU);
            imd(iy, ix) = (1-alpha)*img(idxU, ix) +  alpha*img(idxD, ix);
        else
            % x
            alpha = (ix - idxL)/(idxR - idxL);
            imd(iy, ix) = (1-alpha)*img(iy, idxL) +  alpha*img(iy, idxR);
        end
    end
end


figure;

subplot(221);
imshow(im);

subplot(222);
imshow(img);

subplot(223);
imshow(mask);

subplot(224);
imshow(imd);
