close all
Boba = imread(['bop.png']);
%Boba = rgb2gray(Boba)
%Boba = imsharpen(Boba)
[centers,radii] = imfindcircles(Boba,[10,30],'ObjectPolarity','bright','Sensitivity',0.93,'Method','TwoStage')
imshow(Boba)
h = viscircles(centers,radii);

%d = drawline;
%pos = d.Position;
%diffPos = diff(pos);
%diameter = hypot(diffPos(1),diffPos(2))

%'PhaseCode' (default) | 'TwoStage'