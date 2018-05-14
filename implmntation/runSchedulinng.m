function [solution,chromosome,noConflicts,fitnessValue,noAssignments,assignmentEffeciency] = runSchedulinng(filename,noGenerations,fixRng)

global values;
global description
global tableAxis;
% read input from file
readInput(filename);
%  tableAxis = figure;
% set option for ga
options = gaoptimset('PopulationType','bitstring','Display','iter','UseParallel','never','Vectorized','off','PlotFcns',{@gaplotbestindiv,@myPlotFcn,@plotTable});
% if fixRng is true then fix the random number generation to recreate the same results every time
if nargin > 2
    if(fixRng == true), rng default;end;
end;
% add number of generations to the options (optional)
if nargin > 1
 options = gaoptimset(options,'Generations',noGenerations);
end;

n = length(values);
%run ga
[chromosome, fitnessValue] = ga(@(x)fitness(x),n,[],[],[],[],[],[],[],options);
%build the solution matrix which will contain which group of elements are matched together
noAssignments = sum(chromosome);
solution = cell(noAssignments+1,5);
for k = 1:5
    solution{1,k} = description{k};
end;

j = 2;
for i = 1:n
    if chromosome(i) == 1
        for k = 1:5
        solution{j,k} =  values{i}(k);
        end;
        j = j + 1;
    end;
end;
noConflicts = conflicts(chromosome);
%% TODO calculate Assignment Effeciency
assignmentEffeciency = 0;
%% TODO check if solution is surly not optimal
