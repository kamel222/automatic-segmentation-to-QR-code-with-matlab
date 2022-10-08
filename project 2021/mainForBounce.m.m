function mainForBounce()
clear, close all,  clc;
I = imread('6.1.bmp');
bw = imbinarize(rgb2gray(I));
[Centroid, bw2, flag] = detectFinder(bw);
markers = Centroid(logical(flag),:);
figure,imshow(bw2), title('level 1');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(length(markers))
while ~isempty(markers)
    pickedPoint = markers(1, :);
    minDistance = 999999999;
    secondMinDistance = 99999999;
    minIndex = 0;
    secondMinIndex = 0;
    for j = 2: length(markers)
        deltaX = pickedPoint(1,1) - markers(j,1);
        deltaY = pickedPoint(1,2) - markers(j,2);
        distance = sqrt(deltaX.^2 + deltaY.^2);
        if int32(distance) < int32(minDistance)
            minDistance = distance;
            minIndex = j;
        end
        if int32(distance) > int32(minDistance) && int32(distance) < int32(secondMinDistance)
            secondMinDistance = distance;
            secondMinIndex = j;
        end
        if int32(distance) == int32(minDistance) && minIndex ~= j
            secondMinDistance = distance;
            secondMinIndex = j;
        end
    end
    newMarkers = [pickedPoint; markers(minIndex,:); markers(secondMinIndex,:)];
    markers([1, minIndex, secondMinIndex],:) = [];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%% Level 2 %%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [idxC, idxX, idxY] = finderPos(newMarkers);
    orderedMarkers = [newMarkers(idxC,:), newMarkers(idxX,:), newMarkers(idxY,:)];
    [cropped] = CropTheShapeBounce(I, bw2, orderedMarkers);
    figure,imshow(cropped),  title('THE FINAL RESULT');

end
end