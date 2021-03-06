function a = FindDivisors(n,varargin)


upperLimit = n;
if nargin>1
    upperLimit = varargin{1};
end

% brute force for now
a = [];
b = 1:upperLimit;
a = b(mod(n,b) == 0);

% New insight. FindDivisors can be much faster if we look at many numbers in a row.
% See solution of problem 21. Basically we go through every number and take multiplicative of it.

n = 10^4;
a = cell(1,n);
b = zeros(1,n);
for i = 1:n/2+1
    for j = 2*i:i:n
         a{j} = [a{j} i];
    end
end