tic
a = 1;
n = 1000;
for i = 1:n
    a = [mod(2*a,10) 0]+[0 a>4];
    if a(end)==0 
        a(end) = [];
    end
end
a
sum(a)
toc