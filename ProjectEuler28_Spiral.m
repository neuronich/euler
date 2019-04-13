
%  n^2-n .... n^2
%  ...
%  n^2-2n ... n^2-3n

clean
% This describes the the diagonals.
m = 0
for n = 1:2:1001
m = m+sum([n^2, n^2-n+1, n^2-2*n+2, n^2-3*n+3]);
end
m = m-3 % Subtract the first square

% I still want to make the full spiral square.
