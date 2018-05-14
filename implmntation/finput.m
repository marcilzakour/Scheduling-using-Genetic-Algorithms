function x = finput(expr)
global inputArray;
global inputPointer;

x = inputArray(inputPointer);
inputPointer = inputPointer + 1;
fprintf('%s %d\n',expr,x);