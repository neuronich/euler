function PlotCounts(counts,varargin)
if nargin==1
    figure
end
imagesc(counts)
set(gca,'XTick',1:size(counts,2))
set(gca,'XTickLabel',num2str([2:size(counts,2)+1]'))
daspect([1 1 1])