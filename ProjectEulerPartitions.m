clean
%%
% k = 4; % divisions
% m = 2; % initial piles
% l = 10; % biggest pile
%%
% Generate all possible ways to go from a certain number with certain k
p = 200;
sets = [];
c = 0;
for i1 = 0:p
    for i2 = i1:p
        c = c+1;
        sets   = [sets;[i1-0, i2-i1, p-i2]];
        pp{c}    = num2str(sort([i1-0, i2-i1, p-i2],'ascend'));
    end
end

% find unique sets
[pp,ind] = unique(pp);
sets=sets(ind,end:-1:1)

% turn sets into cell array
sets = arrayfun(@(x) sets(x,:),1:size(sets,1),'uni',0);
% remove meaningless elements
toDelete = [];
for i = 1:length(sets)
    gr = sets{i};
    gr(gr==p | gr<2)=[];
    toDelete(i) = isempty(gr);
    sets{i} = gr;
end
sets(toDelete==1)=[];
cellfun(@(x) num2str(x),sets,'uni',0)

% remove symmetricals
toDelete = [];
for i = 1:length(sets)
    gr = sets{i};
    a = tabulate(gr);
    gr = a(mod(a(:,2),2)==1,1)';
    toDelete(i) = isempty(gr);
    sets{i} = gr;
end
sets(toDelete==1)=[];


[~,ind] = unique(cellfun(@(x) sort(num2str(x)),sets,'uni',0));
sets=sets(ind)


% write out all elements
cellfun(@(x) num2str(x),sets,'uni',0)
%% The new rewriting with arbitrary k and based on partitions function from internet.
clear all

p = 10;
k = 3;
sets = partitions(p,1:k);
sets = cumsum(sets','reverse')';                 % transpose representation gives you simply all piles
for i = 1:size(sets,1)                          % encode things in sparse code
    setsT(i,:) = histcounts(sets(i,:),1:p+1);   % beats me why it is p+1, but has to be
end

setsT(:,end) = [];
setsT(1,:) = [];                                % remove no splitting. i.e first element.
setsT(:,1) = [];                                % remove ones. After this everything goes from 2:p-1
% setsT(sum(setsT,2)==0,:) = [];                % remove zero rows. NO. You can't do that! zeros means it's losable!

setsT = mod(setsT,2);                           % remove symmetries
[~,ind] = unique(setsT*2.^(1:size(setsT,2))');  % remove not unique.
setsT=setsT(ind,:);

pairs = [2 5; 3 8; 4 7; 6 9];                   % reduce fundamental pairs
setsT(:,pairs(:,1)-1) = setsT(:,pairs(:,2)-1) + setsT(:,pairs(:,1)-1);
setsT(:,pairs(:,2)-1) = 0;

setsT = mod(setsT,2);                           % remove symmetries
[~,ind] = unique(setsT*2.^(1:size(setsT,2))');  % remove not unique.
setsT=setsT(ind,:);

for i = 1:size(setsT,2)
    finals{i} = find(setsT(i,:))+1;
end
