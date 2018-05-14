function addSubjectObjectAssignment(num,intensity,fid)
objects = getRandomAssignment(num,intensity);
n = length(objects);
fprintf(fid,'%d\n',n);
for i = 1:n
    fprintf(fid,'%d\n',objects(i));
end;
