clear all
testimage = imread('trial.png');
grayscaleimage = rgb2gray(testimage);
BW = imbinarize(grayscaleimage,0.67); %0 black, 1 white
BW = bwareaopen(BW,30);
% imshow(BW)

imshow(BW);
[B,L] = bwboundaries(BW,'nohole');

imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
hold on
y = size(B);
title("Number of plaques detected: " + y(1));

% find the boundary edge

