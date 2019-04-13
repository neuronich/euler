% I wish I had hash tables!!!

% Triangle	 	Tn=n(n+1)/2	 	1, 3, 6, 10, 15, ...
% Pentagonal	 	Pn=n(3n?1)/2	 	1, 5, 12, 22, 35, ...
% Hexagonal	 	Hn=n(2n?1)	 	1, 6, 15, 28, 45, ...
n = 1:100000;
a = n.*(n+1)/2;
b = n.*(3*n-1)/2;
c = n.*(2*n-1);

for i = 1:length(c)
    if ismember(c(i),b)
        if ismember(c(i),a)
            disp(c(i))
%             return
        end
    end
end
  

% Diophantine equations, oh my!
% 
% Dario Alpern's solver http://www.alpertron.com.ar/QUAD.HTM
% to the rescue!
% 
% A number that is the m'th pentagonal number and the n'th hexagonal number must satisfy
% 
%     n(3n-1)/2 == m(2m-1)
% 
% Rendering this as a Diophantine equation with integer coefficients gives:
% 
%     3n**2 - 4m**2 - n + 2m = 0
% 
% Running the solver gives that the recurrence is
% 
%    m_{i+1} = 97 * m_i + 112 * n_i - 44
%    n_{i_1} = 84 * m_i +  97 * n_i - 48
% 
% Starting from m=1, n=1 and running the recurrence gives
% the series of pentagonal-hexagonal numbers:
% 
% 1
% 40755
% 1533776805 <- the solution to the problem
% 57722156241751
% 2172315626468283465
% ... and so on ...
% 
% Total computer time less than a millisecond.
% 
% proc doit {N} {
%     set x [expr wide(1)]
%     set y [expr wide(1)]
%     for { set i 0 } {i<N } { incr i } {
%         foreach { x y } [list \
%             [expr { 97 * x+112?y - 44 }] \
%             [expr { 84 * x+97?y - 38 }]] break
%     }
%     return [expr {x?(3?x-1)/2}]
% }
% puts [time { puts [doit 2] }]