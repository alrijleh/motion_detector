%clear all;
numframes = 90;

vid = videoinput('winvideo', 1, 'YUY2_640x480');
src = getselectedsource(vid);
vid.FramesPerTrigger = numframes;
vid.ReturnedColorSpace = 'rgb';
%{
start(vid);
wait(vid);
[frame, time] = getdata(vid);

base = frame(:,:,:,30);
test = frame(:,:,:,90);
%}
tic
[centers, bw, a] = GetCentersColor(base,test);
toc

subplot(1,3,1)
image(base)
daspect([1 1 1])
subplot(1,3,2)
image(test)
daspect([1 1 1])
subplot(1,3,3)
image(bw)
daspect([1 1 1])
hold on;
colormap(gray(2));
if ~isempty(centers)
    scatter(centers(:,1),centers(:,2),'r','o','fill');
end