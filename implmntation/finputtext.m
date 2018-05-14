function x = finputtext(expr)
global cellinputArray;
global inputPointer;

x = cellinputArray{1}{inputPointer};
inputPointer = inputPointer + 1;
fprintf('%s %s\n',expr,x);
