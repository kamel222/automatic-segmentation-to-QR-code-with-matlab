function main()
clear, close all,  clc;
I = imread('1.1.bmp');
bw = imbinarize(rgb2gray(I));
[Centroid, bw2, flag] = detectFinder(bw);
markers = Centroid(logical(flag),:);
figure,imshow(bw2), title('level 1');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% Level 2 %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[idxC, idxX, idxY] = finderPos(markers);
[I, bw2, ~] = RotateTheBigShape(I, bw2, idxC, idxX, idxY, markers);
figure, imshow(bw2), title('level 2');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% Level 3 %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[cropped] = CropTheShape(I, bw2);
figure,imshow(cropped),  title('THE FINAL RESULT');
end