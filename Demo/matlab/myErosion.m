function imE = myErosion(im, B)

sy = size(im, 1);
sx = size(im, 2);

by = size(B, 1);
bx = size(B, 2);
box = floor(bx/2);
boy = floor(by/2);

imE = im;
imE(:) = 0;

for iy = 1+boy:sy-boy
    for ix = 1+box:sx-box
        A = im(iy+(-boy:boy), ix+(-box:box));
        idx = find(A == 0 & B == 1);
        
        if isempty(idx)
            imE(iy, ix) = 1;
        end
    end
end
