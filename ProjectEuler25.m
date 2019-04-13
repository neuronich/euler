%Analytical formula
(1000+1/2*log10(5))/log10((sqrt(5)+1)/2)
(999+1/2*log10(5))/log10((sqrt(5)+1)/2) %THIS ONE!

% number itself
a = 1
b = 1
c = 0
for i = 3:4789
    c = b;
    b = b+a;
    a = c;
end
b
% Gives Inf

% Check with bruteforce
num = sym(4782);
fib300 = length(char(fibonacci(num)));

% I think he is sort'a lucky

% Not me writing

% Woo, looks like I took a very unique way.  My thought process: "If I can find a pattern in the way the number of digits increases in the Fib sequence, it'll be a cinch!"  So, I discovered that after the 216th number (which is 46 digits, so we need 954 more), there's a pattern that goes 5,5,5,5,4,5,5,5,5,4,5,5,5,4.  That means that after five numbers there is one more digit, after another five there is another digit, etc.  So, each of these sequences is 67 numbers, which is 14 digits, which means we need ~954/14.  This gives us 68.142857142857142857142857142857, which is an interesting number, as the fractional part is 1/7.  We deduce from this that 14/7 is 2, so we need an extra 2 digits, meaning 10 more Fib numbers.  In conclusion, 216 (the original start of the pattern) + 67*68 (68 groups of the pattern, each of which yields 67 digits) + 10 = 4782.
% Oh man, that was so much more fun than bruteforcing.  I got the numbers using Haskell, by the way :)
