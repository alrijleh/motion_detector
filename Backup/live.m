%clear all;

vid = videoinput('winvideo', 1, 'YUY2_640x480');
src = getselectedsource(vid);
vid.FramesPerTrigger = 1;
vid.ReturnedColorSpace = 'rgb';

preview(vid);
pause(1.5);
base = getsnapshot(vid);

while true;
    frame = getsnapshot(vid);
    [center] = GetCentersColor(base,frame);
    
    %livepreview;
end

stoppreview(vid);
close(1);