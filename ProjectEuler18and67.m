%% Read file
f = fopen('ProjectEuler67Data.txt','r');
newline = 0;
i = 0;
while newline ~= -1
    newline = fgetl(f);
    i = i + 1;
    if newline>0
        a(i,1:i) = str2num(newline);
    end
end

%%
for i = size(a,1):-1:1
    for j = 1:i-1
        a(i-1,j) = a(i-1,j) + max(a(i,j:j+1));
    end
end