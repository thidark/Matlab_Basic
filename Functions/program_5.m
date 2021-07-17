clc
clear
c=MenuFun();
if(c>4 || c<=0)
    disp('Wring choice: ');
else
   [n1,n2]=TwoNoInput() ;
   R=Calculate(c,n1,n2)
   ShowResult(R);
end
