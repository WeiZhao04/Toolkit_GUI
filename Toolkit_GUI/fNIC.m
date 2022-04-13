function varargout = fNIC(varargin)
% FNIC MATLAB code for fNIC.fig
%      FNIC, by itself, creates a new FNIC or raises the existing
%      singleton*.
%
%      H = FNIC returns the handle to a new FNIC or the handle to
%      the existing singleton*.
%
%      FNIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FNIC.M with the given input arguments.
%
%      FNIC('Property','Value',...) creates a new FNIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fNIC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fNIC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fNIC

% Last Modified by GUIDE v2.5 14-Dec-2021 15:51:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fNIC_OpeningFcn, ...
                   'gui_OutputFcn',  @fNIC_OutputFcn, ...
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


% --- Executes just before fNIC is made visible.
function fNIC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fNIC (see VARARGIN)

% Choose default command line output for fNIC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% addpath
mpath = mfilename ('fullpath');
[filepath,~] = fileparts (mpath);
addpath(genpath(filepath));
% UIWAIT makes fNIC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fNIC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in PreButtom.
function PreButtom_Callback(hObject, eventdata, handles)
% hObject    handle to PreButtom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in NIC_Buttom.
function NIC_Buttom_Callback(hObject, eventdata, handles)
% hObject    handle to NIC_Buttom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NPE_toolkit

% --- Executes on button press in ConsisButtom.
function ConsisButtom_Callback(hObject, eventdata, handles)
% hObject    handle to ConsisButtom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Consistency
