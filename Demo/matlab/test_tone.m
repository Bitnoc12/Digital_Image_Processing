X = im2double(imread('1.jpg'));
Y = im2double(imread('2.jpg'));

figure;
subplot(121);
imshow(X);
subplot(122);
imshow(Y);

XY = zeros(size(X));

for ch=1:3
    tx = X(:,:,ch);
    ty = Y(:,:,ch);
    
    mx = mean(tx(:));
    sigX = std(tx(:));
    my = mean(ty(:));
    sigY = std(ty(:));
    
    a1 = sigY/sigX;
    a0 = my - a1*mx;
    
    XY(:,:,ch) = a0 + a1*tx;
end
figure;
imshow(XY);
