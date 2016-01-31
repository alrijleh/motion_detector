%clear all;

vid = videoinput('winvideo', 1, 'YUY2_640x480');
src = getselectedsource(vid);
vid.FramesPerTrigger = 1;
vid.ReturnedColorSpace = 'rgb';

preview(vid);
pause(1.5);
base = getsnapshot(vid);
centerB = zeros(1,2);
for n = 1:10
    frame = getsnapshot(vid);
    time = toc;
    tic;
    centerA = GetCentersColor(base,frame);
    velocityX = (centerA(1) - centerB(1))/time;
    veolcityY = (centerA(2) - centerB(2))/time;
    
    frame = getsnapshot(vid);
    time = toc;
    tic
    centerB = GetCentersColor(base,frame);
    velocityX = (centerB(1) - centerA(1))/time;
    veolcityY = (centerB(2) - centerA(2))/time;
    
end

stoppreview(vid);
close(1);