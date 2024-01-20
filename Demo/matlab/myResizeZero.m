function imd = myResizeZero(ims, s)

sz = size(ims);

dsz = round(s*sz);
sy = dsz(1);
sx = dsz(2);

imd = zeros(dsz);

for diy = 1:sy
    for dix = 1:sx
        fix = dix/s;
        fiy = diy/s;
        
        iix = round(fix);
        iiy = round(fiy);
        
        if iix < 1 || iiy < 1 || iix > sz(2) || iiy > sz(1)
            continue;
        end
        
        imd(diy, dix) = ims(iiy, iix);
    end
end
