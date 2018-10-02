a = 10^6
c = 0:9
for i = 9:-1:0
n = ceil(a/factorial(i))
a = a- (n-1)*factorial(i)
b(10-i) = c(n)
c(n) = []
end
char(b+'0')