%SANDPILE MATH.
clean
n = 130;

a = zeros(2*n+1);

a(n+1,n+1) = 10^5;
c = 0;
tic
% figureFull
h = imagesc(a);
daspect([1 1 1])
pause(1)

ahistory = zeros(2*n+1,2*n+1,10^4);

colormap jet
chistory = [];

while 1
    ind = find(a>3);
    c = c+1;
    if ~length(ind)
        break
    end
    if mod(c,1000)==0
        disp(c)
        toc
    end
    
%     max(max(a))
    
    for id = ind'
        %         keyboard
        [i,j] = ind2sub([2*n+1,2*n+1],id);
        aa = floor(a(id)/4);
        sh = [0 1; 0 -1; 1 0; -1 0];
        for k = 1:size(sh,1)
            try
                a(i+sh(k,1),j+sh(k,2)) = a(i+sh(k,1),j+sh(k,2)) + aa;
            end
        end
        a(id) = mod(a(id),4);
    end
%     ahistory(:,:,c) = a;
        
        
%     cl0 = caxis;
%     chistory = [chistory; cl0];
    if mod(c,2)==0 %SHOWING EVEN frames makes things much smoother as the 2 cycle is the most prevalent.
        
        set(h,'CData',a);
        caxis('auto')
        cl1 = caxis;
        chistory = [chistory; cl1];
%         if cl1(2)-cl0(2) == -1
         caxis([0 median(chistory(max(1,end-30):end,2))]) 
         % Averaging last thirty is good, but becomes somewhat flickery on the long timescales in the end. Need to change to strict one by one going down.
         % Once I drop down
         
%         end
        drawnow
    end
end


