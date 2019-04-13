% From wiki 23, 37, 53, 73, 313, 317, 373, 797, 3137, 3797, 739397
% One could cheat and just check primes for truncatability and stop at some point.
% But that way we never know when to stop. Much better is to grow a tree.
clean
a = [2,3,5,7]; % we start from these.
global bR bL cR cL
bR = [1,3,7,9]; % we can concatenate only these
bL = [1:9]; % we can concatenate only these

cR = [];
cL = [];


for i = a
AddDigitRight(i)
% AddDigitleft(i) % takes too long
end
cR
cL

for i = cR
    a = i;
    while a>0
        
    end
end


function AddDigitRight(x)
global bR cR
    for i = bR
        n = x*10+i;
        if isprime(n)
            cR = [cR, n];
            AddDigitRight(n)
        end
    end
end

function AddDigitleft(x)
global bL cL
    for i = bL
        n = str2double([num2str(i),num2str(x)]);
        if isprime(n)
            cL = [cL, n];
            AddDigitleft(n)
        end
    end
end

