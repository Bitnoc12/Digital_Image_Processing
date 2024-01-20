close all
A = zeros(100, 100);

off = 30;
A(off+5+(10:20), off+(10:30)) = 1;

A(off+(5:10), off+(5:10)) = 1;

A(off + (30:40), off + (30:40)) = 1;

B = ones(11, 11);
WB = ones(13, 13);
WB(1+(1:11),1+(1:11)) = 0;

C = ones(3,3);

A1 = myErosion(A, B);
A2 = myErosion(1-A, WB);

A3 = myErosion(A, C);
AD = A-A3;

figure;
imshow(A);

figure;
imshow(AD);

figure;
subplot(221);
imshow(A);

subplot(222);
imshow(A1);

subplot(223);
imshow(A2);

subplot(224);
imshow(A1>0 & A2>0);
