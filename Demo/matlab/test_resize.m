im = imread('1.png');
im = rgb2gray(im);
[sy, sx] = size(im);
scale = 2;
dsy = sy * scale;
dsx = sx * scale;
imd = zeros(dsy, dsx);
for y=1:dsy
    for x=1:dsx
        xs = x/scale;
        ys = y/scale;
        
        ixs = round(xs);
        iys = round(ys);
        imd(y, x) = im(iys, ixs);
    end
end
imd = uint8(imd);

figure;
imshow(im);
figure;
imshow(imd);