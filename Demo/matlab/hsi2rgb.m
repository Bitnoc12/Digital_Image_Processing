function im = hsi2rgb(hsi)
h = hsi(:,:,1);
s = hsi(:,:,2);
I = hsi(:,:,3);

r = zeros(size(hsi,1), size(hsi,2));
g = zeros(size(hsi,1), size(hsi,2));
b = zeros(size(hsi,1), size(hsi,2));

idx = find(h < 120);
b(idx) = I(idx).*(1 - s(idx));
r(idx) = I(idx).*(1 + s(idx)*cos( h(idx)/180*pi )./cos( (60-h(idx)) /180*pi));


RG = im(:,:,1) - im(:,:,2);
RB = im(:,:,1) - im(:,:,3);
GB = im(:,:,2) - im(:,:,3);

mask = im(:,:,3) <= im(:,:,2);

theta = acos(0.5*(RG+RB)./sqrt(abs(RG.^2 + RB.*GB)))/pi*180;

hsi(:,:,1) = mask.*theta + (1-mask).*(360 - theta);

imsum = sum(im, 3);
immin = min(im, [], 3);

hsi(:,:,2) = 1 - 3*immin./imsum;

hsi(:,:,3) = mean(im, 3);
