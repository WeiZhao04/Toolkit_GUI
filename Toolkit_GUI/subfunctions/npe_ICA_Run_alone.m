 function npe_ICA_Run_alone(app,paras)
            % open the diary
            if exist([paras.outdir filesep 'log.txt'],'file')
                delete([paras.outdir filesep 'log.txt'])
            end
            diary([paras.outdir filesep 'log.txt'])
              
            % initial
            dataFiles = dir(paras.datadir);
            dataFiles = dataFiles(~[dataFiles.isdir]);
            filedir = strcat(paras.datadir,filesep,{dataFiles.name});
            totaljob = paras.npeflag + paras.icaflag + paras.cocaflag;
            progflag = 0;
            app.totalprogressEditField.Value = [num2str(progflag) '/' num2str(totaljob)];
            drawnow();
            %% npe setting
            if paras.npeflag
                opts.mode  = 0;
                opts.subject_num = paras.subject_num;
                opts.threshold = paras.threshold;
                opts.reconstruction = paras.reconstruction;
                opts.th_estimation = paras.th_estimation;
                opts.outdir = paras.outdir;
                opts.maskdir = paras.maskdir;
                % run adapted NPE
                doneflag = f_NPE_GUI(filedir,opts);
                progflag = progflag + doneflag;
                app.edit_progress.String = [num2str(progflag) '/' num2str(totaljob)];
                drawnow();
            end
            
            %% ica setting
            if ~paras.cocasucession && paras.icaflag % only ICA, no coca
                % generating ICA folder
                ICAdir = [paras.outdir filesep 'ICA_results'];
                if ~exist(ICAdir,'dir')
                    mkdir(ICAdir)
                else
                    rmdir(ICAdir,'s')
                    mkdir(ICAdir)
                end
                % run ICA
                paras.runs = 1;
                doneflag = f_ICA_GUI(filedir,paras);
                progflag = progflag + doneflag;
                app.edit_progress.String = [num2str(progflag) '/' num2str(totaljob)];
                drawnow();
            end
            
            %% coca setting
            if paras.cocaflag              
                doneflag = f_CoCA_GUI(filedir,paras);
                progflag = progflag + doneflag;
                app.edit_progress.String = [num2str(progflag) '/' num2str(totaljob)];
                drawnow();
            end
            
            % close the log
            msgbox('Done!');
            diary off
        end