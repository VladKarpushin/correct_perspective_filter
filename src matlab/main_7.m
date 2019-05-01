% 2019-04-11
% 
% https://www.youtube.com/watch?v=FtIXgUfa23o&list=PLCE5HwZ7W7i4ataKfwOBz3bTwXZ89Nv9o&index=19
clc, clear all, close all;

strFolder = 'D:\home\programming\vc\new\6_My home projects\21_license_plate_extraction\input\';
strFileName = strcat(strFolder,'P1030639_new.JPG');

imgA = imread(strFileName);
[h w c] = size(imgA);
if c == 3
    imgA = rgb2gray(imgA);
end

%************
% inputting *
%************
figure,imshow(imgA);
matchedPtsOriginal = [400,400; 250,400; 250,350; 400,350];  % (x,y), x - var
matchedPtsDistorted = matchedPtsOriginal;
%matchedPtsDistorted = [286,186; 146,342; 169,231; 314,86];  % P1030629.jpg
%matchedPtsDistorted = [207,291; 169,181; 178,112; 215,207];  % P1030629.jpg
%matchedPtsDistorted = [176,143; 139,192; 123,108; 160,69];  % P1030627.jpg
%matchedPtsDistorted = [330,245; 274,401; 273,285; 327,149];  % P1030625.jpg
%matchedPtsDistorted = [350,213; 306,309; 288,207; 331,128];  % P1030624.jpg
%matchedPtsDistorted = [294,197; 239,165; 246,101; 304,125]; % P1030621.jpg
%matchedPtsDistorted = [427,309; 373,348; 365,290; 420,262]; % 1.jpg
%matchedPtsDistorted = [195,224; 137,177; 132,159; 192,202]; % 2.jpg

h = impoly(gca, matchedPtsDistorted);
matchedPtsDistorted = wait(h);

tform = estimateGeometricTransform(matchedPtsDistorted,matchedPtsOriginal,'affine');
Ir = imwarp(imgA,tform);
figure, imshow(Ir);
