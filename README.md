# Automated Plaque Detection in Microplates using MATLAB

This repository contains MATLAB scripts for an in-progress project of automated plaque detection in microplates. The scripts are for image preprocessing, segmenting individual wells, and detecting plaques in each well.

## Usage

1. Run the `slice_plate.m` script on an image of a microplate.
2. The script will segment individual wells from the microplate and pass each well image to `crop_function.m`.
3. The `crop_function.m` function will crop the well to exclude the border and then pass the cropped image to `singleWellDetection.m`.
4. The `singleWellDetection.m` function will detect plaques in the well image and output the count.

## File Descriptions

- `slice_plate.m`: Main script for image preprocessing and well segmentation.
- `crop_function.m`: Function used within `slice_plate.m` to crop individual wells.
- `singleWellDetection.m`: Function for detecting plaques in a single well.
- `/tests/crop.m`: Standalone script for testing `crop_function.m`.
- `/tests/boundary_edge.m`: Standalone script for testing `singleWellDetection.m`.

Note: This is a work in progress project. The codes are not yet fully optimized for general use. 

