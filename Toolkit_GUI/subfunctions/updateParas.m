function NewParas = updateParas(app)
% basic parameters
NewParas.datadir = app.edit_data.String;
NewParas.outdir = app.edit_output.String;
NewParas.maskdir = app.edit_mask.String;
% Info
NewParas.dim = (app.edit_dim.String);
NewParas.tr = str2double(app.edit_tr.String);
NewParas.vol = str2double(app.edit_vol.String);
NewParas.subject_num = str2double(app.edit_sub.String);
% Adapted NPE
NewParas.npeflag = ~app.push_npe.UserData; % enable flag
NewParas.mode = app.pop_mode.UserData;
NewParas.modeValue = app.pop_mode.Value;
NewParas.poolsize = str2double(app.edit_poolsize.String);
NewParas.reconstruction = app.check_recon.Value;
NewParas.threshold = str2double(app.edit_threshold.String);
NewParas.th_estimation = app.check_th_estimation.Value;
% ICA
NewParas.icaflag = ~app.push_ica.UserData; % enable flag
NewParas.algorithm = app.pop_algorithm.UserData;
NewParas.algorithmValue = app.pop_algorithm.Value;
NewParas.modelorder = str2double(app.edit_modelorder.String);
NewParas.mo_estimation = app.check_mo_estimatin.Value;
NewParas.iteration = str2double(app.edit_maxiteration.String);
NewParas.cocasucession = app.check_coca.Value;
NewParas.runs = str2double(app.edit_runs.String);
% CoCA
NewParas.cocaflag = ~app.push_coca.UserData; % enable flag
NewParas.domain = app.pop_domain.UserData;
NewParas.domainValue = app.pop_domain.Value;
NewParas.morange = app.edit_morange.String;
NewParas.refmo = app.edit_refmo.String;
% Operation
NewParas.name = app.edit_paras.String;
NewParas.monitor = app.check_monitor.Value;
end