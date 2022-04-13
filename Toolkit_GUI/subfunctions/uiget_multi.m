function [pathname, extname] = uiget_multi(start_path, dialog_title)
% Pick multiple directories and/or files

import javax.swing.JFileChooser;

jchooser = javaObjectEDT('javax.swing.JFileChooser', start_path);

jchooser.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);
if nargin > 1
    jchooser.setDialogTitle(dialog_title);
end

jchooser.setMultiSelectionEnabled(true);

status = jchooser.showOpenDialog([]);

if status == JFileChooser.APPROVE_OPTION
    jFile = jchooser.getSelectedFiles();
    pathname{size(jFile, 1),1}=[];
    for i=1:size(jFile, 1)
        pathname{i} = char(jFile(i).getAbsolutePath);
    end
    
elseif status == JFileChooser.CANCEL_OPTION
    pathname = [];
else
    error('Error occured while picking file.');
end

extname = cell(length(pathname),1);
for i=1:length(pathname)
    [~,extname{i}] = fileparts(pathname{i});
end