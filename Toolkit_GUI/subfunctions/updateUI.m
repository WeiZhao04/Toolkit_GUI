function updateUI(app,paras)
% basic parameters
app.edit_data.String = paras.datadir;
app.edit_output.String = paras.outdir;
app.edit_mask.String = paras.maskdir;
% Info
app.edit_dim.String = (paras.dim);
app.edit_tr.String = num2str(paras.tr);
app.edit_vol.String = num2str(paras.vol);
app.edit_sub.String = num2str(paras.subject_num);
% Adapted NPE
app.push_npe.UserData = paras.npeflag; % enable flag
if app.push_npe.UserData
    button_state(app,'npe',1)
    app.push_npe.UserData = 0;
else
    button_state(app,'npe',0)
    app.push_npe.UserData = 1;
end
app.pop_mode.UserData = paras.mode;
app.pop_mode.Value = paras.modeValue;
if isequal(app.pop_mode.UserData,'One Group')
    app.edit_poolsize.Enable = 'off';
    app.poolsize.Enable = 'off';
else
    app.edit_poolsize.Enable = 'on';
    app.poolsize.Enable = 'on';
end
app.edit_poolsize.String = num2str(paras.poolsize);
app.check_recon.Value = paras.reconstruction;
app.edit_threshold.Value = paras.threshold;
app.check_th_estimation.Value = paras.th_estimation;
if app.check_th_estimation.Value
    app.edit_threshold.Enable = 'off';
    app.threshold.Enable = 'off';
end
% ICA
app.push_ica.UserData = paras.icaflag; % enable flag
if app.push_ica.UserData
    button_state(app,'ica',1)
    app.push_ica.UserData = 0;
else
    button_state(app,'ica',1)
    app.push_ica.UserData = 1;
end
app.pop_algorithm.UserData = paras.algorithm;
app.pop_algorithm.Value = paras.algorithmValue;
app.edit_modelorder.String = num2str(paras.modelorder);
app.check_mo_estimatin.Value = paras.mo_estimation;
if app.check_mo_estimatin.Value
    app.edit_modelorder.Enable = 'off';
    app.mo.Enable = 'off';
else
    app.check_mo_estimatin.Enable = 'on';
    app.mo.Enable = 'on';
end
app.edit_maxiteration.String = num2str(paras.iteration);
app.check_coca.Value = paras.cocasucession;
if app.check_coca.Value
    app.runs.Enable = 'off';
    app.edit_runs.Enable = 'off';
else
    app.runs.Enable = 'on';
    app.edit_runs.Enable = 'on';
end
app.edit_runs.String = num2str(paras.runs);
% CoCA
app.push_coca.UserData = paras.cocaflag; % enable flag
if app.push_coca.UserData
    button_state(app,'coca',1)
    app.push_coca.UserData = 0;
else
    button_state(app,'coca',0)
    app.push_coca.UserData = 1;
end
app.pop_domain.Value = paras.domainValue;
app.pop_domain.UserData = paras.domain;
app.edit_morange.String = num2str(paras.morange);
app.edit_refmo.String = num2str(paras.refmo);
% Operation
app.parasnameEditField.String = paras.name;
app.check_monitor.Value = paras.monitor;
%
drawnow();
end