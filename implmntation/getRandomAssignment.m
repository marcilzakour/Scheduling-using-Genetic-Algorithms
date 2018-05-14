function arr = getRandomTimeAssignment(noTimes,intensity)
if nargin < 2
    intensity = 0.5;
end;
arr = find( (rand(1,noTimes) <= intensity) == 1);

if isempty(arr)
    arr = randi(noTimes);
end;