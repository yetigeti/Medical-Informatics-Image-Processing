


function [FinalPoints] = MeshReconstruction()

img = nrrdread('MRHeadSub.nrrd');
FinalPoints = [];
for i = 1:size(img.pixelData,3) - 6
    Points = MeshSegment(img.pixelData(:,:,i));
    AllPoints(:,1) = Points(:,1);
    AllPoints(:,2) = Points(:,2);
    AllPoints(:,3) = i;
    disp(AllPoints);
    
    Points2 = MeshSegment(img.pixelData(:,:,i+1));
    AllPoints2(:,1) = Points2(:,1);
    AllPoints2(:,2) = Points2(:,2);
    AllPoints2(:,3) = i + 1;
    
    plot3(AllPoints(:,2),AllPoints(:,1),AllPoints(:,3));
    %line([AllPoints(:,2),AllPoints2(:,2)],[AllPoints(:,1),AllPoints2(:,1)],[AllPoints(:,3),AllPoints2(:,3)]);
    for j = 1:size(Points,1);
        line([AllPoints(j,2),AllPoints2(j,2)],[AllPoints(j,1),AllPoints2(j,1)],[i,i+1]);
    end
end

end