n = 100;
a = zeros(1,n);
for i = 1:n
    a(factor(i)) = a(factor(i)) + 1;
end
a(2) = a(2)-a(5);
a(5) = 0;