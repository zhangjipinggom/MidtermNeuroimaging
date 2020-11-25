NA = normrnd(10,2,[10000,1000]);
NB = normrnd(10.5,2,[10000,1000]);
NAM = mean(NA, 2);
NBM = mean(NB, 2);
NAstd = std(NA, 0, 2);
NBstd = std(NB, 0, 2);
[h,p,ci,tN_tmp] = ttest2(NB',NA');
tN = tN_tmp.tstat;
tNM = mean(tN);
tNstd = std(tN);
tN_7_ratio = sum((tN > 7))/size(tN, 2);

grid
subplot(2, 2, 1), histogram(NAM)
xlabel('NAM'), ylabel('Number')
title('histogram of NA')
subplot(2, 2, 2), histogram(NAstd) 
xlabel('NAstd'), ylabel('Number')
title('histogram of NAstd')
subplot(2, 2, 3), histogram(NBM) 
xlabel('NBM'), ylabel('Number')
title('histogram of NBM')
subplot(2, 2, 4), histogram(NBstd) 
xlabel('MBstd'), ylabel('Number')
title('histogram of MBstd')

figure(2)
grid
histogram(tN')
xlabel('tN'), ylabel('Number')
title('histogram of tN')


