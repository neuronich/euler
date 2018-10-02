%% Read file into a single line. 
f = fopen('ProjectEuler22Data.txt','r');
a = fgetl(f);
a(a=='"')=[]; 
a = strsplit(a,',');
a = sort(a);
b = 0;
for i = 1:length(a)
    b(i) = sum(a{i}-'A'+1);
end
sum(b.*(1:length(b)))