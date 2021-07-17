clc,clear
M=input('Enter marks : ');
if(M>100 || M<0)
    disp('Wrong Marks');
elseif(M<20)
    disp('Grade E');
elseif(M<40)
    disp('Grade D');
elseif(M<60)
    disp('Grade C');
elseif(M<80)
    disp('Grade B');
else
    disp('Grade A');    
end