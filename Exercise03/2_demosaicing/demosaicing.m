clear all;
close all;
clc;

img = double(imread('lighthouse.ppm'))/255;
%% compute demosaiced images and their psnr value
bayer = img2bayer(img);
bayer_psnr = psnr(bayer,img);

% TODO: nearest neighbor method and bilinear method
simple = nearest(bayer);
simple_psnr = psnr(simple,img);

linear = bilinear(bayer);
linear_psnr = psnr(linear,img);

%% Answer for the question on sheet 3
% As you can see for both algorithms the color reconstruction is not really
% good when you take a look at a region where some objects only take a few
% pixels, because this way, we cannot reconstruct the original color ,
% because the neighbour pixels are already an other object.
% You can see this in this image when you zoom in on the fence or the
% exterior wall of the small house on the left, because the color of the
% images changes quickyl horizontally (fence) or vertically (house)

%% viz bilinear
figure('Name','Final');

subplot(2,3,1);
imshow(img);
title('Original - Full');

ax(1) = subplot(2,3,2);
imshow(img);
title('Original - Zoom');

ax(2) = subplot(2,3,3);
imshow(bayer);
title(strcat('Bayer pattern, PSNR: ', num2str(bayer_psnr)));

ax(3) = subplot(2,3,4);
imshow(simple);
title(strcat('Nearest Neighbour, PSNR: ', num2str(simple_psnr)));

ax(4) = subplot(2,3,5);
imshow(linear);
title(strcat('Bilinear Interpolation, PSNR: ', num2str(linear_psnr)));

linkaxes(ax, 'xy');