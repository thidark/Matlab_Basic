A=10;
B=30;
sum=A+B; fprintf('Sum = %.2f \n',sum);
sub=A-B; fprintf('Sub = %.2f \n',sub);
multiply=A*B ; fprintf('Mult = %.2f \n',multiply);
array_mult=[10 10 10].*[2] ; disp(array_mult);
scalar_matrix_exp=A^B;  fprintf('Scalar Matrix Exponential = %.2f \n',scalar_matrix_exp);

array_expo=A.^B;  fprintf('Array Exponential = %.2f \n',array_expo);
left_div=A\B;  fprintf('Left Division = %.2f \n',left_div);
right_div=A/B;  fprintf('Right Division = %.2f \n',right_div);

D = ones(2,3);
E= [1 2 3; 4 5 6];
x = E.\D

y=E./D


colon=0:0.1:1

colon2=10:-2:0


parenthese=(1:7);
square=[1:7];


eye_test=eye(4,4)





