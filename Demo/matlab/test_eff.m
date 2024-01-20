im = im2double(imread('lena.jpg'));

sy = size(im, 1);
sx = size(im, 2);

imd = zeros(sy, sx);
imds = zeros(sy, sx);

m = 5;
p = 50;

for diy = 1:sy
    for dix = 1:sx
        siy = diy;
        
        off = m*sin((diy/p)*2*pi);
        fix = dix + off;
        
        iix = floor(fix);
        
        if iix < 1 || iix + 1 > sx
            continue;
        end
        
        alpha = fix - iix;
        
        imds(diy, dix) = (1-alpha) * im(siy, iix) + alpha * im(siy, iix+1);
        
        
        imd(diy, dix) = im(siy, round(fix));
    end
end

figure;

subplot(221);
imshow(im);

subplot(222);
imshow(imd);


subplot(223);
imshow(imds);

