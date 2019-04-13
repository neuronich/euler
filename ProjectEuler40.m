n = 300000;
a = [];
for i = 1:n
    a = [a,num2str(i)];
end
length(a)

b = 1;
for k = 0:6
   b = b*str2num(a(10^k))
end
