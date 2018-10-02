tic
kfac = sym('k!');
syms k;
num = subs(kfac,k,100)
toc

tic
kfac = sym('gamma(k+1)');
syms k;
num = subs(kfac,k,100)
toc

sum(str2num(char(num)'))