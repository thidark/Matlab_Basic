clc
clear
disp('1.ADD');
disp('2.SUBSTRACT');
disp('3.MULTIPLY');
disp('4.DIVIDE');
%fprintf(' 1.ADD \n2.SUBSTRACT \n3.MULTIPLY \n4.DIVIDE\n');
c=input('Enter your choice');
if(c>4 || c<=0)
    disp('Wring choice: ');
else
    n1=input('Enter first no: ');
    n2=input('Enter second no: ');
    switch(c)
        case 1,R=n1+n2;
        case 2,R=n1-n2;
        case 3,R=n1*n2;
        case 4,R=n1/n2;
    end
    st=sprintf('Result = %6.2f',R);
    disp(st);
end
