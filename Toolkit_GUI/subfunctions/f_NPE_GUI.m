function doneflag = f_NPE_GUI(fdir,opts)


%% checking and initial parse
disp(['initializing adapted NPE parameters'])
opts = f_npe_parse(fdir,opts);
%% NPE-based dimensionality reduction
if ~isequal(opts.mode,1)
    [Z] = f_NPE_OneGroup(fdir,opts);
else
    [Z] = f_NPE_POOL(fdir,opts);
end
%% save the outputs
ndir = [opts.outdir filesep 'aNPE_results'];
if ~exist(ndir,'dir')
    mkdir(ndir)
else
    rmdir(ndir,'s')
    mkdir([ndir])
end
disp(['saving outputs'])
save([ndir filesep 'NPE_result'],'Z','opts','-v7.3')
disp(['Adapted NPE Done!'])
%% 
doneflag = 1;
end

