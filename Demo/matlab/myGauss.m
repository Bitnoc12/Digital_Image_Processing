function imd = myGauss(im, w, sigma)

sy = size(im, 1);
sx = size(im, 2);

off = floor(w/2);

[yy, xx] = ndgrid(-off:off, -off:off);
H = exp(- (xx.^2 + yy.^2)/sigma);
H = H/sum(H(:));

imd = im;
for iy = 1+off:sy-off
    for ix = 1+off:sx-off
        d = im(iy + (-off:off), ix + (-off:off));
        v = d.*H;
        imd(iy, ix) = sum(v(:));
    end
end
% figure;
% imshow(H);
