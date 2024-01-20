function histBin = myHist(im)

sz = size(im);

histBin = zeros(256, 1);

for iy=1:sz(1)
    for ix = 1:sz(2)
        v = im(iy, ix);
        idx = v + 1;
        histBin(idx) = histBin(idx) + 1;
    end
end

