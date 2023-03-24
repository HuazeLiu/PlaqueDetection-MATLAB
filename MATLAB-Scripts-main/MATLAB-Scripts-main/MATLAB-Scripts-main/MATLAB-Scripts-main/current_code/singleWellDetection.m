%input: single well
%output: plaque count

function [finalCount] = singleWellDetection(inputImage)
% grayscaleimage = rgb2gray(inputImage);
% imshow(grayscaleimage);
% BW = imbinarize(grayscaleimage,0.6); %0 black, 1 white
% BW = bwareaopen(BW,30);
% 
% imshow(BW);
gray_image = rgb2gray(inputImage);
figure(1)
imshow(gray_image)
% explore other background elimination techniques
se = strel('disk', 15)
background = imopen(gray_image,se);
figure(2)
imshow(background)

Image_plaque = gray_image - background;
figure(3)

imshow(Image_plaque)
Image_contrast = imadjust(Image_plaque);
imshow(Image_contrast)
bw = imbinarize(Image_contrast,0.6);  
bw = bwareaopen(bw,50);
imshow(bw)


[B,L] = bwboundaries(bw,'nohole')

imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
hold on
y = size(B);
title("Number of plaques detected: " + y(1));
finalCount = y(1);

end