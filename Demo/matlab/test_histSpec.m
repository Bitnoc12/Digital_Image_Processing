imSrc = (imread('2.png'));

histBinS = myHist(imSrc);
cdf = cumsum(histBinS);
S = uint8(round(cdf/max(cdf)*255));


imRef = (rgb2gray(imread('4.png')));

histBinR = myHist(imRef);
cdf = cumsum(histBinR);
T = uint8(round(cdf/max(cdf)*255))+1;

TM = [(1:256)' T];

TI = zeros(256, 1);
TI(T) = (1:256)';

TIM = [(1:256)' TI];

idxMiss = find(TI == 0);
nm = length(idxMiss);
idxHit = find(TI ~= 0);
nh = length(idxHit);

mm = repmat(idxMiss, 1, nh);
hh = repmat(idxHit', nm, 1);

dd = abs(mm - hh);
[Y, k] = min(dd, [], 2);

TI(idxMiss) = TI(idxHit(k));
TIMF = [(1:256)' TI];

remap = uint8(TI(S+1) - 1);

imDst = remap(imSrc);
histBinD = myHist(imDst);

figure;

subplot(231);
imshow(imSrc);

subplot(232);
imshow(imRef);

subplot(233);
imshow(imDst);

subplot(234);
plot(histBinS);

subplot(235);
plot(histBinR);

subplot(236);
plot(histBinD);
