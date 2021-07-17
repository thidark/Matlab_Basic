yn='y';
while(yn=='y')
    M=input('Enter your mark: ');
    if(M>=50)
        disp('Pass');
    else
        disp('Fail');
    end
    disp('----------------');
    %yn=input('do you want to continue? yes=1, no=0 ');
    yn=input('do you want to continue? yes=y, no=n ','s');
    yn=lower(yn);
end

disp('Bye Bye');