% Original brute force
tic
for i = 1:1000000
    k = i;
    c = 0;
    while k ~=1
        c = c+1;
        if mod(k,2)==0
            k = k/2;
        else
            k = 3*k+1;
        end
    end
    cc(i) = c;
end
[~,ind] = max(cc)
toc

% Good solution that stores intermediate values
tic
for i = 1:1000000
    k = i;
    c = 0;
    while k ~=1
        c = c+1;
        if k<i
            c = c+cc(k);
            break
        end
        if mod(k,2)==0
            k = k/2;
        else
            k = 3*k+1;
        end
    end
    cc(i) = c;
end
[~,ind] = max(cc)
toc

% COMMENT 1
% Rather than post the same code, I'm going to elaborate on how to make this more efficient.
% For this specific problem, the time to follow a single chain starting at n is O(log(n)) (or something similar; it's not exact because of the formula).  Following this for all possibilities results in a O(n*log(n)) running time.
% This can be improved drastically by using memoization.  We make a table (array, hash, whatever) that holds the lengths already calculated for any starting position.  Initially these are unknown (set them to 0 or something).  Then we start our recursive function at each n.  If the number is known, we just return it's length, if not, we recurse, but when we return we save the value.  By doing this, you are guaranteed to only calculate every value once, resulting in O(n).  Of course, this can use a lot of memory.
% An important thing to note here is that we haven't discussed the time it takes to check our table.  In doing so, we have assumed that this access time is O(1).  This works if we use an array, but an array uses a lot of memory.  By using a hash table or a heap we could potentially reduce the memory (there are probably many numbers over 1 million which are never checked), but we are stuck with O(log(n)) access times, which means we again have an O(n*log(n)) algorithm.
% Of course, I've only estimated that this function makes chains of O(log(n)) length.  AFAIK the actual chain lengths can't be proven mathematically (because it's a piecewise function).  From experiments, it seems to me that the chain length is worse than O(log(n)) and the hash table works better.

% COMMENT 2
%i simply made an array in range 1..10^6, and everytime when I got a new number while applying the function (3*n+1 or n/2) I signed the number as wrong, and didn't test its length in the future, because it's obvious that there is at least one starting number with a longer sequence as the one (it is the starting number I started with before I got this one). Written in C++ the program ran approx. 1sec

% We only need the index of the number, not the number itself. THINK 
n = 10;
tic
wrong = zeros(n,1);
wrong(1) = 1;
for i = n:-1:1
    k = i;
    if mod(k,2)==0
        k = k/2;
    else
        k = 3*k+1;
    end
    while 1 
        if k<=n
            if wrong(k)
                break
            end
        end 
        wrong(k) = 1;
        if mod(k,2)==0
            k = k/2;
        else
            k = 3*k+1;
        end
    end
end
find(~wrong)
toc
