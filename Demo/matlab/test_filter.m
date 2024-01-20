im = im2double(imread('2.png'));

w = 9;
h = ones(w,w)/(w*w);

[sy, sx] = size(im);
imd = zeros(sy-w+1, sx-w+1);
for y=1:(sy-w+1)
    for x=1:(sx-w+1)
        %imd(y,x) = boxfilter
        %im(y+0:2, x+0:2) * h
        imd(y,x) = sum(sum(im(y+(0:w-1), x+(0:w-1)) .* h));
    end
end

figure;
subplot(121);
imshow(im);
subplot(122);
imshow(imd);