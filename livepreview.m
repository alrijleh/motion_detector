%displays the largest detected object over the video feed.

image(frame);
daspect ([1 1 1]);
hold on;
if ~isempty(center)
scatter(center(1),center(2),'r','o','fill');
end