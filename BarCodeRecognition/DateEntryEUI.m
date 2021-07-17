function varargout = DateEntryEUI(varargin)
% DATEENTRYEUI MATLAB code for DateEntryEUI.fig
%      DATEENTRYEUI, by itself, creates a new DATEENTRYEUI or raises the existing
%      singleton*.
%
%      H = DATEENTRYEUI returns the handle to a new DATEENTRYEUI or the handle to
%      the existing singleton*.
%
%      DATEENTRYEUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATEENTRYEUI.M with the given input arguments.
%
%      DATEENTRYEUI('Property','Value',...) creates a new DATEENTRYEUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DateEntryEUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DateEntryEUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DateEntryEUI

% Last Modified by GUIDE v2.5 08-Aug-2020 11:28:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DateEntryEUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DateEntryEUI_OutputFcn, ...
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


% --- Executes just before DateEntryEUI is made visible.
function DateEntryEUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DateEntryEUI (see VARARGIN)

% Choose default command line output for DateEntryEUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DateEntryEUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DateEntryEUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
cam=webcam;
axes(handles.axes1),preview(cam);
hd=msgbox('Press Ok to take the photo');
uiwait(hd);
I=snapshot(cam);
clear x;
I= imresize(I,[240,320]);
axes(handles.axes1),imshow(I);

hold on;
x=[0 320];
y=[120 120];
y1=[80 80];
y2=[160 160];

plot(x,y,'r',x,y1,'b',x,y2,'y');
hold off;
GI=rgb2gray(I);
[Code Conf]=myBarcode(GI);

Code=num2str(Code)
if(Conf>0)
    set(handles.edit1,'string',Code);
else
    set(handles.edit1,'string','Cannot Identify');
end
handles.GI=GI;
guidata(hObject,handles);



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
if(exist('Item.mat'))
    load Item.mat;
    L=length(Item);
    id=L+1;
else
    id=1;
end
Item(id).code=get(handles.edit1,'string');
Item(id).name=get(handles.edit2,'string');
Item(id).price=get(handles.edit3,'string');
save Item.mat Item;
hd=msgbox('Data is saved');
uiwait(hd);
    
    
    
    
    
    
    


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
close all;
DataRetrieveGUI;