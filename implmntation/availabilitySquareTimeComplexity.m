function fitness = availabilitySquareTimeComplexity(chromosome)


fitness = 0;
conf = conflicts(chromosome);
n = length(chromosome);
for i = 1:n
    if chromosome(i) == 0
        chromosome(i) = 1;
        c2 = conflicts(chromosome); 
        if (c2 > conf )
            fitness = fitness + c2-conf;
        end;
        chromosome(i) = 0;
    end;
end;



