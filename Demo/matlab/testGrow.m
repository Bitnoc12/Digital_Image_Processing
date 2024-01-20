im = im2double(imread('lena.jpg'));

sy = size(im, 1);
sx = size(im, 2);

figure;

subplot(221);
imshow(im);
hold on;
[x, y] = ginput(1);
plot(x,y,'r.');

x = round(x);
y = round(y);

m = im(y, x);
N = 1;

T = 20/255;

mask = zeros(size(im));
activeList = [x, y];
mask(y, x) = 1;
while 1
    if isempty(activeList)
        break;
    end
    
    px = activeList(1, 1);
    py = activeList(1, 2);
    
    activeList(1, :) = [];
    
    if px > 1
        v = im(py, px-1);
        if mask(py, px-1) == 0 && abs(m-v) < T
            activeList(end+1, :) = [px-1, py];
            m = (N*m + v)/(N+1);
            N = N + 1;
            mask(py, px-1) = 1;
        end
    end
    
    if px < sx
        v = im(py, px+1);
        if mask(py, px+1) == 0 && abs(m-v) < T
            activeList(end+1, :) = [px+1, py];
            m = (N*m + v)/(N+1);
            N = N + 1;
            mask(py, px+1) = 1;
        end
    end
    
    if py > 1
        v = im(py - 1, px);
        if mask(py-1, px) == 0 && abs(m-v) < T
            activeList(end+1, :) = [px, py-1];
            m = (N*m + v)/(N+1);
            N = N + 1;
            mask(py-1, px) = 1;
        end
    end

    if py < sy
        v = im(py + 1, px);
        if mask(py+1, px) == 0 && abs(m-v) < T
            activeList(end+1, :) = [px, py+1];
            m = (N*m + v)/(N+1);
            N = N + 1;
            mask(py+1, px) = 1;
        end
    end
    
    subplot(222);
    hold off;
    imshow(mask);
    hold on;
    plot(activeList(:,1), activeList(:,2), '.r');
    
    subplot(223);
    hold off;
    imshow(im);
    hold on;
    [ry, rx] = find(mask);
    plot(rx, ry, '.r');
    
    drawnow
    pause(0.1);
end