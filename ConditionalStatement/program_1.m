clc 
clear 
%M1=input('Enter English mark:'); 
%M2=input('Enter Math mark:'); 
%M3=input('Enter Science mark:'); 

M=input('Enter 3 exam marks: '); %[50 60 70]
M1=M(1);
M2=M(2);
M3=M(3);

if(M1<50 || M2<50 || M3<50) 
    disp('Fail'); 
    disp('Try again'); 
else 
    disp('Pass'); 
    disp('Congrats'); 
end 
disp('Thank you'); 