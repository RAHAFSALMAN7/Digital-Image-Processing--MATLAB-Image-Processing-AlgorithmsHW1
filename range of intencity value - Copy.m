function labeled_image = connected_component_labeling_with_intensity_range(image_path, min_val, max_val)
    % Load the image
    image = imread(image_path);
    
    % Convert the image to grayscale
    gray_image = rgb2gray(image);

    % Threshold the image based on intensity range
    bw_image = gray_image >= min_val & gray_image <= max_val;

    % Perform connected component labeling
    [labeled_image, num_labels] = bwlabel(bw_image, 8);

    % Display the original image, binary image, and labeled image
    figure;
    subplot(1, 3, 1);
    imshow(image);
    title('Original Image');

    subplot(1, 3, 2);
    imshow(bw_image);
    title('Binary Image');

    subplot(1, 3, 3);
    imshow(label2rgb(labeled_image, 'jet', 'k', 'shuffle'));
    title(['Labeled Image, Num Labels: ', num2str(num_labels)]);
end

% Example usage:
% Provide the image path and intensity range
image_path = 'C:\Users\Admin\Desktop\99.png';
min_val = 50;
max_val = 200;

% Perform connected component labeling with intensity range
labeled_image = connected_component_labeling_with_intensity_range(image_path, min_val, max_val);
