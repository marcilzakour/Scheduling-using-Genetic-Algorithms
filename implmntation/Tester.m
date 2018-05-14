N = 1;
ex = zeros(1,N);
pars = zeros(N,5);
vol = zeros(1,N);
i = 1
%for i = 1:N
    pars(i,:,:) = randi(10,1,5);
    vol(i) = 1;
    for j = 1:5, vol(i) = vol(i) * pars(i,j);end;
    generateSample(pars(1),pars(2),pars(3),pars(4),pars(5),sprintf('random generated case 4'));
    tic();
    [solution,chromosome,noConflicts,fitnessValue,noAssignments,assignmentEffeciency] = runSchedulinng(sprintf('random generated case 4'));
    ex(i) = toc();
    grid on;
    figure;
    bar(chromosome);
    fitnessValue
%end;
