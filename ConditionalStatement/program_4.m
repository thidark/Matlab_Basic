clc 
clear 
grade=input('Enter your grade:','s'); 
grade=upper(grade); 
switch(grade ) 
    case 'A',disp('Outstanding'); 
    case 'B',disp('Very good'); 
    case 'C',disp('Good'); 
    case 'D',disp('Poor'); 
    case 'E',disp('You can fail'); 
    otherwise, disp('Wrong input'); 
end 