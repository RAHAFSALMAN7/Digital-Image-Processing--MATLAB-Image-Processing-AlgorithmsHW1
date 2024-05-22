% Define the full path to the image
image_path = 'C:\Users\Admin\Desktop\99.png';

try
    % Read the image
    image = imread(image_path);
catch ME
    error('Unable to find or read the file ''%s''. Please make sure the file exists and the path is correct. Details: %s', image_path, ME.message);
end

try
    % Convert the image to grayscale
    gray_image = rgb2gray(image);
catch ME
    error('Failed to convert the image to grayscale. Details: %s', ME.message);
end

try
    % Convert the grayscale image to binary
    if exist('imbinarize', 'file')
        % MATLAB
        bw_image = imbinarize(gray_image);
    else
        % Octave
        bw_image = im2bw(gray_image, graythresh(gray_image));
    end
catch ME
    error('Failed to convert the grayscale image to binary. Details: %s', ME.message);
end

% Define the minimum size for components to retain
min_size = 100; % Adjust as needed

% Perform connected component labeling manually
[labels, num_labels] = bwlabel(bw_image, 8); % 8-connectivity

% Initialize a new binary image with the same size as the input image
filtered_image = zeros(size(bw_image));

% Iterate through each pixel to calculate component sizes
for label = 1:num_labels
    component_size = sum(labels(:) == label);
    % Check if the component size is greater than or equal to the minimum size
    if component_size >= min_size
        % If yes, retain the component by setting its pixels in the filtered image
        filtered_image(labels == label) = 1;
    end
end

% Optionally, visualize the filtered components
try
    subplot(1, 2, 1);
    imshow(bw_image);
    title('Original Binary Image');

    subplot(1, 2, 2);
    imshow(filtered_image);
    title('Filtered Image with Size Filter');
catch ME
    error('Failed during visualization. Details: %s', ME.message);
end
