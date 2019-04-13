%%
% k = 4; % divisions
% m = 2; % initial piles
% l = 10; % biggest pile
%%
% Generate all possible ways to go from a certain number with certain k
% p = 200;
% sets = [];
% c = 0;
% for i1 = 0:p
%     for i2 = i1:p
%         c = c+1;
%         sets   = [sets;[i1-0, i2-i1, p-i2]];
%         pp{c}    = num2str(sort([i1-0, i2-i1, p-i2],'ascend'));
%     end
% end
% 
% % find unique sets
% [pp,ind] = unique(pp);
% sets=sets(ind,end:-1:1)
% 
% % turn sets into cell array
% sets = arrayfun(@(x) sets(x,:),1:size(sets,1),'uni',0);
% % remove meaningless elements
% toDelete = [];
% for i = 1:length(sets)
%     gr = sets{i};
%     gr(gr==p | gr<2)=[];
%     toDelete(i) = isempty(gr);
%     sets{i} = gr;
% end
% sets(toDelete==1)=[];
% cellfun(@(x) num2str(x),sets,'uni',0)
% 
% % remove symmetricals
% toDelete = [];
% for i = 1:length(sets)
%     gr = sets{i};
%     a = tabulate(gr);
%     gr = a(mod(a(:,2),2)==1,1)';
%     toDelete(i) = isempty(gr);
%     sets{i} = gr;
% end
% sets(toDelete==1)=[];
% 
% 
% [~,ind] = unique(cellfun(@(x) sort(num2str(x)),sets,'uni',0));
% sets=sets(ind)
% 
% 
% % write out all elements
% cellfun(@(x) num2str(x),sets,'uni',0)