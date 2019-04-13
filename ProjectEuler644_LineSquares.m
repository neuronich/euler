clean 
LoadShortFunctions
w = 1+sqrt(2);
x = 0:0.05:20;
nmax = floor(x);    % max amount of squares that can be placed
nmin = ceil((x-1)/w);  % min amount of squares that can be placed

cp = x(find(diff(nmax-nmin)~=0)+1);
% first two change points are an artifact.

figureFull
subplot(211)
hold on
plot(x,nmin)
plot(x,nmax)
subplot(212)
hold on
plot(x,nmax-nmin)
set(gca,'XTick',cp)
for i = cp
    sf.VerticalDash(i)
end
% set(gca,