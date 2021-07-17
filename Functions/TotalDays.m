function td=TotalDays(dd)

y = dd(3); 
m = dd(2); 
d = dd(1); 
 
l=1;
if(mod(y,4)) 
    l=0; 
end 
td=d; 
for(ii=l:m-1) 
    switch(ii) 
        case 1,td=td+31; 
        case 2,td=td+28+l; 
        case 3,td=td+31; 
        case 4,td=td+30; 
        case 5,td=td+31; 
        case 6,td=td+30; 
        case 7,td=td+31; 
        case 8,td=td+31; 
        case 9,td=td+30; 
        case 10,td=td+31; 
        case 11,td=td+30; 
     
    end 
end 

end
