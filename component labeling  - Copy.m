function labeled_image = connected_component_labeling(image_path)
    % Load the image
    image = imread(image_path);
    
    % Convert the image to binary
    bw_image = im2bw(image);

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
% Provide the image path
image_path = 'C:\Users\Admin\Desktop\99.png';

% Perform connected component labeling
labeled_image = connected_component_labeling(image_path);
