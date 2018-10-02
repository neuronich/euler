% tic
% a = 9;
% b = 9;
% c = 9;
% foundSolution = 0;
% k = 0;
% while ~foundSolution
%     k = k+1;
%     c = c-1;
%     if c == -1
%         b = b-1;
%         c = 9;
%         if b == -1
%             a = a-1;
%             b = 9;
%         end
%     end
%     num = (10^5+1)*a+(10^4+10)*b+(10^3+10^2)*c;
%     factors = factor(num/11);
%     factors = [11 factors];
%     if max(factors)<999
%         % This subroutine downloaded from the internet gives all possible
%         % multiplications of all factors
%         A = factors;
%         n =  size(A, 2);
%         B = A(:, reshape(ones(n, 1) * (1:n), 1, n^2)) .* repmat(A, 1, n);
%         Soln = [A, B(:, logical(reshape(tril(toeplitz(ones(n, 1))), 1, n^2)'))];
%         %
%         if sum(Soln<999 & Soln>sqrt(num))
% %             disp([num factors])
%             foundSolution = 1;
%         end
%     end
% end
% toc

tic
a = 9;
b = 9;
c = 9;
d = 9;
foundSolution = 0;
k = 0;
while ~foundSolution
    k = k+1;
    d = d-1;
    if d == -1
        c = c-1;
        d = 9;
        if c == -1
            b = b-1;
            c = 9;
            if b == -1
                a = a-1;
                b = 9;
            end
        end
    end
    
    num = (10^7+1)*a+(10^6+10)*b+(10^5+10^2)*c+(10^4+10^3)*d;
    factors = factor(num/11);
    factors = [11 factors];
    if max(factors)<9999
        % This subroutine downloaded from the internet gives all possible
        % multiplications of all factors
        A = factors;
        n =  size(A, 2);
        B = A(:, reshape(ones(n, 1) * (1:n), 1, n^2)) .* repmat(A, 1, n);
        Soln = [A, B(:, logical(reshape(tril(toeplitz(ones(n, 1))), 1, n^2)'))];
        %
        if sum(Soln<9999 & Soln>sqrt(num))
                 %       disp([num factors])
            foundSolution = 1;
        end
    end
end
toc