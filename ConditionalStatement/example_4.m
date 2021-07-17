clc
clear
grade=input('Enter your grade: ','s');
grade=upper(grade);
if(grade=='A')
    disp('Outstanding');
elseif(grade=='B')
    disp('very good');
elseif(grade=='C')
    disp('Good');
elseif(grade=='D')
    disp('Poor');
elseif(grade=='E')
    disp('You can fail');
else
    disp('Wrong input');
end