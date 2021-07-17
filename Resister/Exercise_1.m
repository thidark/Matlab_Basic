r1=100;
r2=100;
r3=100;
r4=100;
series=CalculateSeries(r1,r2,r3,r4);

parallel=CalculateParallel(r1,r2,r3,r4);

fprintf('Serieis RT= %d \n Parallel RT= %.2f \n',series,parallel)