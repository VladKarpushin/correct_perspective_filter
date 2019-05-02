% 2019-04-11
% Correct Perspective Filter
% The ffilter corrects the perspective of objects
% https://www.youtube.com/watch?v=FtIXgUfa23o&list=PLCE5HwZ7W7i4ataKfwOBz3bTwXZ89Nv9o&index=19
% 
clc, clearvars, close all;

strFolder = 'D:\home\programming\vc\new\6_My home projects\21_license_plate_extraction\input\';
%strFileName = strcat(strFolder,'P1030639_new.JPG');
%strFileName = strcat(strFolder,'P1030636_new.JPG');
strFileName = strcat(strFolder,'P1030627_new.JPG');

%************
% inputting *d
%************
%matchedPtsTarget = [400,400; 250,400; 250,350; 400,350];  % (x,y), x - var
matchedPtsTarget = [300,200; 50,200; 50,100; 300,100];  % (x,y), x - var
matchedPtsDistorted = matchedPtsTarget;

img = imread(strFileName);
[h w c] = size(img);
if c == 3
    img = rgb2gray(img);
end

figure, imshow(img);
title('original image');

h = impoly(gca, matchedPtsDistorted);
matchedPtsDistorted = wait(h);

tform = estimateGeometricTransform(matchedPtsDistorted, matchedPtsTarget, 'affine');
img_out = imwarp(img, tform);

%*************
% outputting *
%*************

figure, imshow(img_out);
title('corrected image');