% reduce fundamental triplets
function counts = CullTriplets(counts,higherAllowed)
global triplets

if size(counts,2)>1
    
    s = CountsToSets(counts);
    % Too complicated because of out of bounds
    %     for i = 1:size(triplets,1)
    %         for j = 1:size(triplets,2)
    %             t                   = circshift(triplets(i,:),j);
    %             ind                 = counts(:,t(1)) & counts(:,t(2));
    %             counts(ind,t(1:2))   = 0;
    %             counts(ind,t(3))     = counts(ind,t(3))+1;
    %         end
    %     end
    
    % TODO: CONVERT ALL counts into holding 1s so that there's no confusion about offset
    
    tripletss = triplets+1;
    for i = 1:size(tripletss,1)
        for j = 1:size(tripletss,2)
            t                   = circshift(tripletss(i,:),j);
            if t(3)<=size(counts,2)+1 | higherAllowed
                for l = 1:length(s)
                    if sum(s{l}==t(1)) & sum(s{l}==t(2))
                        s{l}(s{l}==t(1)) = [];
                        s{l}(s{l}==t(2)) = [];
                        s{l}             = [s{l} t(3)];
                    end
                end
            end
        end
    end
    counts = SetsToCounts(s);
    counts = CullSets(counts);
end