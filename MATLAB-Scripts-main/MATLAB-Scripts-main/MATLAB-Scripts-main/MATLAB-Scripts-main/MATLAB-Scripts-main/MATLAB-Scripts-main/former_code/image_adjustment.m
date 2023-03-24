clear all
close all
spot_radius = 10; %pixels
col_image = imread('trial.png');
grasca_image = rgb2gray(col_image);
bw_image = imbinarize(grasca_image,0.67); %0 black, 1 white
[row_size,col_size] = size(bw_image); %row, column
row = 1:1:row_size;
col = 1:1:col_size;
bw_matrix_raw = zeros(row_size,col_size);
for i = row
    for j = col
        binary = bw_image(i,j); %row, column
        bw_matrix_raw(i,j) = binary;
    end
end

% for i = row
%     for j = col
%         if bw_matrix_raw(i,j) == 1
%             surrounding_i = i-spot_radius:1:i+spot_radius;
%             surrounding_j = j-spot_radius:1:j+spot_radius;
%             for l = surrounding_i
%                 %top row
% 
%                 %bottom row
%             end
%             for k = surrounding_j
%                 %left col
%                 if bw_matrix_raw(i-spot_radius-1,k) == 1
%                 %right col
%                 end
%             end
%         end
%     end
% end

figure
heatmap(bw_matrix_raw,'Colormap',autumn)
grid off

figure
%imshow(bw_image)