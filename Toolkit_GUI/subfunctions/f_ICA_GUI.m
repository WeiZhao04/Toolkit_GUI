function doneflag = f_ICA_GUI(data,opts)


%% checking and initial parse
disp(['initializing ICA parameters'])
Num_IC = opts.modelorder;
% est_flag = opts.MO_estimation;
runs = opts.runs;
MaxIteration = opts.iteration;
N = opts.subject_num;
%%
if opts.npeflag
        disp('NPE_result loading, 1/2, ...')
        load([opts.outdir filesep 'aNPE_results' filesep 'NPE_result'],'Z');
        Y = cell2mat(Z.npe);
        disp('NPE_result loading, 2/2, ...')
        Len = Z.Len;
else
        Z.vecs = cell(1,N);
        Z.vals = cell(1,N);
        Z.coef = cell(1,N);
        Len = zeros(1,N);
        for ks = 1:N
            disp(['pca decomposing, ' num2str(ks) '/' num2str(N) ', ...'])
            temp = f_spm_load_nii(data{ks});
            % masking and detrending
            temp = f_masking(temp,opts.maskdir);
            temp = detrend(temp',0)';
            %% SVD
            [U,S,V] = svd(temp,'econ');
            Z.vecs{ks} = U*S;
            Z.lat{ks} = diag(S).^2/size(temp,1);
            Z.cof{ks} = V;
            Len(ks) = length(S);
        end
        Y = cell2mat(Z.vecs);
end
%%

[scr,cof,lat] = pca(Y','centered','off');
ratio = cumsum(lat)/sum(lat)*100;
disp(['Information explained ratio is ' num2str(roundn(ratio(Num_IC),-2)) '% for using ' num2str(Num_IC) 'egienvectors.'])

switch opts.algorithm
    case 'Fast ICA'
        [sR]=icassoEst('both', scr(:,1:Num_IC)',runs,'maxNumIterations',MaxIteration);
        % TC&SM
        sR=icassoExp(sR);
        [iq,A,W,SM] = icassoResult(sR,Num_IC);
        Coeff = mat2cell(cof(:,1:Num_IC)*A,Len);
        TCs = cell(1,N);
        for k = 1:N
            TCs{k} = rownorm(Z.cof{k}*Coeff{k});
        end
        TC = cell2mat(TCs');
%         average the timecourse over subjects
%         gCof = cell2mat(Z.cof);
%         TC = gCof*cof(:,1:NoC)*sR.A;
%         TC = rownorm(tempTC');     
    case 'InfoMax ICA'
        [sR]=icassoEst_infomaxICA('both',scr(:,1:isComp)',runs,'maxNumIterations',MaxIteration);
        % TC&SM
        sR=icassoExp(sR);
        [iq,A,W,SM] = icassoResult(sR,Num_IC);
        Coeff = mat2cell(cof(:,1:Num_IC)*A,Len);
        TCs = cell(1,N);
        for k = 1:N
            TCs{k} = rownorm(Z.cof{k}*Coeff{k});
        end
        TC = cell2mat(TCs');
    case 'Bayesian ICA'
        
        disp('wroking on it.')
    otherwise
        disp('wroking on it.')

end
%% save the outputs
disp('saving outputs')
ICAdir = [opts.outdir filesep 'ICA_results'];
mkdir(ICAdir)
save([ICAdir filesep sprintf('MO_%0.3i',Num_IC)],'SM','TC','-v7.3')
%%
mask = f_spm_load_nii(opts.maskdir);
temp = zeros([Num_IC,size(mask)]);
temp(:,mask>0) = zscore(SM,0,2);
temp = permute(temp,[2,3,4,1]);
fname = [ICAdir filesep sprintf('MO_%0.3i_maps.nii.gz',Num_IC)];
f_spm_save_nii(temp,fname,opts.maskdir);
writematrix(TC,[ICAdir filesep sprintf('MO_%0.3i_TC.txt',Num_IC)]);
%%
doneflag = 1;
end

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
