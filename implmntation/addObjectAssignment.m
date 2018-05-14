function addObjectAssignment(noObject,noTimes,fid)

fprintf(fid,'%d\n',noObject);
for d = 1:noObject
    dtimes = getRandomAssignment(noTimes);
    noSlots = length(dtimes);
    fprintf(fid,'%d\n',noSlots);
    for i = 1:noSlots
        fprintf(fid,'%d\n',dtimes(i));
    end;
end;