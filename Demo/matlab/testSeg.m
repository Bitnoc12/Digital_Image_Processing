im = (imread('2.png'));

T = 100;
    figure;
for i=1:10
    G1Mask = im < T;
    G2Mask = im >= T;
    
    m1 = mean(im(G1Mask));
    m2 = mean(im(G2Mask));
    
    
    subplot(121);
    imshow(im);
    
    subplot(122);
    imshow(G1Mask);
    title(sprintf('%.1f, %.1f %.1f', T, m1, m2));
    
    T = (m1+m2)/2;
    pause;
end