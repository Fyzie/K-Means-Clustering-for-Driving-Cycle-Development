data = xlsread('data1.xlsx','Sheet1','C1:C100');
len = length(data);
decimal = 1;
data(:,1:2) = round(10^decimal*data)/10^decimal;
% u = accelerations of same velocity
% n = compare data to u(n)
[u,~,n] = unique(data,'rows');
N = length(u);
F = accumarray([n(1:end-1),n(2:end)],1,[N,N]);
T = bsxfun(@rdivide,F,sum(F,2));
