function generateSample(noTimes,noDoctors,noStudents,noClasses,noSubjects,outputFileName)
check = dir(outputFileName);
if isempty(check)
    fid = fopen(outputFileName,'a');
    fprintf(fid,'%d\n',noTimes);
    addObjectAssignment(noDoctors,noTimes,fid);
    addObjectAssignment(noStudents,noTimes,fid);
    addObjectAssignment(noClasses,noTimes,fid);
    fprintf(fid,'%d\n',noSubjects);
    for subj = 1:noSubjects
        addSubjectAssignment(noDoctors,noStudents,noClasses,fid)
    end;
    fclose(fid);
else
    error('file existed before');
end;