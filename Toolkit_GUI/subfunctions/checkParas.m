function [checkflag,msg] = checkParas(app)
% basic parameters
if (isempty(get(app.edit_data,'String')) && isempty(get(app.edit_output,'String')) ...
        && isempty(get(app.edit_mask,'String')))
    checkflag = 0;
    msg = 'Basic parameters are needed!';
    return
end
% Info
if isempty(get(app.edit_tr,'String'))
    checkflag = 0;
    msg = 'The TR is missing!';
    return
end
% Adapted NPE
if ~get(app.push_npe,'UserData')
    if isequal(get(app.pop_mode,'UserData'),'Poolized') && ...
            (str2double(get(app.edit_poolsize,'String')) > str2double(get(app.edit_sub,'String')))
        checkflag = 0;
        msg = 'Pool size should small than total subject number!';
        return
    end
end
% ICA

% CoCA
if ~get(app.push_coca,'UserData')
    if ~get(app.push_ica,'UserData') && ~get(app.check_coca,'Value')
        checkflag = 0;
        msg = 'If you want run both ICA and CoCA, please check the consitency in ICA panel!';
        return
    end
    morang = eval(['[',get(app.edit_morange,'String'),']']);
    refMO = eval(['[',get(app.edit_refmo,'String'),']']);
    if min(morang) > min(refMO) && ...
            max(morange) < max(refMO)
        checkflag = 0;
        msg = 'Reference model order should be within the range!';
        return
    end
end

% nothing wrong
checkflag = 1;
msg = 'Parameters Checking Done!';

end