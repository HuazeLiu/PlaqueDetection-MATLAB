image = imread('circle.png');
figure(1)
imshow(image)

guassian = imgaussfilt(image,5);
figure(2)
imshow(guassian)