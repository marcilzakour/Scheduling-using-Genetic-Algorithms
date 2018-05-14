function addSubjectAssignment(noDoctors,noStudents,noClasses,fid)
% for subject subj generate random doctors,students and classes
addSubjectObjectAssignment(noDoctors,0.3,fid);
addSubjectObjectAssignment(noStudents,0.3,fid);
addSubjectObjectAssignment(noClasses,0.7,fid);
