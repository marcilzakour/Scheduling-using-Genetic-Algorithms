function data = chromosomeToTableData(chromosome)
global noTimes;
global noStudents;
global values;
global doctor
global doctorsNames  % name of each doctor
global studentSetsNames % name of each student set
global classesNames  % name of each class
global subjectNames  % name of each subject
%[time,doctor,students,class,subj]
lim = 4;
TIME = 1;
DOCTOR = 2;
STUDENTS = 3;
CLASS = 4;
SUBJ = 5;
colortable = @(color,e1,e2,e3) ['<html><table border=1 width=400 bgcolor=',color,'><TR><TD width = 100>',e1,'</TD><TD  width = 100>',e2,'</TD><TD  width = 100>',e3,'</TD></TR> </table></html>'];

 data = cell(noTimes,noStudents);
 for i = 1:noTimes
     for j = 1:noStudents
        data{i,j} = colortable('white',' ',' ',' ');
     end;
 end;
 
n = length(chromosome);
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
            used(values{i}(TIME),values{i}(j),j) = used(values{i}(TIME),values{i}(j),j)+1;
        end;
    end;
end;


for i = 1:n
        t = values{i}(TIME);
        s = values{i}(STUDENTS);
        if chromosome(i) == 1 
%         data{t,3*(s-1)+1} = colorgen('red',doctorsNames{ values{i}(DOCTOR) });
%         data{t,3*(s-1)+2} = subjectNames{ values{i}(SUBJ) };
%         data{t,3*(s-1)+3} = classesNames{ values{i}(CLASS) };
            c = 'AAFFAA';
             for j = 2:4
                if used(values{i}(TIME),values{i}(j),j) > 1
                 c = '#FFAAAA';
                end;
             end;
           data{t,s} = colortable(c,doctorsNames{ values{i}(DOCTOR) },subjectNames{ values{i}(SUBJ) },classesNames{ values{i}(CLASS) });
        end;
end;