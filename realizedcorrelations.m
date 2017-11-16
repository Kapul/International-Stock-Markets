clear
clc

load('eret.mat');

retdata = eret;
ret_china = retdata(:,2);
ret_us = retdata(:,22);
retdata(:,22) = [];
retdata(:,2) = [];
n = size(retdata, 1);

rc_us = zeros(n-11, size(retdata, 2));
rc_china = rc_us;

for i = 12:n
    for j = 1:size(retdata, 2)
        rc_china(i-11, j) = corr(ret_china(i-11:i), retdata(i-11:i,j));
        rc_us(i-11, j) = corr(ret_us(i-11:i), retdata(i-11:i,j));
    end
end

countries2;
load dates.mat
dn=datenum(date,'mm/yyyy');

for i = 1:4
    figure
    for j = 1:10
        subplot(5,2,j)
        c = floor(5*(i-1)+(j-1)/2)+1;
        y = mod(j,2)*rc_us(:,c) + (1-mod(j,2))*rc_china(:,c);
        plot(dn(12:end),y)
        datetick('x','keepticks','keeplimits')
        if mod(j,2) == 1
            title(strcat(names{c},'   and   US'))
        else
            title(strcat(names{c},'   and   China'))
        end
    end
end


