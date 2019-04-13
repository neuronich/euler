clean
global pairs triplets
pairs = [...
    %          2 5;...
    %          3 8;...
    %          4 7;...
    %          6 9;...
    %          10 31;...
    %          11 16;...
    %          12 15;...
    %          13 18;...
    %          14 17;...
    %          20 23;...
    ]-1;

% triplets = [...
%             2 3 4;...
% %             2 6 10;...
% %             2 11 12;...
% %             2 13 14;...
% %             2 19 20;...
% %             3 6 11;...
% %             3 10 12;...
% %             3 14 19;...
% %             3 13 20;...
% %             4 6 12;...
% %             4 10 11;...
% %             4 13 19;...
% %             4 14 20;...
% %             6 13 21;...
% %             6 14 22;...
%             ]-1;

triplets = [...
    2 3 4;...
    2 5 6;...
    %             2 7 8;...
    3 5 7;...
    %             3 6 8;...
    %             4 5 8;...
    ]-1;

k = 3;
k = 4;
%% The new rewriting with arbitrary k and based on partitions function from internet.
% clear all

p = 10;
k = 3;
c1 = PartitionFunction(p,k);
% s2 = PartitionFunction(p+13,k);


% PlotCounts(c1)
% s1 = CountsToSets(c1)
% c1 = SetsToCounts(s1)
% PlotCounts(c1)

c = PartitionMany([10,13],k);
% PlotCounts(c)
c = RemoveWinnablesK3(c);
PlotCounts(c)

%%
% c = PartitionMany([2,11,12],k);
% c = PartitionMany([3,6,12],k);
% c = PartitionMany([4,6,11],k);

% c = PartitionMany([10,31],k);% HOORAY
% c = PartitionMany([19,24],k);
% {[3,13,24];[6,13,24];[4,14,24]}

c = PartitionMany([21,26],k);

%  c = PartitionMany([6,14,22],k);

% c = PartitionMany([11,13,14],k);
% c = PartitionMany([4,10,13],k);


c = RemoveWinnablesK3(c)
PlotCounts(c)
CountsToSets(c)
%% k = 4 study
k = 6;
c = PartitionMany([3,17,19],k);
figure
subplot(121)
PlotCounts(c,1)

c = CullTriplets(c,0);
c = RemoveWinnablesK4(c);

subplot(122)
PlotCounts(c,1)
%% Uncover all triplets for k = 4
clean
global pairs triplets
triplets = [];
toCheckTr = [];
k = 4;
n = 15;
for i1 = 1:n
    for i2 = i1+1:n
        for i3 = i2+1:n
            toCheckTr = [toCheckTr; [i1 i2 i3]];
        end
    end
end
[~,ind] = sort(max(toCheckTr,[],2));
toCheckTr = toCheckTr(ind,:);

tic
while size(toCheckTr,1)>0
    toCheckNew = [];
    for i = 1:size(toCheckTr,1)
        c = PartitionMany(toCheckTr(i,:),k);
        
        c = RemoveWinnablesK4(c);
%         c = CullTriplets(c,0);
        if isempty(c)
            triplets = [triplets;toCheckTr(i,:)-1];
        elseif ~(sum(sum(c,2)==0)>0)
            toCheckNew = [toCheckNew; toCheckTr(i,:)];
        end
    end
    toCheckTr = toCheckNew;
    disp(size(toCheckTr,1))
end
toc
triplets2 = triplets+1;

%% Uncover all triplets and pairs for k = 3
clean
global pairs triplets
pairs = [];
triplets = [];
toCheckTr = [];
toCheckP = [];
k = 3;
n = 10;
for i1 = 2:n
    for i2 = i1+1:n
        toCheckP = [toCheckP; [i1 i2]];
        for i3 = i2+1:n
            toCheckTr = [toCheckTr; [i1 i2 i3]];
        end
    end
end
[~,ind] = sort(max(toCheckP,[],2));
toCheckP = toCheckP(ind,:);
[~,ind] = sort(max(toCheckTr,[],2));
toCheckTr = toCheckTr(ind,:);


tic
while size(toCheckTr,1)+size(toCheckP,1)>0
        toCheckNewP = [];
    for i = 1:size(toCheckP,1)
        c = PartitionMany(toCheckP(i,:),k);
        c = RemoveWinnablesK3(c);
        if isempty(c)
            pairs = [pairs;toCheckP(i,:)-1];
        elseif ~(sum(sum(c,2)==0)>0)
            toCheckNewP = [toCheckNewP; toCheckP(i,:)];
        end
    end
    toCheckP = toCheckNewP;
    
    
    toCheckNew = [];
    for i = 1:size(toCheckTr,1)
        c = PartitionMany(toCheckTr(i,:),k);
        c = RemoveWinnablesK3(c);
        if isempty(c)
            triplets = [triplets;toCheckTr(i,:)-1];
        elseif ~(sum(sum(c,2)==0)>0)
            toCheckNew = [toCheckNew; toCheckTr(i,:)];
        end
    end
    toCheckTr = toCheckNew;
    disp(size(toCheckTr,1))
    disp(size(toCheckP,1))
    disp('')

end
toc
triplets2 = triplets+1;
pairs2 = pairs+1;
%%
clean 
load('triplets4s')
t1 = triplets
load('triplets5s')
t2 = triplets
load('triplets6s')
t3 = triplets


figure
imagesc([t1 t2 t3])

clean 
load('triplets4')
t1 = triplets
figure
scatter3(t1(:,1),t1(:,2),t1(:,3))
%%
c = PartitionMany([2 4 5],k);
PlotCounts(c)
c = CullTriplets(c,0)
PlotCounts(c)
%             c = RemoveWinnablesK4(c)
%%
figure;
plot(pairs(:,1)+1,pairs(:,2)+1,'.','MarkerSize',50)
%%
k = 3
figure
for i = 4:20
    a = PartitionMany([i],k);
    subplot(5,4,i)
    PlotCounts(a,1)
end

%% Two possible projects:
% 1.To understand the general function for generating the doubles and the triples.
% 2.To actually start counting the families of the losable groups.

%% 2a. Calculate the number of partitions of number N.
% We need to have a dp structure. dp(n,k) n - total stones, k-piles. We iterate them by n.
% That's how it doesn't work, because some solutions are identical and stick together.
% n = 6;
% dp = zeros(n);
% dp(1,1) = 1;
% for i = 2:n
%     dp(i,:) = dp(i-1,:)+MyShift(dp(i-1,:),1);
% end
% dp
% sum(dp,2)

% dp(k,t) - how many piles of size t on each iteration.
n = 6;
dp = zeros(n);
dp(1,1) = n; % six piles of length one.
for i = 2:n
    dp(
end

% I need to write down