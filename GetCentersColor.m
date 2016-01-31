function [center,bw3,areas] = GetCentersColor(base,test)
%Returns the coordinates of each object, in relation to a base frame

for n = 3:-1:1
    %normalize brightness
    avgB(n) = graythresh(base(:,:,n));
    avgT(n) = graythresh(test(:,:,n));
    test2(:,:,n) = test(:,:,n) * avgB(n)/avgT(n);
    
    diff(:,:,n) = imabsdiff(base(:,:,n), test2(:,:,n));
    avgD(n) = graythresh(diff(:,:,n));
    
    if avgD(n) < .04
       bw2 = zeros(size(test));
       continue
    end
    
    bw(:,:,n) = (diff(:,:,n) >= avgD(n)*256);
    bw2(:,:,n) = bwareaopen(bw(:,:,n),75,8); %remove small objects
end
bw3 = any(bw2,3);

stats = regionprops(bw3, 'centroid', 'area');
centers = cat(1, stats.Centroid);
areas = cat(1, stats.Area);
[~ , index] = max(areas);
center = centers(index,:);
end

