function [I, BW, markers] = RotateTheBigShape(I, BW, idxC, idxX, idxY, markers)
midPoint.x = (markers(idxX, 1) + markers(idxY, 1)) / 2;
midPoint.y = (markers(idxX, 2) + markers(idxY, 2)) / 2;
I = insertShape(I, 'Line', [markers(idxC, 1), markers(idxC, 2), midPoint.x, midPoint.y], 'LineWidth', 5);
figure,imshow(I),  title('Ploted Line');

deltaY = markers(idxC, 2) - midPoint.y;
deltaX = markers(idxC, 1) - midPoint.x;
slope = deltaY / deltaX;
angle = atan2d(deltaY ,deltaX);
angle = mod(angle, 180);
if(slope > 1.9)
    angle = -int32(180-angle)-45;
    I = imrotate(I, angle);
    BW = imrotate(BW, angle);
else
    angle = -int32(360-angle)-45;
    I = imrotate(I, angle);
    BW = imrotate(BW, angle);
end
end