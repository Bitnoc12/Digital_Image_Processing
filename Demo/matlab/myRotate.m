function imd = myRotate(ims, a)

sz = size(ims);

ang = a/180*pi;
R = [cos(ang), sin(ang); -sin(ang) cos(ang)];
C = sz(:)/2;
T = C - R*C;

RS = R';
TS = -RS*T;

dsz = round(sz);
sy = dsz(1);
sx = dsz(2);

imd = zeros(dsz);

for diy = 1:sy
    for dix = 1:sx
        pd = [dix; diy];
        ps = RS*pd + TS;
        fix = ps(1);
        fiy = ps(2);
                
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
