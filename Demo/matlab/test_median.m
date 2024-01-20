im = imread('3.png');

[sy, sx] = size(im);

w = 3;

imd = im;
imd(:) = 0;
for y = 1:sy-w+1
    for x = 1:sx-w+1
        % x+(0:w-1), y + (0:w-1)
        a = im(y+(0:w-1), x+(0:w-1));
        a = a(:);
        imd(y,x) = median(a);
    end
end
figure;
subplot(121);
imshow(im);
title('before');
subplot(122);
imshow(imd);
title('after');