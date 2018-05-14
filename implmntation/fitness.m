function fx = fitness(x)

BADFITNESS = inf;
% the fitness is mainly clculated as (number of matchings - number of conflicts) - 5*repetions - n^-1 * c - n-2*a
% where n is the total number of possible assignments
n = length(x);
c  = conflicts(x);
r = repetitions(x);
s = sum(x);
a = availability(x);
if s == 0, fx = BADFITNESS;
else
 fx = (s-c) - 5*r - (c/n) - a/(n*n) ;
 fx = -fx;
end
