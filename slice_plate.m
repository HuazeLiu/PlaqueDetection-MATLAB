clear all
close all

plate_type = 24;

plate = imread('6by4.jpg');
[row_size,col_size] = size(plate); %row, column

if plate_type == 24
    width = 4;
    length = 6;
    char_radius = row_size/15;
    min_radius = round(char_radius-row_size*0.01);
    max_radius = round(char_radius+row_size*0.01);
end

% ROUND 1
[centers,radii] = imfindcircles(plate,[min_radius,max_radius],'ObjectPolarity','dark','Sensitivity',0.96,'Method','TwoStage');
imshow(plate)
h = viscircles(centers,radii);

% ROUND 2
radii_data = rmoutliers(radii);
average_radii = mean(radii_data);
min_radius = round(average_radii-row_size*0.001);
max_radius = round(average_radii+row_size*0.001);
[centers,radii] = imfindcircles(plate,[min_radius,max_radius],'ObjectPolarity','dark','Sensitivity',0.98,'Method','TwoStage');
imshow(plate)
h = viscircles(centers,radii);

% ROUND 3
% x Positions
lef_col_centers = [];
for i = 1:1:size(centers,1)
    if centers(i,1) < min(centers(:,1))+(max(centers(:,1))-min(centers(:,1)))*0.1
        lef_col_centers = [lef_col_centers;centers(i,1)];
    end
end
lef_col_centers = rmoutliers(lef_col_centers);
average_lef_col = mean(lef_col_centers);

rig_col_centers = [];
for i = 1:1:size(centers,1)
    if centers(i,1) > max(centers(:,1))-(max(centers(:,1))-min(centers(:,1)))*0.1
        rig_col_centers = [rig_col_centers;centers(i,1)];
    end
end
rig_col_centers = rmoutliers(rig_col_centers);
average_rig_col = mean(rig_col_centers);

x_positions = linspace(average_lef_col,average_rig_col,width);

% y Positions
bot_row_centers = [];
for i = 1:1:size(centers,1)
    if centers(i,2) < min(centers(:,2))+(max(centers(:,2))-min(centers(:,2)))*0.1
        bot_row_centers = [bot_row_centers;centers(i,2)];
    end
end
bot_row_centers = rmoutliers(bot_row_centers);
average_bot_row = mean(bot_row_centers);

top_row_centers = [];
for i = 1:1:size(centers,1)
    if centers(i,2) > max(centers(:,2))-(max(centers(:,2))-min(centers(:,2)))*0.1
        top_row_centers = [top_row_centers;centers(i,2)];
    end
end
top_row_centers = rmoutliers(top_row_centers);
average_top_row = mean(top_row_centers);

y_positions = linspace(average_bot_row,average_top_row,length);

[X,Y] = meshgrid(x_positions,y_positions);
cor_centers = zeros(width*length,2);
for i = 1:1:width*length
    cor_centers(i,1) = X(i);
    cor_centers(i,2) = Y(i);
end
cor_radii = repelem(average_radii,width*length)';
imshow(plate)
h = viscircles(cor_centers,cor_radii);