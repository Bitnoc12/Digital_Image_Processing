im = im2double(imread('lena.jpg'));

% figure;
% imshow(im);

a = 30/180*pi;
R = [cos(a), -sin(a); sin(a), cos(a)];
R = R';

imr = im;
imr(:) = 0;

sz = size(im);
h = sz(1);
w = sz(2);

c = [w; h]/2;
for ix=1:w
    for iy=1:h
        p = [ix; iy];
        pp = (R*(p-c)+c);
        mn = floor(pp);
        ab = pp-mn;
        a = ab(1);
        b = ab(2);
        m = mn(2);
        n = mn(1);
        if pp(1) >= 2 && pp(1)<=w-1 && pp(2) >= 2 && pp(2)<=h-1
            v = (1-a)*(1-b)*im(m,n)    + (1-a)*b*im(m+1,n) ...
                +a   *(1-b)*im(m,n+1)  +    a *b*im(m+1,n+1);
            
            imr(iy, ix) = v;
        end
    end
end
figure;
subplot(2,2, 1);
imshow(im);

subplot(2,2, 2);
imshow(imr);

subplot(2,2, 3);
imshow(1-imr);

subplot(2,2, 4);
imshow(imr);

% p = [1 0]';
% pp = R*p;
% 
% figure;
% hold on;
% plot(p(1), p(2), '.r');
% plot(pp(1), pp(2), '.b');
% axis equal;


