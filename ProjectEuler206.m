% checked up to 207176114 with this algorithm. Something is not right
start_i = 66657805;%10101010;%floor(sqrt(1020304050607080900))-1;
while 1
    start_i = start_i+1;
    a = (100*start_i+30)^2;
    b = (100*start_i+70)^2;
    if  strcmp(a(1:2:end),'1234567890')
        break
    end
    if strcmp(b(1:2:end),'1234567890')
        break
    end
end


% 
% tic
% for i = 1:10^6
%     a = '1234560987';
%     strcmp(a(1:2:end),'1234567890');
% end
% toc
%% Figuring out last digits
% 30 or 70 for sure
a = 0:9;
% mod(floor(a.^2+(14*a+4)/10),10) % Hooray none of them is 8!
mod(floor(a.^2+(6*a)/10),10) % Three candidates for 8. 458
mod(floor(((a*100+30).^2)/10^4),10) % Three candidates for 8. 458

% Our number ends with (458)30
mod(floor(((a*1000+430).^2)/10^6),10)==7 % 
mod(floor(((a*1000+530).^2)/10^6),10)==7 %
mod(floor(((a*1000+830).^2)/10^6),10)==7 % WOW! Only single candidate 8 It doesn't work. Cross terms interfere.

% Number ends with 8830
%% An