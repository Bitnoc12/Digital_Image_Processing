function imd = myMedian(im, w)

sy = size(im, 1);
sx = size(im, 2);

off = floor(w/2);

imd = im;
for iy = 1+off:sy-off
    for ix = 1+off:sx-off
        d = im(iy + (-off:off), ix + (-off:off));
        imd(iy, ix) = median(d(:));
    end
end
