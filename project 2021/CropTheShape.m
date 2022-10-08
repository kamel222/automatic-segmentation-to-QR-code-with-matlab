function [result] = CropTheShape(I, BW)
[l, num] = bwlabel(BW);
state = regionprops(l,'BoundingBox');
points(1) = state(1).BoundingBox(1);
points(2) = state(1).BoundingBox(2);

points(3) = state(2).BoundingBox(1);
points(4) = state(2).BoundingBox(2);

points(5) = state(3).BoundingBox(1);
points(6) = state(3).BoundingBox(2);
figure, imshow(BW); 
black = zeros(size(BW)); 
black = insertShape(black, 'FilledPolygon', int32(points));
figure, imshow(black); 

[l, num] = bwlabel(imbinarize(rgb2gray(black)));
state = regionprops(l,'BoundingBox');

state.BoundingBox(1) = state.BoundingBox(1) - 10;
state.BoundingBox(2) = state.BoundingBox(2) - 10;
state.BoundingBox(3) = state.BoundingBox(3) + 50;
state.BoundingBox(4) = state.BoundingBox(4) + 50;
result = imcrop(I, state.BoundingBox);
%figure,imshow(result),  title('Cropped QR-code');
end