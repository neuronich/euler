A = sym('A', [1 9])
f(A) = 0
for i = 1:9
    f = f*100 + i*10 + A(i);
end
f = f*10;
%%
B = sym('B',[1 9])
B(9) = 0
f2 = f
f2(B) = 0
for i = 1:9
    f2 = f2*10+B(i);
end
f2 = f2^2

for i = 1:9
simplify(mod(expand(f2)/10^(i-1),10))
end