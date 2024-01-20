imSrc = im2double(imread('1.jpg'));

imRef = im2double(imread('2.jpg'));

imDst0 = imSrc;
imDst = imSrc;

close all

for i=1:3
    X = imSrc(:,:,i);
    Y = imRef(:,:,i);
    
    mx = mean(X(:));
    sigx = std(X(:));
    
    my = mean(Y(:));
    sigy = std(Y(:));
    
    a1 = sigy/sigx;
    a00 = my - mx;
    a0 = my - a1*mx;
    
    imDst(:,:,i) = a0 + a1*X;
    imDst0(:,:,i) = a00 + X;
    
    xhist = myHist(im2uint8(X));
    yhist = myHist(im2uint8(Y));
    dhist = myHist(im2uint8(imDst(:,:,i)));
    d0hist = myHist(im2uint8(imDst0(:,:,i)));
    
    figure;
    subplot(2,2,1);
    plot(xhist);
    
    subplot(2,2,2);
    plot(yhist);

    subplot(2,2,3);
    plot(dhist);

    subplot(2,2,4);
    plot(d0hist);
end



figure;
subplot(2,2,1);
imshow(imSrc);

subplot(2,2,2);
imshow(imRef);

subplot(2,2,3);
imshow(imDst);

subplot(2,2,4);
imshow(imDst0);
