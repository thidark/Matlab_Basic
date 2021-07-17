clc,clear,close all;
topsecretinfo=[3 4 5; 7 8 56; 3 2 2];
xlswrite('donotlook.xlsx',topsecretinfo);

% insert more data into a tab called 'kitties'
C=topsecretinfo*2;
xlswrite('donotlook.xlsx',C,'kitties');
% insert more data into a tab called 'puppies'
xlswrite('donotlook.xlsx',topsecretinfo*3,'puppies','D3');

%% 
clc,clear
whatever=xlsread('donotlook.xlsx');
morestuff=xlsread('donotlook.xlsx','kitties');
evenmorestuff=xlsread('donotlook.xlsx','puppies','D3:F5');