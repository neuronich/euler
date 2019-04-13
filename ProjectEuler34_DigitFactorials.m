% http://mathworld.wolfram.com/Factorion.html


clean
tic
n = 1000000;
a = zeros(1,n);
look = factorial(0:9);

for i = 1:n
    dig = str2num( num2str(i)')';
    a(i) = sum(look(dig+1))-i;
    
    if mod(i,10^4)==0
        disp(i)
    end
end
toc
figure
hold on
plot([1,n],[0,0])
plot(a)

find(a==0)

disp('answer')
sum(find(a==0))-1


% find(a(n:end)==0)
% 
% disp('answer')
% sum(find(a(n:end)==0))-1

%  145       40585