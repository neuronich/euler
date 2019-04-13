n = 1000000;
x = 0;
while n>1
    x = x + n/2*(n/2-1)/2;
    n=n/2;
end
mod(round(x),10^9+7)