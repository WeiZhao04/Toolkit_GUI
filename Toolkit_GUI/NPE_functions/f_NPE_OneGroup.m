function [Y] = f_NPE_OneGroup(fdir,opts)


%%
N = opts.subject_num;
opts.initPOOL = false;
%% enable the randomise or not
if isequal(opts.randomise,1)
    PIND = randperm(N);
else
    PIND = 1:N;
end
%% loading the mask



%%



E.vecs = cell(1,N);
E.vals = cell(1,N);
E.coef = cell(1,N);
for ks = 1:N
    disp(['svd decomposing, ' num2str(ks) '/' num2str(N) ', ...'])
    temp = f_spm_load_nii(fdir{PIND(ks)});
    % masking and detrending
    temp = f_masking(temp,opts.maskdir);
    temp = detrend(temp',0)';
    %% SVD
    [U,S,V] = svd(temp,'econ');
    E.vecs{ks} = U;
%     E.vals{ks} = diag(S).^2/size(deAvg,1);
    E.vals{ks} = diag(S);
    E.coef{ks} = V;
end
% free the memory
clear temp deAvg
clear U S V
%%
disp('Applying zero-block diag matrix for adjacency graph')
rbook = f_blkdiagMask(E.vecs);
%%
if opts.th_estimation
    [dist] = f_Dim_Est(rbook,N,opts.outdir);
else
    dist = opts.threshold;
    disp('Threshold estimation is not applied')
end

%%
disp('NPE constructing')
[NH] = f_NHestablish(rbook,N,dist);
disp('GLS approximating')
[Y] = f_GSL_appr(NH,E);
Y.IND = PIND;
Y.Len = NH.Len;
%%
if opts.reconstruction
    f_reconstruct_files(Y,opts,fdir)
else
    disp('Files reconstruction is not applied')
end
%%





%%

end


%%%%%%%%%%%%%%%%%%%%% masking the data %%%%%%%%%%%%%%%%%%%%%%
function Mdata = f_masking(data,maskdir)

mask = f_spm_load_nii(maskdir);
mask = logical(mask);
[Xm,Zm,Ym] = size(mask);

[Xd,Zd,Yd,Td] = size(data);

if isequal(Xm,Xd) && isequal(Zm,Zd) && isequal(Ym,Yd)
    data = reshape(data,[],Td);
    Mdata = data(mask>0,:);
else
    error('Dimension of mask is not matched with data %s',num2str([Xm,Zm,Ym]));
end

end

%%%%%%%%%%%%%%%%%%%%%THE NEW ONE (memory effiveint for computation cost)%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate a zero block diag matrix and masked with it

function rbook = f_blkdiagMask(Evecs)

[n,TP] = size(Evecs{1});
N = size(Evecs,2);
rbook = cell(N,N);
for k = 1:N
    Evecs{k} = bsxfun(@minus,Evecs{k},sum(Evecs{k},1)/n);
end

for kr = 1:N
    for kn = 1:N
        if kr <= kn
%             rbook{kr,kn} = [];
        else
            rbook{kr,kn} = Evecs{kr}'*Evecs{kn};
        end
%        disp(['Ongoing progress of ' num2str(((N-1)*kr+kn)/(N*N)*100) '% ...'])
    end
    disp(['calculating distance, ' num2str(kr) '/' num2str(N) ', ...'])
end

end
%%%%%%%%%%%%%%%%%%%%% reconstruting the data %%%%%%%%%%%%%%%%%%%%%%
function [] = f_reconstruct_files(Ynpe,opts,fdir)

mask = f_spm_load_nii(opts.maskdir);
rcdir = [opts.outdir filesep 'RC_files'];
if ~exist(rcdir,'dir')
    mkdir(rcdir)
else
    rmdir(rcdir,'s')
    mkdir(rcdir)
end
for k = 1:opts.subject_num
    RC = Ynpe.npe{k}*diag(Ynpe.lat{k})*Ynpe.cof{k}';
    temp = zeros([size(RC,2),size(mask)]);
    temp(:,mask>0) = RC';
    temp = permute(temp,[2,3,4,1]);
    parts = strsplit(fdir{k},filesep);
    fname = [opts.outdir filesep 'RC_files' filesep 'rc_' parts{end}];
    f_spm_save_nii(temp,fname,opts.maskdir)
    disp(['reconstructing files, ' num2str(k) '/' num2str(opts.subject_num) ', ... '])
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function rbook = f_blkdiagMask2(Evecs)

fullpath = mfilename('fullpath');
[codepath,~]=fileparts(fullpath);
load([codepath filesep 'parcels' filesep '1000spMask_3mm'],'spMask')

[n,TP] = size(Evecs{1});
N = size(Evecs,2);
rbook = cell(N,N);
for k = 1:N
    Evecs{k} = spMask'*Evecs{k};
    Evecs{k} = bsxfun(@minus,Evecs{k},sum(Evecs{k},1)/1000);
    Evecs{k} = bsxfun(@rdivide,Evecs{k},vecnorm(Evecs{k},2,1));
end



for kr = 1:N
%     refE = Evecs{kr};
    for kn = 1:N
        if kr <= kn
%             rbook{kr,kn} = [];
        else
            rbook{kr,kn} = Evecs{kr}'*Evecs{kn};
        end
       disp(['Ongoing progress of ' num2str(((N-1)*kr+kn)/(N*N)*100) '% ...']) 
    end
    
end

end

%%%%%%%%%%%%%%%%%%%%%%% THE OLD ONE %%%%%%%%%%%%%%%%%%%%%%%%%
% generate a zero block diag matrix and masked with it
% function rbook = f_blkdiagMask(Evecs)
% 
% [n,TP] = size(Evecs{1});
% N = size(Evecs,2);
% gEvec = [Evecs{:}];
% y = [];
% x = zeros(TP);
% for k = 1:N
%     [p1,m1] = size(y);
%     y = [y ones(p1,TP); ones(TP,m1) x];
% end
% 
% mE = bsxfun(@minus,gEvec,sum(gEvec,1)/n);
% coef = mE' * mE;
% d = sqrt(diag(coef));
% coef = bsxfun(@rdivide,coef,d);
% rbook = bsxfun(@rdivide,coef,d');
% rbook = rbook.*y;
% rbook(isnan(rbook)) = 0;
% rbook(isinf(rbook)) = 0;
% 
% end
