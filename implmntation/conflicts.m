function [ fitness ] = conflicts( chromosome )
global noDoctors;
global noClasses;
global noStudents;
global noSubjects;
global noTimes
global values;
% [time,doctor,students,class,subj]
TIME = 1;
fitness = 0;
lim = 4;
n = length(values);
used = [];
% used = zeros(5,noTimes,100);
for i = 1:n
        for j = 2:lim
             used(values{i}(TIME),values{i}(j),j) = 0;
        end;
end;

for i = 1:n
    if chromosome(i) == 1
        for j = 2:lim
            if used(values{i}(TIME),values{i}(j),j) == 1
                fitness = fitness + 1;
            else used(values{i}(TIME),values{i}(j),j) = 1;
            end;
        end;
    end;
end;
end

