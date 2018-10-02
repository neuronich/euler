month   = [31,28,31,30,31,30,31,31,30,31,30,31];
leap    = 0*month;
leap(2) = 1;
months = [];
for i = 1:100
    %if mod(i,4)==0 %&& ~(mod(i,100)==0 && ~mod(i,400)==0) % don't need it from 1901 to 2000
        months = [months month+leap*(mod(i,4)==0)];
end
days = cumsum([2 months(1:end-1)])
sum(mod(days,7)==0)