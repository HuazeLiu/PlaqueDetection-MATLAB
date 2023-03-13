my_image = im2double(rgb2gray(imread('virry.png')));
my_image = my_image(:,:,1);
image_thresholded = my_image;
image_thresholded(my_image>0.3) = 256;
image_thresholded(my_image<0.3) = 0;

figure()
subplot(1,2,1)
imshow(my_image,[])
title('original image')
subplot(1,2,2)
imshow(image_thresholded,[])
title('thresholded image')