% Wise people riddle. They can't talk to each other. The one who says the lower natural number wins.
% What do they do? What chances of winning? Everyone is supersmart.

% Last probabilities
a = [1,4];

for i = 1:30
    anew = (sqrt(a(end)) +sqrt(a(end)-a(end-1)))^2;
    a = [a anew];
end
a