im = im2double(imread('2.bmp'));

imd = im;

sz = size(im);

a = 50/255;
b = 150/255;
ya = 30/255;
yb = 200/255;
alpha = 0.2;
beta = 2;
gama = 1;

for iy=1:sz(1)
    for ix = 1:sz(2)
        x = im(iy, ix);
        if x < a
            y = alpha * x;
        elseif x >= a && x < b
            y = beta * (x-a) + ya;
        else
            y = gama * (x-b) + yb;
        end
        imd(iy, ix) = y;
    end
end


figure;
subplot(1,2,1);
imshow(im);

subplot(1,2,2);
imshow(imd);
