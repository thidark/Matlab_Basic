clc, clear,close all;
fid=fopen('Marknew.txt','r');
M=fscanf(fid,'%d',[3 Inf]);
disp(M);
M=M';
disp(M);
MM=M*2;
fid1=fopen('Marknew1.txt','w');
fprintf(fid1,'%5d %5d %5d \n',MM);