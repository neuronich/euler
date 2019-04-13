% Hindsight. People actually enumerated not the difference but the sum. Which is techically not correct.
% Because the number was small, they could catch it. But no-no.

clean
n = 1:3000;
a = n.*(3*n-1)/2;
% Reverse which we are looking for to order correctly.

for i = 1:length(a)
    for j = (i+1):length(a)
        if ismember((a(i)+a(j))/2,a) && ismember((-a(i)+a(j))/2,a)
            a(i)
            return 
        end
    end
    
    if mod(i,10^2)==0
        disp(i)
    end
end