%input: single well image
%intermediate: crops out well border then singleWellDetection
%output: plaque count & figure

function [outputImage] = crop_function(inputImage)
%close all

offset = 1; % mm
wellSize = 15.6; %diameter in mm
scale = 1-offset/(15.6/2);
% figure(1)
originalImage = inputImage;
% imshow(originalImage);
[rows, columns, numberOfColorChannels] = size(originalImage);
%center = [rows/2; columns/2];
%radius = [rows/2];
normalRadius = [rows/2];
center = [rows/2; columns/2];
radius = [rows/2*scale];

% coordinates of a circle
angles = linspace(0, 2*pi, 10000);
x = cos(angles) * radius + center(1);
y = sin(angles) * radius + center(2);

mask = poly2mask(x,y,rows,columns);

% Mask the image with the circle.
if numberOfColorChannels == 1
	maskedImage = originalImage; % Initialize with the entire image.
	maskedImage(~circleImage) = 0; % Zero image outside the circle mask.
else
	% Mask the image.
	maskedImage = bsxfun(@times, originalImage, cast(mask, class(originalImage)));
end
% Crop the image to the bounding box.
% figure(2)
props = regionprops(mask, 'BoundingBox');
maskedImage = imcrop(maskedImage, props.BoundingBox);
% imshow(maskedImage, []);
% figure(3)
outputImage = singleWellDetection(maskedImage)

% scaling
totalNumOfCurcles = outputImage * normalRadius^2 / radius^2
end