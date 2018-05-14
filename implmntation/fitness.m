function fx = fitness(x)
BADFITNESS = inf;
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
