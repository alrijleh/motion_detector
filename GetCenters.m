function [centers,bw2] = GetCenters(base,test)
%Returns the coordinates of each object, in relation to a base frame

avgB = graythresh(base);
avgT = graythresh(test);
test2 = test * avgB/avgT; %normalize brightness

diff = imabsdiff(base, test2);
avgD = graythresh(diff);
bw = (diff >= avgD*256);
bw2 = bwareaopen(bw,50,8); %remove small objects

stats = regionprops(bw2, 'centroid');
centers = cat(1, stats.Centroid);

end

