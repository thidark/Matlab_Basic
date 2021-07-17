clc
clear
M=input('Enter mark: ');
if(M<0 || M>100)
    disp('invalid Mark');
elseif(M<20);
    disp('Grade E');
elseif(M<40);
    disp('Grade D');
elseif(M<60);
    disp('Grade C');
elseif(M<80);
    disp('Grade B');
else 
    disp('Grade A');
end