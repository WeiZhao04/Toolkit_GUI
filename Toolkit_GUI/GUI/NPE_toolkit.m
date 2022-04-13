function varargout = NPE_toolkit(varargin)
%NPE_TOOLKIT MATLAB code file for NPE_toolkit.fig
%      NPE_TOOLKIT, by itself, creates a new NPE_TOOLKIT or raises the existing
%      singleton*.
%
%      H = NPE_TOOLKIT returns the handle to a new NPE_TOOLKIT or the handle to
%      the existing singleton*.
%
%      NPE_TOOLKIT('Property','Value',...) creates a new NPE_TOOLKIT using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to NPE_toolkit_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      NPE_TOOLKIT('CALLBACK') and NPE_TOOLKIT('CALLBACK',hObject,...) call the
%      local function named CALLBACK in NPE_TOOLKIT.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NPE_toolkit

% Last Modified by GUIDE v2.5 25-Aug-2021 21:40:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NPE_toolkit_OpeningFcn, ...
                   'gui_OutputFcn',  @NPE_toolkit_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before NPE_toolkit is made visible.
function NPE_toolkit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for NPE_toolkit
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes NPE_toolkit wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% set the path
% mpath = mfilename ('fullpath');
% [filepath,~] = fileparts (mpath);
% addpath(genpath(filepath));

% --- Outputs from this function are returned to the command line.
function varargout = NPE_toolkit_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_dim_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dim as text
%        str2double(get(hObject,'String')) returns contents of edit_dim as a double


% --- Executes during object creation, after setting all properties.
function edit_dim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_tr_Callback(hObject, eventdata, handles)
% hObject    handle to edit_tr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_tr as text
%        str2double(get(hObject,'String')) returns contents of edit_tr as a double


% --- Executes during object creation, after setting all properties.
function edit_tr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_tr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_vol_Callback(hObject, eventdata, handles)
% hObject    handle to edit_vol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_vol as text
%        str2double(get(hObject,'String')) returns contents of edit_vol as a double


% --- Executes during object creation, after setting all properties.
function edit_vol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_vol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sub_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sub as text
%        str2double(get(hObject,'String')) returns contents of edit_sub as a double


% --- Executes during object creation, after setting all properties.
function edit_sub_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_data_Callback(hObject, eventdata, handles)
% hObject    handle to edit_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_data as text
%        str2double(get(hObject,'String')) returns contents of edit_data as a double


% --- Executes during object creation, after setting all properties.
function edit_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in push_data.
function push_data_Callback(hObject, eventdata, handles)
% hObject    handle to push_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dataDir =uigetdir(pwd, 'Please select the data containing folder. ');

if ~isequal(dataDir, 0)
    handles.edit_data.String = dataDir;
    cd(dataDir)
    dataFiles = dir(dataDir);
    dataFiles = dataFiles(~[dataFiles.isdir]);
    [~,~,ext] = fileparts(dataFiles(1).name);
    if(strcmp(ext,'.gz')) || (strcmp(ext,'.nii'))
        switch ext
            case '.gz'
                tempfile = gunzip(dataFiles(1).name);
                hdr = nifti(tempfile{1});
                delete(tempfile{1})
            case '.nii'
                hdr = nifti(dataFiles(1).name);
        end
        % get the detailed info
        if (~isfield(hdr.timing,'tspace'))
            msgbox('No TR information from the NIfTI images, please specify it manually.');
            handles.edit_tr.String = num2str(0);
        else
            handles.edit_tr.String = num2str(hdr.timing.tspace);
        end
        if length(hdr.dat.dim) < 4
            handles.edit_vol.String = num2str(1);
        else
            handles.edit_vol.String = num2str(hdr.dat.dim(4));
        end
        handles.edit_dim.String = num2str(hdr.dat.dim(1:3));
        handles.edit_sub.String = num2str(length(dataFiles));
    else
        handles.edit_dim.String = num2str([0 0 0]);
        handles.edit_tr.String = num2str(0);
        handles.edit_vol.String = num2str(0);
        handles.edit_sub.String = num2str(0);
        %                     msgbox('No images was detected in the folder!')
    end
end


function edit_output_Callback(hObject, eventdata, handles)
% hObject    handle to edit_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_output as text
%        str2double(get(hObject,'String')) returns contents of edit_output as a double


% --- Executes during object creation, after setting all properties.
function edit_output_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in push_output.
function push_output_Callback(hObject, eventdata, handles)
% hObject    handle to push_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
outputDir =uigetdir(pwd, 'Please select the output folder.');
if ~isequal(outputDir, 0)
    handles.edit_output.String = outputDir;
end


function edit_mask_Callback(hObject, eventdata, handles)
% hObject    handle to edit_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_mask as text
%        str2double(get(hObject,'String')) returns contents of edit_mask as a double


% --- Executes during object creation, after setting all properties.
function edit_mask_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in push_mask.
function push_mask_Callback(hObject, eventdata, handles)
% hObject    handle to push_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[maskfile,path] = uigetfile({'*.nii;*.nii.gz'}, 'Please select the mask file.');
if ~isequal(maskfile, 0)
    handles.edit_mask.String = strcat(path,maskfile);
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in pop_mode.
function pop_mode_Callback(hObject, eventdata, handles)
% hObject    handle to pop_mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_mode contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_mode
value = handles.pop_mode.Value;
mode = handles.pop_mode.String{value};
handles.pop_mode.UserData = mode;
if isequal(mode,'One Group')
    handles.poolsize.Enable = 'off';
    handles.edit_poolsize.Enable = 'off';
elseif isequal(mode,'Poolized')
    msgbox('Not finished yet!')
    handles.poolsize.Enable = 'on';
    handles.edit_poolsize.Enable = 'on';
end

% --- Executes during object creation, after setting all properties.
function pop_mode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function edit_poolsize_Callback(hObject, eventdata, handles)
% hObject    handle to edit_poolsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_poolsize as text
%        str2double(get(hObject,'String')) returns contents of edit_poolsize as a double


% --- Executes during object creation, after setting all properties.
function edit_poolsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_poolsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['The mode to be used for adapted NPE. "One Group" will takes all subjects as one single group. ' ...
    '"Poolized" will select part of subjects, and it costs less memroy and compuatation time.'])

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['The number of subjects used for "Poolized" mode. '])


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['The data files must be .nii or .nii.gz formats. The data information' ...
 'will be displayed in the left panel.'])

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['All the subfolders and resuls will be stored in this folder. ' ...
 'The old output folder with the same name will be removed.'])

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['The mask to be used for exclued non-brain voxels.'])


function edit_threshold_Callback(hObject, eventdata, handles)
% hObject    handle to edit_threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_threshold as text
%        str2double(get(hObject,'String')) returns contents of edit_threshold as a double
% msgbox(['Threshold for dimension selection. The larger of the threshold, the less dimensions retained.'])

% --- Executes during object creation, after setting all properties.
function edit_threshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.




% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['If enable, the individual data will be reconstrcued after adapted NPE.'])

% --- Executes on selection change in pop_algorithm.
function pop_algorithm_Callback(hObject, eventdata, handles)
% hObject    handle to pop_algorithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_algorithm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_algorithm
value = handles.pop_algorithm.Value;
algorithm = handles.pop_algorithm.String{value};
handles.pop_algorithm.UserData = algorithm;
switch algorithm
    case 'Fast ICA'
        handles.edit_maxiteration.String = num2str(1000);
    case 'InfoMax ICA'
        handles.edit_maxiteration.String = num2str(1000);
    case 'Bayesian ICA'
        handles.edit_maxiteration.String = num2str(2000);
    otherwise
        handles.edit_maxiteration.String =  num2str(0);
end
            

% --- Executes during object creation, after setting all properties.
function pop_algorithm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_algorithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in check_th_estimation.
function check_th_estimation_Callback(hObject, eventdata, handles)
% hObject    handle to check_th_estimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_th_estimation
ThEst_flag = handles.check_th_estimation.Value;
if ThEst_flag
    handles.edit_threshold.Enable = 'off';
    handles.thres.Enable = 'off';
else
    handles.edit_threshold.Enable = 'on';
    handles.thres.Enable = 'on';
end

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['If enable, the embedded algorithm will automatically estimate the threshold based on input data.'])

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['The core algorithm for ICA. Currently, only first two are available.'])


function edit_modelorder_Callback(hObject, eventdata, handles)
% hObject    handle to edit_modelorder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_modelorder as text
%        str2double(get(hObject,'String')) returns contents of edit_modelorder as a double


% --- Executes during object creation, after setting all properties.
function edit_modelorder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_modelorder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['The number of independent components  for ICA.'])


function edit_maxiteration_Callback(hObject, eventdata, handles)
% hObject    handle to edit_maxiteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_maxiteration as text
%        str2double(get(hObject,'String')) returns contents of edit_maxiteration as a double


% --- Executes during object creation, after setting all properties.
function edit_maxiteration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_maxiteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['The maximum iteration number for ICA.' ...
    'The larger number indicates more computation time and acurate result.'])

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['Consistency of components analysis. If enable, a stability analysis will be performed to assit model order and IC selection.'])

% --- Executes on button press in check_coca.
function check_coca_Callback(hObject, eventdata, handles)
% hObject    handle to check_coca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_coca
cocaSuc_flag = handles.check_coca.Value;
if cocaSuc_flag
    handles.runs.Enable = 'on';
    handles.edit_runs.Enable = 'on';
    button_state(handles,'coca',1);
    % disable model order setting
    handles.mo_est.Enable = 'off';
    handles.check_mo_estimatin.Value = 0;
    handles.check_mo_estimatin.Enable = 'off';
    handles.mo.Enable = 'off';
    handles.edit_modelorder.Enable = 'off';
else
    handles.runs.Enable = 'off';
    handles.edit_runs.Enable = 'off';
    handles.mo_est.Enable = 'on';
    handles.check_mo_estimatin.Value = 0;
    handles.check_mo_estimatin.Enable = 'on';
    handles.mo.Enable = 'on';
    handles.edit_modelorder.Enable = 'on';
end

% --- Executes on button press in check_mo_estimatin.
function check_mo_estimatin_Callback(hObject, eventdata, handles)
% hObject    handle to check_mo_estimatin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_mo_estimatin
moEst_flag = handles.check_mo_estimatin.Value;
if moEst_flag
    handles.edit_modelorder.Enable = 'off';
else
    handles.edit_modelorder.Enable = 'on';
end

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['If enable, the embedded algorithm will automatically estimate the model order based on input data.'])


function edit_runs_Callback(hObject, eventdata, handles)
% hObject    handle to edit_runs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_runs as text
%        str2double(get(hObject,'String')) returns contents of edit_runs as a double


% --- Executes during object creation, after setting all properties.
function edit_runs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_runs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['The number of repeated times of ICA for each single model order.'])

% --- Executes on selection change in pop_domain.
function pop_domain_Callback(hObject, eventdata, handles)
% hObject    handle to pop_domain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_domain contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_domain
value = handles.pop_domain.Value;
mode = handles.pop_domain.String{value};
handles.pop_domain.UserData = mode;

% --- Executes during object creation, after setting all properties.
function pop_domain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_domain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['The sepcific domain for CoCA.'])


function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['The model order range go through by CoCA.'])


function edit_paras_Callback(hObject, eventdata, handles)
% hObject    handle to edit_paras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_paras as text
%        str2double(get(hObject,'String')) returns contents of edit_paras as a double


% --- Executes during object creation, after setting all properties.
function edit_paras_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_paras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in check_monitor.
function check_monitor_Callback(hObject, eventdata, handles)
% hObject    handle to check_monitor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_monitor
monitorFlag = get(hObject,'Value');
set(hObject,'UserData',monitorFlag);

% --- Executes on button press in push_load.
function push_load_Callback(hObject, eventdata, handles)
% hObject    handle to push_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filepath] = uigetfile('*.mat');
if isequal(filename,0)
    disp('User selected Cancel');
else
    handles.edit_paras.String = filename;
    load(fullfile(filepath,filename),'paras');
    % update the whole GUI
    updateUI(handles,paras)
    cd(paras.datadir)
end

% --- Executes on button press in push_save.
function push_save_Callback(hObject, eventdata, handles)
% hObject    handle to push_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.edit_output.String)
    msgbox('Output direction is not specified yet!');
else
    % update parameters
    paras = updateParas(handles);
    save(fullfile(get(handles.edit_output,'String'),get(handles.edit_paras,'String')), 'paras');
    h = msgbox('Parameters Saved!');
    uiwait(h);
end

% --- Executes on button press in push_check.
function push_check_Callback(hObject, eventdata, handles)
% hObject    handle to push_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[checkflag,msg] = checkParas(handles);
if checkflag
    handles.push_check.BackgroundColor = [0.47,0.67,0.19];
    handles.push_check.ForegroundColor = [1,1,1];
    h = msgbox('Parameters Checking Done!');
    handles.push_run.String = 'run';
    handles.push_run.BackgroundColor = [0.47,0.67,0.19];
    handles.push_run.ForegroundColor = [1,1,1];
    uiwait(h);
else
    handles.push_check.BackgroundColor = [1.00,0.41,0.16];
    handles.push_run.ForegroundColor = [0.15,0.15,0.15];
    h = msgbox(msg);
    uiwait(h);
end

% --- Executes on button press in push_run.
function push_run_Callback(hObject, ~, handles)
% hObject    handle to push_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch handles.push_run.String
    case 'run'
        pause('off')
        if isequal(handles.push_check.BackgroundColor,[0.47,0.67,0.19])
            paras = updateParas(handles);
            save(fullfile(get(handles.edit_output,'String'),get(handles.edit_paras,'String')), 'paras');
            handles.push_run.String = 'clear';
            handles.push_run.BackgroundColor = [1.00,0.00,0.00];
            handles.push_check.BackgroundColor = [1.00,0.41,0.16];
            drawnow();
            if handles.check_monitor.Value
                npe_ICA_Run_monitor(handles,paras);
            else
                npe_ICA_Run_alone(handles,paras);
            end
        else
            h = msgbox('Please press the check buttion before running your data.');
            uiwait(h);
        end
    case 'stop'
        handles.push_run.BackgroundColor = [1.00,1.00,1.00];
        handles.push_run.ForegroundColor = [0.15,0.15,0.15];
        handles.push_run.String = '...';
        diary off
        if ~isempty(timerfind)
            stop(timerfind);
            delete(timerfind);
        end
        drawnow();
        terminateExecution()
    otherwise
        h = msgbox('Please check your parameters before runing code.');
        uiwait(h);
end



function edit_morange_Callback(hObject, eventdata, handles)
% hObject    handle to edit_morange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_morange as text
%        str2double(get(hObject,'String')) returns contents of edit_morange as a double
range = handles.edit_morange.String;
(eval(['[',range,']']));


% --- Executes during object creation, after setting all properties.
function edit_morange_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_morange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['The reference model order for CoCA. It can be a interger or a certain range.'])


function edit_refmo_Callback(hObject, eventdata, handles)
% hObject    handle to edit_refmo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_refmo as text
%        str2double(get(hObject,'String')) returns contents of edit_refmo as a double
range = handles.edit_refmo.String;
(eval(['[',range,']']));

% --- Executes during object creation, after setting all properties.
function edit_refmo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_refmo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_job_Callback(hObject, eventdata, handles)
% hObject    handle to edit_job (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_job as text
%        str2double(get(hObject,'String')) returns contents of edit_job as a double


% --- Executes during object creation, after setting all properties.
function edit_job_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_job (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_progress_Callback(hObject, eventdata, handles)
% hObject    handle to edit_progress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_progress as text
%        str2double(get(hObject,'String')) returns contents of edit_progress as a double


% --- Executes during object creation, after setting all properties.
function edit_progress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_progress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in push_waitbar.
function push_waitbar_Callback(hObject, eventdata, handles)
% hObject    handle to push_waitbar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in push_npe.
function push_npe_Callback(hObject, eventdata, handles)
% hObject    handle to push_npe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.push_npe.UserData
    button_state(handles,'npe',1);
    handles.push_npe.UserData = 0;
else
    button_state(handles,'npe',0);
    handles.push_npe.UserData = 1;
end

% --- Executes on button press in push_ica.
function push_ica_Callback(hObject, eventdata, handles)
% hObject    handle to push_ica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.push_ica.UserData
    button_state(handles,'ica',1);
    handles.push_ica.UserData = 0;
else
    button_state(handles,'ica',0);
    handles.push_ica.UserData = 1;
end


% --- Executes on button press in push_coca.
function push_coca_Callback(hObject, eventdata, handles)
% hObject    handle to push_coca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.push_coca.UserData
    button_state(handles,'coca',1);
    handles.push_coca.UserData = 0;
else
    if handles.check_coca.Value
        uialert(handles.figure1,'You have enabled the coca sucession after ICA, please disable it first!', ...
            'Confict operation.','Icon','warning');
        button_state(handles,'coca',1);
        handles.push_coca.UserData = 0;
    else
        button_state(handles,'coca',0);
        handles.push_coca.UserData = 1;
    end
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
diary off;
if ~isempty(timerfind)
    stop(timerfind);
    delete(timerfind);
end
pause('off')


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
WS = get(0,'ScreenSize');
hObject.Position = [WS(3)/2-339 WS(4)/2-19 696.0 480.0];

% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in check_recon.
function check_recon_Callback(hObject, eventdata, handles)
% hObject    handle to check_recon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_recon
% --- Executes during object creation, after setting all properties.












function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
