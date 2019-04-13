clean
tic
n = 900000;
a = zeros(1,n);
for i = 1:n
    dig = str2num( num2str(i)')';
    a(i) = sum(dig.^5)-i;
    
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