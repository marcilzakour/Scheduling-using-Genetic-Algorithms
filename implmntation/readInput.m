function readInput(fileName)
%% global variables that are used in the problem
global noDoctors;    %# doctors
global noClasses;    %# classes
global noStudents;   %# students
global noSubjects;   %# subjects
global noTimes;      %# times
global DTimes;       % array contains sutalble times for each doctor
global CTimes;       % array contains sutalble times for each class
global STimes;       % array contains sutalble times for each students set
global DSubj;        % array contains doctors are teaching subject (i)
global SSubj;        % array contains students sets are learning subject (i)
global CSubj;        % array contains classes that are learning subject (i)
global values;       % contains description of each bit in bitstring chromosome 
global inputArray    % array contains input file as integers
global inputPointer  % next integer index in inputArray
global description   % description of each tuple
global doctorsNames  % name of each doctor
global studentSetsNames % name of each student set
global classesNames  % name of each class
global subjectNames  % name of each subject
global cellinputArray% cell array contains input file names
%% this part initialize global variables
description = {'Time slot' 'Doctor' 'Students set' 'Class' 'Subject'};
fid = fopen(sprintf('%s.txt',fileName));
inputArray = fscanf(fid,'%d');
fclose(fid);
inputPointer = 1;
noTimes = finput('enter number of time slots:');
noDoctors = finput('enter number of doctors:');
for d = 1:noDoctors
    n = finput(sprintf('enter number of time slots for doctor %d:',d));
    for i = 1:n , DTimes{d}(i) = finput(sprintf('enter time slot %d for doctor %d:',i,d));end;
end;

noStudents = finput('enter number of students sets:');
for s = 1:noStudents
    n = finput(sprintf('enter number of time slots for students set %d:',s));
    for i = 1:n, STimes{s}(i) = finput(sprintf('enter time slot %d for students set %d:',i,s));end;
end;

noClasses = finput('enter number of classes:');
for c = 1:noClasses
    n = finput(sprintf('enter number of time slots for class %d:',c));
    for i = 1:n, CTimes{c}(i) = finput(sprintf('enter time slot %d for class %d:',i,c));end;
end;

noSubjects = finput('enter number of subjects:');
for subj = 1:noSubjects
    n = finput(sprintf('enter number of doctors who teaches subject %d:',subj));
    for i = 1:n, DSubj{subj}(i) = finput(sprintf('enter doctor %d who teaches subject %d:',i,subj));end;
    
    n = finput(sprintf('enter number of students sets that learn subject %d:',subj));
    for i = 1:n, SSubj{subj}(i) = finput(sprintf('enter students set %d that learns subject %d:',i,subj));end;
    
    n = finput(sprintf('enter number of classes  that is sutable for subject %d:',subj));
    for i = 1:n, CSubj{subj}(i) = finput(sprintf('enter classses  %d that are sutable for subject %d:',i,subj));end;
end;


%% this part is to create values array that describes chromosome
values  ={};
counter = 0;
for subj =  1:noSubjects
    DSZ = length(DSubj{subj});
    SSZ = length(SSubj{subj});
    CSZ = length(CSubj{subj});
    
    for d = 1:DSZ
        doctor = DSubj{subj}(d);
        for s = 1:SSZ
            students = SSubj{subj}(s);
            for c = 1:CSZ
                class = CSubj{subj}(c);
                T = intersect(DTimes{doctor},intersect(STimes{students},CTimes{class}));
                TSZ = length(T);
                for t = 1:TSZ
                    time = T(t);
                    counter = counter + 1;
                    values{counter,1} = [time,doctor,students,class,subj];
                end;
            end;
        end;
    end;
end;
%% read the names of doctors,classes,subjects and studentSets
fid = fopen(sprintf('%s_Names.txt',fileName));
cellinputArray = textscan(fid,'%s');
inputPointer = 1;
doctorsNames = cell(1,noDoctors);
for i = 1:noDoctors
    doctorsNames{i} = finputtext(sprintf('enter doctor %d name:',i));
end;

studentSetsNames = cell(1,noStudents);
for i = 1:noStudents
    studentSetsNames{i} = finputtext(sprintf('enter student set %d name:',i));
end;

classesNames = cell(1,noClasses);
for i = 1:noClasses
    classesNames{i} = finputtext(sprintf('enter class %d name:',i));
end;


subjectNames = cell(1,noSubjects);
for i = 1:noSubjects
    subjectNames{i} = finputtext(sprintf('enter subject %d name:',i));
end;


fclose(fid);