im = rgb2gray(imread('fill.png')) > 0;

cim = ~im;

B = [0 1 0; 1 1 1; 0 1 0;]>0;
X = im;
X(:) = 0;
X(78,56) = 1;
    figure(1);
    hold on;
    imshow(im);
    hold on;
    plot(56,78,'.r');
    pause;


for i=1:100
    XX = myDilation(X, B);
    [y,x] = find(XX);
    
    figure(1);
    hold on;
    imshow(im);
    hold on;
    plot(x,y,'.r');
    pause;

    X = XX & cim;
    [y,x] = find(X);
    
    figure(1);
    hold off
    imshow(im);
    hold on;
    plot(x,y,'.r');
    pause;
end
