function [fitness] = availability(chromosome)
% [time,doctor,students,class,subj]
global noDoctors;
global noClasses;
global noStudents;
global noSubjects;
global noTimes
global values;
% [time,doctor,students,class,subj]
TIME = 1;
fitness = 0;
% 0001010010
% 2021010012
c = conflicts(chromosome);
n = length(chromosome);
used = [];

for i = 1:n
        for j = 2:4
             used(values{i}(TIME),values{i}(j),j) = 0;
        end;
end;

for i = 1:n
    if chromosome(i) == 1
        for j = 2:4
            used(values{i}(TIME),values{i}(j),j) = 1;
        end;
    end;
end;

for i = 1:n
    if chromosome(i) == 0
        for j = 2:4
            if used(values{i}(TIME),values{i}(j),j) == 1, fitness = fitness+1;end;
        end;
    end;
end