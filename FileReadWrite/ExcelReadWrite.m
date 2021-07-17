clc,clear,close all;
A=magic(3);
xlswrite('Test.xlsx',A);
pause(1);
B=xlsread('Test.xlsx');
C=B*2;
D=B*3;
xlswrite('Test1.xlsx',C,'newsheet');
xlswrite('Test2.xlsx',D,'newsheet','E1');