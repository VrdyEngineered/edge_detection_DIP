
% -----------------------------------------------------------
% DIGITAL IMAGE PROCESSING LAB
% Experiment 5: Edge Detection using Sobel, Prewitt, and Laplacian Operators
% -----------------------------------------------------------

clc; clear; close all;

% Step 1: Read the input image
img = imread('butterfly.jpg');  % <-- replace with your image filename
figure, imshow(img), title('Original Image');

% Step 2: Convert the image to grayscale
gray_img = rgb2gray(img);
figure, imshow(gray_img), title('Grayscale Image');

% Step 3: Apply Sobel Edge Detection
sobel_edges = edge(gray_img, 'sobel');
figure, imshow(sobel_edges), title('Sobel Edge Detection');

% Step 4: Apply Prewitt Edge Detection
prewitt_edges = edge(gray_img, 'prewitt');
figure, imshow(prewitt_edges), title('Prewitt Edge Detection');

% Step 5: Apply Laplacian Edge Detection
% Laplacian can be done using fspecial + imfilter or directly via edge()
laplacian_filter = fspecial('laplacian', 0.2); % 0.2 is alpha value
laplacian_edges = imfilter(double(gray_img), laplacian_filter, 'replicate');
figure, imshow(laplacian_edges, []), title('Laplacian Edge Detection');

% Step 6: Display all results together
figure;
subplot(2,2,1), imshow(gray_img), title('Grayscale Image');
subplot(2,2,2), imshow(sobel_edges), title('Sobel Operator');
subplot(2,2,3), imshow(prewitt_edges), title('Prewitt Operator');
subplot(2,2,4), imshow(laplacian_edges, []), title('Laplacian Operator');

% Optional: Save output images
imwrite(sobel_edges, 'sobel_output.jpg');
imwrite(prewitt_edges, 'prewitt_output.jpg');
imwrite(mat2gray(laplacian_edges), 'laplacian_output.jpg');
