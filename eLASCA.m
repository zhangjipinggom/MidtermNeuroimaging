function eLASCARec=eLASCA(stLASCA)
[M,N]=size(stLASCA);
[g, g_idx] = sort(stLASCA(:));

%% get f_e
f_e = zeros(size(g));
left=1;max_tmp=g(1); 
for righ=1:M*N
    if righ==M*N
        f_e(left:righ) = righ/(M*N);
    elseif g(righ)>max_tmp
        max_tmp=g(righ);
        f_e(left:righ-1)=(righ-1)/(M*N);
        left=righ;        
    end
end

%% return to M*N matrix
Result=zeros(2,M*N);
Result(1,:)=g_idx';
Result(2,:)=f_e';
GIm=sortrows(Result');
ReIm=GIm(:,2);
eLASCARec=reshape(ReIm,M,N);
end