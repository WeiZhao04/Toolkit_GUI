function varargout = Consistency(varargin)
% CONSISTENCY MATLAB code for Consistency.fig
%      CONSISTENCY, by itself, creates a new CONSISTENCY or raises the existing
%      singleton*.
%
%      H = CONSISTENCY returns the handle to a new CONSISTENCY or the handle to
%      the existing singleton*.
%
%      CONSISTENCY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONSISTENCY.M with the given input arguments.
%
%      CONSISTENCY('Property','Value',...) creates a new CONSISTENCY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Consistency_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Consistency_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Consistency

% Last Modified by GUIDE v2.5 10-Jan-2022 11:57:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Consistency_OpeningFcn, ...
                   'gui_OutputFcn',  @Consistency_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before Consistency is made visible.
function Consistency_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Consistency (see VARARGIN)

% Choose default command line output for Consistency
handles.output = hObject;
handles.CurDir=pwd;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Consistency wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Consistency_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in FolderList.
function FolderList_Callback(hObject, eventdata, handles)
% hObject    handle to FolderList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FolderList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FolderList


% --- Executes during object creation, after setting all properties.
function FolderList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FolderList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in FolderPop.
function FolderPop_Callback(hObject, eventdata, handles)
% hObject    handle to FolderPop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FolderPop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FolderPop


% --- Executes during object creation, after setting all properties.
function FolderPop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FolderPop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in VarList.
function VarList_Callback(hObject, eventdata, handles)
% hObject    handle to VarList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns VarList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from VarList


% --- Executes during object creation, after setting all properties.
function VarList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VarList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in VarPop.
function VarPop_Callback(hObject, eventdata, handles)
% hObject    handle to VarPop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns VarPop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from VarPop


% --- Executes during object creation, after setting all properties.
function VarPop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VarPop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in AddFolder.
function AddFolder_Callback(hObject, eventdata, handles)
% hObject    handle to AddFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Path]=uiget_multi(handles.CurDir,'Select Folders');
if isempty(Path)
    return
end
if handles.FolderPop.Value == 1 
    set(handles.FolderList, 'String','');
    if size(Path,1) > 1
        Path=Path(1);
        warndlg('Only one folder can be selected.');
    end
end
handles.CurDir = Path{1};
cd(handles.CurDir);
AddString(handles.FolderList, Path);


% --- Executes on button press in rvFolder.
function rvFolder_Callback(hObject, eventdata, handles)
% hObject    handle to rvFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Value=get(handles.FolderList, 'Value');
if Value==0
    return
end
RemoveString(handles.FolderList, Value);
guidata(hObject, handles);

% --- Executes on button press in AddVar.
function AddVar_Callback(hObject, eventdata, handles)
% hObject    handle to AddVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Name, Path]=uigetfile({'*.mat;*.nii;','Select Variables of ICs(*.mat;*.nii;)';'*.*', 'All Files (*.*)';},...
    'Pick the Spatial Variables', 'MultiSelect','on');
if handles.VarPop.Value == 1
    set(handles.VarList, 'String','');
    if size(Name,2) > 1
        Name=Name(1);
        warndlg('Only one folder can be selected.');
    end
end
if isnumeric(Name)
    return
end
if ischar(Name)
    Name={Name};
end
Name=Name';
% PathCell=cellfun(@(name) fullfile(Path, name), Name, 'UniformOutput', false);
AddString(handles.VarList, Name);


% --- Executes on button press in rmVar.
function rmVar_Callback(hObject, eventdata, handles)
% hObject    handle to rmVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Value=get(handles.FolderList, 'Value');
if Value==0
    return
end
RemoveString(handles.VarList, Value);
guidata(hObject, handles);

function OutDir_Callback(hObject, eventdata, handles)
% hObject    handle to OutDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OutDir as text
%        str2double(get(hObject,'String')) returns contents of OutDir as a double
Path=get(handles.OutDir, 'String');
if exist(Path, 'dir')~=7
    warndlg('Cannot find directory, please create it first!');
    set(handles.OutDir, 'String', handles.CurDir);
    return
end
handles.CurDir=Path;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function OutDir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OutDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RunButtom.
function RunButtom_Callback(hObject, eventdata, handles)
% hObject    handle to RunButtom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MOnum = str2num(get(handles.OrderNum, 'String'));
Th = str2num(get(handles.ThresCq, 'String'));
cocadir = [get(handles.OutDir, 'String') filesep 'CoCA_results'];
folders = get(handles.FolderList, 'String');
vars = get(handles.VarList, 'String');
ROdir = strcat(folders,filesep,vars);
N = length(MOnum);
if size(ROdir,1) ~= N
    warndlg('Model order number is not matched with variable number!')
    return
end
mkdir(cocadir)
for k_ref = 1:N
    load([ROdir{k_ref}],'M');
    Z_ref = flica_Zmaps(M);
    Z_ref = rownorm(cell2mat(Z_ref')');
    cMap = zeros(N,MOnum(end),MOnum(k_ref));
    for k_mo = 1:N
        load([ROdir{k_mo}],'M');
        Z_mo = flica_Zmaps(M);
        Z_mo = rownorm(cell2mat(Z_mo')');
        cMap(k_mo,1:size(Z_mo,1),:) = (Z_mo*Z_ref');
    end
    save([cocadir filesep 'cMap#' num2str(MOnum(k_ref))],'cMap');
end   
f_coca_RqIndexout(cocadir,MOnum,'save','off')
for k_ref = 1:N
    Cqs = f_coca_CqIndex(cocadir,MOnum(k_ref),MOnum,'CC');
    cval = nanmean(Cqs,2);
    CqCC.cval{k_ref} = cval;
    CqCC.Hq(k_ref) = sum(cval>=Th);
    CqCC.Lq(k_ref) = sum(cval<Th);
end
save([cocadir filesep 'CqCC'],'CqCC');
%%
figure%('visible','off')
b = bar([CqCC.Hq;CqCC.Lq]','stacked');
xticklabels(mat2cell(MOnum,1,N))
set(b(1),'FaceColor',[0.85,0.33,0.10])
set(b(2),'FaceColor',[0.00,0.45,0.74])
set(gca,'fontsize',12)
legend('good','bad')
ylabel(['IC number'],'fontsize',12)
xlabel(['Model Order number'],'fontsize',12)
saveas(gca,[cocadir filesep 'CsNum.png']);
%%
[~,recIdx] = max(CqCC.Hq);
%%
% clr = {'#0072BD','#D95319','#EDB120','#7E2F8E','#77AC30','#4DBEEE','#A2142F'};
figure%('visible','off')
hold on
for k = 1:N
    [scval,~] = sort(CqCC.cval{k},'ascend');
    h1 = plot([1:MOnum(k)],scval,'-*','linewidth',1);
    h2 = plot([CqCC.Lq(k)+1:MOnum(k)],scval(CqCC.Lq(k)+1:end),'o','linewidth',2,'color',get(h1,'color'));
    set(h2,'MarkerFaceColor',get(h1,'color'))
end
set(gca,'FontSize',12);
xlabel(['IC Number'],'fontsize',12)
ylabel(['Consistency Index'],'fontsize',12)
saveas(gca,[cocadir filesep 'CqLines.png']);
%%
[scval,sIdx] = sort(CqCC.cval{recIdx},'ascend');
dlmwrite([cocadir filesep 'sIC_number.txt'],[sIdx,scval])
%%
load([cocadir filesep 'hcMap#' num2str(MOnum(recIdx))],'hcMap');
figure%('visible','off')
set(gcf,'unit','centimeters','innerposition',[10 5 min(N*2.5,20) min(N*1.1,9)])
imagesc(hcMap(sIdx,:)')
colormap('parula')
c = colorbar('eastoutside');
ax = gca;
axpos = ax.Position;
c.Position(3) = 0.5*c.Position(3);
ax.Position = axpos;
hold on
line([0,MOnum(recIdx)+1],[recIdx,recIdx],'linewidth',2,'color',[ 0 0 0])
set(gca,'YTick',[1:N],'YTickLabel',[MOnum],'FontSize',12);
xlabel(['Sorted IC Number'],'fontsize',12)
ylabel(['Recommended ICs in MO' num2str(MOnum(recIdx))],'fontsize',12)
saveas(gca,[cocadir filesep 'hcMap.png']);
%%
figure('visible','off')
a = area([1:MOnum(recIdx)],scval);
a.FaceAlpha = 0.5;
a.FaceColor = '#E0E0E0';
hold on
plot([1:MOnum(recIdx)],scval,'-*','linewidth',2,'color',[0.85,0.33,0.10]);
plot([1:CqCC.Lq(recIdx)],scval(1:CqCC.Lq(recIdx)),'-*','linewidth',2,'color',[0.00,0.45,0.74]);
ylim([0 1])
xlim([1 MOnum(recIdx)])
set(gcf,'unit','centimeters','innerposition',[10 5 min(N*2.5,20) 2.5])
set(gca,'FontSize',12);
saveas(gca,[cocadir filesep 'Cq.png']);
function X=rownorm(X)
% normalize rows to unit length.
s=abs(sqrt(sum(X.^2,2)));
if any(s==0)
  warning('Contains zero vectors: can''t normalize them!');
end
X=X./repmat(s,1,size(X,2));

function OrderNum_Callback(hObject, eventdata, handles)
% hObject    handle to OrderNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OrderNum as text
%        str2double(get(hObject,'String')) returns contents of OrderNum as a double
Value=get(handles.OrderNum, 'String');
NewVal = eval(['[',Value,']']);
set(handles.OrderNum, 'String', num2str(NewVal));

% --- Executes during object creation, after setting all properties.
function OrderNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OrderNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OutDirButtom.
function OutDirButtom_Callback(hObject, eventdata, handles)
% hObject    handle to OutDirButtom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Path=uigetdir(handles.CurDir, 'Pick Output Directory');
if isnumeric(Path)
    return
end
handles.CurDir=Path;
set(handles.OutDir, 'String', Path);
guidata(hObject, handles);

function AddString(ListboxHandle, NewCell)
StringCell=get(ListboxHandle, 'String');
StringCell=[StringCell; NewCell];
set(ListboxHandle, 'String', StringCell, 'Value', numel(StringCell));

function RemoveString(ListboxHandle, Value)
StringCell=get(ListboxHandle, 'String');
StringCell(Value)=[];
if isempty(StringCell)
    Value=0;
end
if Value > numel(StringCell)
    Value=Value-1;
end
set(ListboxHandle, 'String', StringCell, 'Value', Value);



function ThresCq_Callback(hObject, eventdata, handles)
% hObject    handle to ThresCq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ThresCq as text
%        str2double(get(hObject,'String')) returns contents of ThresCq as a double
Value=get(handles.ThresCq, 'String');
Value = str2double(Value);
if Value<=0 || Value>=1
   warndlg('The Cq threshold must be within (0 1) and recommended value is 0.8!');
   set(handles.ThresCq, 'String', '0.8');
   return
end



% --- Executes during object creation, after setting all properties.
function ThresCq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ThresCq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
