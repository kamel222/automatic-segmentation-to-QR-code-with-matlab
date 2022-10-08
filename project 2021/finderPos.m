function [idxC, idxX, idxY] = finderPos(markers)
angle = zeros(3,1);
for i = 1:3
    tmp = markers;
    ref = markers(i,:);
    tmp(i,:) = [];
    ab2 = polyfit([ref(1,2); tmp(1,2)], [ref(1,1); tmp(1,1)], 1);
    ab1 = polyfit([ref(1,2); tmp(2,2)], [ref(1,1); tmp(2,1)], 1);
    vect1 = [1 ab1(1)];
    vect2 = [1 ab2(1)];
    dp = dot(vect1, vect2);
    length1 = sqrt(sum(vect1.^2));
    length2 = sqrt(sum(vect2.^2));
    angle(i) = 180-acos(dp/(length1*length2))*180/pi;
end
[~, idxC] = min(abs(abs(angle) - 90));
tblidx = [1 2 3];
tmp = markers;
tmp(idxC,:) = [];
tblidx(idxC) = [];
ref = markers(idxC,:);
angle = zeros(2, 1);
for i = 1:2
    ab2 = polyfit([ref(1,2); tmp(i,2)], [ref(1,1); tmp(i,1)], 1);
    %ab1 = polyfit([ref(1,2); ref(1,2)], [ref(1,1); ref(1,1) + 15], 1);
    ab1(1) = 10^8;
    
    vect1 = [1 ab1(1)];
    vect2 = [1 ab2(1)];
    dp = dot(vect1, vect2);
    length1 = sqrt(sum(vect1.^2));
    length2 = sqrt(sum(vect2.^2));
    angle(i) = acos(dp/(length1*length2))*180/pi;
end
idx = angle > 90;
angle(idx) = 180 - angle(idx);
[~, i] = min(abs(angle));
idxX = tblidx(i);
tblidx(i) = [];
idxY = tblidx;
end