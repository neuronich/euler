clean
a = [0,3,3,5,4,4,3,5,5,4,3,6,6,8,8,7,7,9,8,8]; %from 0 to 19
b = [0,6,6,5,5,5,7,6,6]; %double digits

for i = 1:999
    j = sprintf('%0.3d',i)-'0';
    %      three       hundred              and                      nineteen                         twenty              one
    k(i) = a(j(1)+1) + (j(1)>0)*7 + (j(1)>0 & sum(j(2:3))>0)*3 + (j(2)<2)*a(min(20,j(2)*10+j(3)+1)) + (j(2)>=2)*(b(max(1,j(2)))+a(j(3)+1));
end
k(1000) = length('onethousand');
sum(k)

for i = 1:1000
    kk(i) = sum( num2words(i)~=' ' & num2words(i)~='-');
end

sum(kk)

figure
hold on
plot(k)
plot(kk)