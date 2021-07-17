function varargout = TestFileGUI(varargin)
% TESTFILEGUI MATLAB code for TestFileGUI.fig
%      TESTFILEGUI, by itself, creates a new TESTFILEGUI or raises the existing
%      singleton*.
%
%      H = TESTFILEGUI returns the handle to a new TESTFILEGUI or the handle to
%      the existing singleton*.
%
%      TESTFILEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTFILEGUI.M with the given input arguments.
%
%      TESTFILEGUI('Property','Value',...) creates a new TESTFILEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TestFileGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TestFileGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TestFileGUI

% Last Modified by GUIDE v2.5 22-Aug-2020 08:37:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TestFileGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @TestFileGUI_OutputFcn, ...
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


% --- Executes just before TestFileGUI is made visible.
function TestFileGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TestFileGUI (see VARARGIN)

% Choose default command line output for TestFileGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TestFileGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TestFileGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[f p]=uigetfile('*.txt');
fid=fopen([p f],'r');
M=fscanf(fid,'%d',[3 Inf]);
set(handles.uitable1,'data',M');
handles.M=M;
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
M=handles.M;
MM=M+5;
set(handles.uitable2,'data',MM');
handles.MM=MM;
guidata(hObject,handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
MM=handles.MM;
MMM=MM';
A=inputdlg('Roll No');
roll=str2double(A{1});
M1=MMM(roll,1);
M2=MMM(roll,2);
M3=MMM(roll,3);
if(M1>=50 && M2 >=50 && M3>=50)
   set(handles.text2,'string',['Roll ',num2str(roll),' PASS']);
else
    set(handles.text2,'string',['Roll ',num2str(roll),' FAIL']);
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
[f p]=uiputfile('*.txt');
fid=fopen([p f],'w');
MM=handles.MM;
fprintf(fid,'%5d %5d %5d\n',MM);
fclose(fid);
set(handles.text2,'string','File is saved');