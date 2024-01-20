function imd = myResize(ims, s)

sz = size(ims);

dsz = round(s*sz);
sy = dsz(1);
sx = dsz(2);

imd = zeros(dsz);

for diy = 1:sy
    for dix = 1:sx
        fix = dix/s;
        fiy = diy/s;
        
        iix = floor(fix);
        iiy = floor(fiy);
        
        if iix < 1 || iiy < 1 || iix + 1 > sz(2) || iiy + 1 > sz(1)
            continue;
        end
        
        a = fix - iix;
        b = fiy - iiy;
        
        imd(diy, dix) = (1-a)*(1-b)*ims(iiy, iix)   + (1-a)*b*ims(iiy+1, iix) ...
                       +   a *(1-b)*ims(iiy, iix+1) +  a   *b*ims(iiy+1, iix+1);
    end
end
