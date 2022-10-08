function [result] = CropTheShapeBounce(I, BW, markers)
black = zeros(size(BW)); 
black = insertShape(black, 'FilledPolygon', int32(markers));
figure, imshow(black); 

[l, num] = bwlabel(imbinarize(rgb2gray(black)));
state = regionprops(l,'BoundingBox');

state.BoundingBox(1) = state.BoundingBox(1) - 30;
state.BoundingBox(2) = state.BoundingBox(2) - 30;
state.BoundingBox(3) = state.BoundingBox(3) + 60;
state.BoundingBox(4) = state.BoundingBox(4) + 60;
result = imcrop(I, state.BoundingBox);
end