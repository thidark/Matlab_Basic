clc, clear, close all
net = alexnet;%%227 227
%net = googlenet;
[f p] = uigetfile('*.jpg');
im = imread([p f]);
figure
imshow(im)
im = imresize(im,[227 227]);
[label,score] = classify(net,im);
title({char(label),num2str(max(score),2)});
