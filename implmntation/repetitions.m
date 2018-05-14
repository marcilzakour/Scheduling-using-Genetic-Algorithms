function [fitness] =  repetitions( chromosome ) 
global noStudents;
global noSubjects;
global values;

% [time,doctor,students,class,subj]
STUDENTS = 3;
SUBJ = 5;
% number of given subjects for each students set must be one
n = length(values);
used = zeros(noStudents,noSubjects);
fitness = 0;% will contain number of unnecessary assignments 
for i = 1:n
    if chromosome(i) == 1
       used(values{i}(STUDENTS),values{i}(SUBJ)) = used(values{i}(STUDENTS),values{i}(SUBJ)) + 1;
       if (used(values{i}(STUDENTS),values{i}(SUBJ)) > 1)
           fitness = fitness + 1;
           
       end;
    end;
end;

end