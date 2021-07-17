function varargout = BarcodeGUI(varargin)
% BARCODEGUI MATLAB code for BarcodeGUI.fig
%      BARCODEGUI, by itself, creates a new BARCODEGUI or raises the existing
%      singleton*.
%
%      H = BARCODEGUI returns the handle to a new BARCODEGUI or the handle to
%      the existing singleton*.
%
%      BARCODEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BARCODEGUI.M with the given input arguments.
%
%      BARCODEGUI('Property','Value',...) creates a new BARCODEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BarcodeGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BarcodeGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BarcodeGUI

% Last Modified by GUIDE v2.5 07-Aug-2020 18:28:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BarcodeGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @BarcodeGUI_OutputFcn, ...
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


% --- Executes just before BarcodeGUI is made visible.
function BarcodeGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BarcodeGUI (see VARARGIN)

% Choose default command line output for BarcodeGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BarcodeGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BarcodeGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[f p]=uigetfile('*.png');
I=imread([p f]);
I= imresize(I,[240,320]);

axes(handles.axes1),imshow(I);
handles.I=I;
guidata(hObject,handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
I=handles.I;
GI=rgb2gray(I);
axes(handles.axes2),imshow(GI);
hold on;
x=[0 320];
y=[120 120];
y1=[80 80];
y2=[160 160];

plot(x,y,'r',x,y1,'b',x,y2,'y');
hold off;

handles.GI=GI;
guidata(hObject,handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
GI=handles.GI;
Row=[80 120 160]
[R, F]=Feature(GI,Row);
[Center, Width, NumBar] = Bar(F);
[Sequence, NumSeq] = Detection(Width, NumBar, 2);
[LGCode, LCode, GCode, RCode, LCodeRev, GCodeRev, RCodeRev] = Codebook;
[Code, Conf] = Recognition(Center, Width, ...
    Sequence, NumSeq, LGCode, LCode, GCode, RCode, ...
    LCodeRev, GCodeRev, RCodeRev) ;
Code=Code';
if(Conf>0)
    set(handles.edit1,'string',num2str(Code));
else
    set(handles.edit1,'string','Cannot Identify');
end
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
x=webcam;
axes(handles.axes1),preview(x);
hd=msgbox('Press Ok to take the photo');
uiwait(hd);
I=snapshot(x);
clear x;
I= imresize(I,[240,320]);
axes(handles.axes1),imshow(I);
handles.I=I;
guidata(hObject,handles);
