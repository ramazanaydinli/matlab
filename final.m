function varargout = final(varargin)
% FINAL MATLAB code for final.fig
%      FINAL, by itself, creates a new FINAL or raises the existing
%      singleton*.
%
%      H = FINAL returns the handle to a new FINAL or the handle to
%      the existing singleton*.
%
%      FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL.M with the given input arguments.
%
%      FINAL('Property','Value',...) creates a new FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final

% Last Modified by GUIDE v2.5 18-Jan-2021 16:24:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_OpeningFcn, ...
                   'gui_OutputFcn',  @final_OutputFcn, ...
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


% --- Executes just before final is made visible.
function final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final (see VARARGIN)

% The code below is a constant which will be used for making the panel
% values zero

handles.adjusted_value = str2double('0');

% Choose default command line output for final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function EDT_layer_number_input_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_layer_number_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_layer_number_input as text
%        str2double(get(hObject,'String')) returns contents of EDT_layer_number_input as a double

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function EDT_layer_number_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_layer_number_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Pub_save_layer_number.
function Pub_save_layer_number_Callback(hObject, eventdata, handles)
% hObject    handle to Pub_save_layer_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% The code below is enabling layer list to being able to choose layer
% number

handles.ln = str2double(char(get(handles.EDT_layer_number_input,'String')));
handles.POP_layer_list.Enable = 'on';
pop_layer_list = cell(handles.ln,1);
pop_layer_list{1}= "Select the Layer";

%The code below is naming the layers

for i = 1 : handles.ln
    pop_layer_list{i+1} = "Layer " + i;
end
set(handles.POP_layer_list, 'String', pop_layer_list);
handles.property_table.RowName = pop_layer_list(2:handles.ln+1);
handles.property_table_data = {};

% Update handles structure
guidata(hObject, handles);


% --- Executes on selection change in layer_number_list.
function layer_number_list_Callback(hObject, eventdata, handles)
% hObject    handle to layer_number_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns layer_number_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from layer_number_list


% --- Executes during object creation, after setting all properties.
function layer_number_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to layer_number_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in POP_layer_list.
function POP_layer_list_Callback(hObject, eventdata, handles)
% hObject    handle to POP_layer_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns POP_layer_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from POP_layer_list

%The code below is making values zero for every new layer

handles.selected_item = handles.POP_layer_list.Value;
if handles.selected_item >1
    handles.soil_type_panel.Title = "Layer " + (handles.selected_item-1) + " Soil Type";
    handles.soil_type_panel.Visible= 'on';
else
    handles.soil_type_panel.Visible= 'off';
end %if ends

set(handles.property_panel,'Visible','off');
set(handles.RB_cohesive, 'Value', 0);
set(handles.RB_cohesionless, 'Value', 0);
handles.property_panel.Title = "Layer " + (handles.selected_item-1) + " Parameters";
handles.name_of_save_button = "Save the Layer " + num2str(handles.selected_item-1);
set(handles.Pub_save_the_layer,'String',handles.name_of_save_button);
handles.EDT_starting_depth.String = '0';
handles.EDT_end_depth.String = '0';
handles.EDT_saturated_unit_weight.String = '0';
handles.EDT_undrained_shear_strength.String = '0';
handles.EDT_adhesion_factor.String = '0';
handles.EDT_friction_angle.String = '0';
handles.EDT_nq.String = '0';
% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function POP_layer_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to POP_layer_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDT_pile_length_input_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_pile_length_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_pile_length_input as text
%        str2double(get(hObject,'String')) returns contents of EDT_pile_length_input as a double

handles.pile_length = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function EDT_pile_length_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_pile_length_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDT_pile_diameter_input_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_pile_diameter_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_pile_diameter_input as text
%        str2double(get(hObject,'String')) returns contents of EDT_pile_diameter_input as a double

handles.pile_diameter = str2double(get(hObject,'String'));
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function EDT_pile_diameter_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_pile_diameter_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDT_skin_friction_output_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_skin_friction_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_skin_friction_output as text
%        str2double(get(hObject,'String')) returns contents of EDT_skin_friction_output as a double


% --- Executes during object creation, after setting all properties.
function EDT_skin_friction_output_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_skin_friction_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDT_tip_resistance_output_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_tip_resistance_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_tip_resistance_output as text
%        str2double(get(hObject,'String')) returns contents of EDT_tip_resistance_output as a double


% --- Executes during object creation, after setting all properties.
function EDT_tip_resistance_output_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_tip_resistance_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDT_ultimate_capacity_output_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_ultimate_capacity_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_ultimate_capacity_output as text
%        str2double(get(hObject,'String')) returns contents of EDT_ultimate_capacity_output as a double


% --- Executes during object creation, after setting all properties.
function EDT_ultimate_capacity_output_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_ultimate_capacity_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Pub_calculate_draw.
function Pub_calculate_draw_Callback(hObject, eventdata, handles)
% hObject    handle to Pub_calculate_draw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Code segment below is giving erros if pile length is lower than 6
% meters

if handles.pile_length<=6
errordlg('Pile length should be longer than 6 meters!','Design Error');
end

% The code below calculates the skin friction by using external function
% and given soil data

handles.skin_friction=0;
for i=1:handles.ln
    if strcmp(handles.property_table_data(i,1), 'Cohesive')
        if handles.pile_length > cell2mat(handles.property_table_data(i,2))
            if handles.pile_length >= cell2mat(handles.property_table_data(i,3))
                handles.effective_pile_length=cell2mat(handles.property_table_data(i,3))-cell2mat(handles.property_table_data(i,2));
            else
                handles.effective_pile_length = handles.pile_length - cell2mat(handles.property_table_data(i,2));
            end % if ends
        else
            break
        end %if ends
        handles.skin_friction= handles.skin_friction + pi*handles.pile_diameter*cell2mat(handles.property_table_data(i,6))*cell2mat(handles.property_table_data(i,5))*handles.effective_pile_length;
    else
        if handles.pile_length > cell2mat(handles.property_table_data(i,2))
            handles.pile_starting_depth=cell2mat(handles.property_table_data(i,2));
            if handles.pile_length < cell2mat(handles.property_table_data(i,3))
                handles.pile_end_depth = handles.pile_length;
            else
                handles.pile_end_depth = cell2mat(handles.property_table_data(i,3));
            end %if ends
        else
            break
        end %if ends
    for j=1:i
        layer_number=i;
        starting_depth(1,j)=(cell2mat(handles.property_table_data(j,2)));
        end_depth(1,j) = (cell2mat(handles.property_table_data(j,3)));
        saturated_unit_weight(1,j)= (cell2mat(handles.property_table_data(j,4)));
        diameter = handles.pile_diameter;
    end %for ends
        handles.effective_stress_top = effective_stress_calculation(handles.pile_starting_depth,layer_number,starting_depth,end_depth,saturated_unit_weight,diameter);
        handles.effective_stress_bottom = effective_stress_calculation(handles.pile_end_depth,layer_number,starting_depth,end_depth,saturated_unit_weight,diameter);
        handles.effective_stress = (handles.effective_stress_top + handles.effective_stress_bottom)/2;
        handles.skin_friction=handles.skin_friction + pi*handles.pile_diameter*0.5*handles.effective_stress*tand(0.75*handles.friction_angle)*(handles.pile_end_depth-handles.pile_starting_depth);
    end %if ends
end
handles.EDT_skin_friction_output.String= handles.skin_friction;

%The code below calculates the tip resistance

for i=1:handles.ln
    if handles.pile_length > cell2mat(handles.property_table_data(i,3))
        continue
    else
        if strcmp(handles.property_table_data(i,1), 'Cohesive')
            handles.nc=9;
            handles.qp=handles.nc*(cell2mat(handles.property_table_data(i,5)))* pi *(handles.pile_diameter/2)^2 ;
        else
            handles.effective_tip_stress = effective_stress_calculation(handles.pile_length,layer_number,starting_depth,end_depth,saturated_unit_weight,diameter);
            switch cell2mat(handles.property_table_data(i,7))
                case 20
                    handles.nq=4;
                case 25
                    handles.nq=5;
                case 28
                    handles.nq=8;
                case 30
                    handles.nq=12;
                case 32
                    handles.nq=17;
                case 34
                    handles.nq=22;
                case 36
                    handles.nq=30;
                case 38
                    handles.nq=40;
                case 40
                    handles.nq=60;
                case 42
                    handles.nq=80;
                case 45
                    handles.nq=115;
            end %swtich ends
            handles.qp= handles.effective_tip_stress*handles.nq*pi*(handles.pile_diameter/2)^2;
        end %if ends
    end %if ends
end % for ends

handles.EDT_tip_resistance_output.String = handles.qp;
handles.EDT_ultimate_capacity_output.String = handles.skin_friction + handles.qp;

%The code below arranges the graph so it will show the data simirlar to the
%asked in the final 

depth_graph_ytick(1,handles.ln+1)=0;
for i=1:handles.ln
    depth_graph_ytick(1,handles.ln+1-i) = -1*(cell2mat(handles.property_table_data(i,3)));
end %for ends

axes(handles.depth_graph);
hold all
r=rectangle('Position',[0.5 (-1*handles.pile_length) 0.5 handles.pile_length]);
r.FaceColor = [0.859 0.855 0.843];
for i=1:handles.ln
    plot([0 0.5],[depth_graph_ytick(1,i) depth_graph_ytick(1,i)],'k-','LineWidth',1);
    plot([0.5 1],[depth_graph_ytick(1,i) depth_graph_ytick(1,i)],'k:','LineWidth',1);
    plot([1 5],[depth_graph_ytick(1,i) depth_graph_ytick(1,i)],'k-','LineWidth',1);
end %for ends
xlim([0 5]);
ylim([((-1*handles.pile_length)-3) 0]);
handles.depth_graph.YTick = depth_graph_ytick;
handles.depth_graph.XTick = [];
plot([2 2],[0 (-1*handles.pile_length)],'k','LineWidth',2);
text(2,1,'Effective Stress (kPa)','HorizontalAlignment','Center','VerticalAlignment','bottom');
text(2.1,-0.5,'0','HorizontalAlignment','Center','VerticalAlignment','bottom');
for i=1:handles.ln
    layer_number=i;
    starting_depth(1,i)=(cell2mat(handles.property_table_data(i,2)));
    end_depth(1,i) = (cell2mat(handles.property_table_data(i,3)));
    saturated_unit_weight(1,i)= (cell2mat(handles.property_table_data(i,4)));
    diameter = handles.pile_diameter;
end %for ends 
for i=1:handles.ln
    if cell2mat(handles.property_table_data(i,3))< handles.pile_diameter*15
    effective_stress_gui_data(1,i)= effective_stress_calculation(cell2mat(handles.property_table_data(i,3)),layer_number,starting_depth,end_depth,saturated_unit_weight,diameter);
    else
    handles.critical_stress=effective_stress_calculation(cell2mat(handles.property_table_data(i,3)),layer_number,starting_depth,end_depth,saturated_unit_weight,diameter);
    effective_stress_gui_data(1,i)= effective_stress_calculation(cell2mat(handles.property_table_data(i,3)),layer_number,starting_depth,end_depth,saturated_unit_weight,diameter);
    end %if ends
end %for ends

if handles.critical_stress < effective_stress_gui_data(1,i)
    handles.critical_stress = effective_stress_gui_data(1,i);
end %if ends

handles.graphic_scale = 1/handles.critical_stress;

plot_starting_point_x =2;
for i=1:handles.ln
    text_name="Layer " +i;
    text(4.75,(starting_depth(1,i)+end_depth(1,i))/-2,num2str(text_name),'HorizontalAlignment','right','VerticalAlignment','bottom');
    if effective_stress_gui_data(1,i)< handles.critical_stress
        if i==1
            plot_end_point_x=plot_starting_point_x+handles.graphic_scale*effective_stress_gui_data(1,i);
        else
            plot_end_point_x=plot_starting_point_x+handles.graphic_scale*(effective_stress_gui_data(1,i)-effective_stress_gui_data(1,i-1));
        end %if ends
        plot([plot_starting_point_x plot_end_point_x] ,[(-1*starting_depth(1,i)) (-1*end_depth(1,i))],'k','LineWidth',2);
        text_name=effective_stress_gui_data(1,i);
        text(plot_end_point_x,(-1*end_depth(1,i)),num2str(text_name),'HorizontalAlignment','left','VerticalAlignment','bottom');
        plot_starting_point_x = plot_end_point_x;
    else
        if i==1
            plot_end_point_x=plot_starting_point_x+handles.graphic_scale*(-1*15*handles.pile_diameter);
        else
            plot_end_point_x=plot_starting_point_x+handles.graphic_scale*(handles.critical_stress-effective_stress_gui_data(1,i-1));
        end % if ends
        plot([plot_starting_point_x plot_end_point_x] ,[(-1*starting_depth(1,i)) -1*15*handles.pile_diameter],'k','LineWidth',2);
        text_name=effective_stress_gui_data(1,i)+" (Dcr= " +15*handles.pile_diameter+"m)" ;
        text(plot_end_point_x,(-1*15*handles.pile_diameter)-0.5,num2str(text_name),'HorizontalAlignment','left','VerticalAlignment','bottom');
        plot ([plot_end_point_x plot_end_point_x],[-1*handles.pile_diameter*15 -1*handles.pile_length],'k','LineWidth',2);
        text_name=effective_stress_gui_data(1,i);
        text(plot_end_point_x,(-1*end_depth(1,i)),num2str(text_name),'HorizontalAlignment','left','VerticalAlignment','bottom');
    end %if ends
end % for ends

% --- Executes during object creation, after setting all properties.
% Update handles structure
guidata(hObject, handles);

function soil_type_panel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to soil_type_panel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in RB_cohesive.
function RB_cohesive_Callback(hObject, eventdata, handles)
% hObject    handle to RB_cohesive (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RB_cohesive

% The code below opens the visibility of editable text boxes

handles.property_panel.Visible = 'on';
handles.EDT_friction_angle.Enable = 'off';
handles.EDT_nq.Enable = 'off';
handles.EDT_undrained_shear_strength.Enable = 'on';
handles.EDT_adhesion_factor.Enable = 'on';
set(handles.RB_cohesionless, 'Value', 0);
handles.property_table_data(handles.selected_item-1 , 1) = {'Cohesive'};
handles.property_table_data(handles.selected_item-1 , 7) = {handles.adjusted_value};
handles.property_table_data(handles.selected_item-1 , 8) = {handles.adjusted_value};

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in RB_cohesionless.
function RB_cohesionless_Callback(hObject, eventdata, handles)
% hObject    handle to RB_cohesionless (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RB_cohesionless

% The code below opens the visibility of editable text boxes

handles.property_panel.Visible = 'on';
handles.EDT_friction_angle.Enable = 'on';
handles.EDT_nq.Enable = 'on';
handles.EDT_undrained_shear_strength.Enable = 'off';
handles.EDT_adhesion_factor.Enable = 'off';
set(handles.RB_cohesive, 'Value', 0);
handles.property_table_data(handles.selected_item-1 , 1) = {'Cohesionless'};
handles.property_table_data(handles.selected_item-1 , 5) = {handles.adjusted_value};
handles.property_table_data(handles.selected_item-1 , 6) = {handles.adjusted_value};

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in Pub_save_the_layer.
function Pub_save_the_layer_Callback(hObject, eventdata, handles)
% hObject    handle to Pub_save_the_layer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.updated_name_of_button = "Layer " + (handles.selected_item-1) + " is saved!";
set(handles.Pub_save_the_layer,'String',handles.updated_name_of_button);
handles.property_table.Data = handles.property_table_data;
% Update handles structure
guidata(hObject, handles);

function EDT_starting_depth_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_starting_depth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_starting_depth as text
%        str2double(get(hObject,'String')) returns contents of EDT_starting_depth as a double

handles.starting_depth = str2double(get(hObject,'String'));
handles.property_table_data(handles.selected_item-1 , 2) = {handles.starting_depth};
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function EDT_starting_depth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_starting_depth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDT_end_depth_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_end_depth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_end_depth as text
%        str2double(get(hObject,'String')) returns contents of EDT_end_depth as a double

handles.end_depth = str2double(get(hObject,'String'));
handles.property_table_data(handles.selected_item-1 , 3) = {handles.end_depth};
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function EDT_end_depth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_end_depth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDT_saturated_unit_weight_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_saturated_unit_weight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_saturated_unit_weight as text
%        str2double(get(hObject,'String')) returns contents of EDT_saturated_unit_weight as a double

handles.saturated_unit_weight = str2double(get(hObject,'String'));
handles.property_table_data(handles.selected_item-1 , 4) = {handles.saturated_unit_weight};
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function EDT_saturated_unit_weight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_saturated_unit_weight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDT_undrained_shear_strength_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_undrained_shear_strength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_undrained_shear_strength as text
%        str2double(get(hObject,'String')) returns contents of EDT_undrained_shear_strength as a double

handles.undrained_shear_strength = str2double(get(hObject,'String'));
handles.property_table_data(handles.selected_item-1 , 5) = {handles.undrained_shear_strength};
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function EDT_undrained_shear_strength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_undrained_shear_strength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDT_adhesion_factor_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_adhesion_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_adhesion_factor as text
%        str2double(get(hObject,'String')) returns contents of EDT_adhesion_factor as a double

handles.adhesion_factor = str2double(get(hObject,'String'));
handles.property_table_data(handles.selected_item-1 , 6) = {handles.adhesion_factor};
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function EDT_adhesion_factor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_adhesion_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDT_friction_angle_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_friction_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_friction_angle as text
%        str2double(get(hObject,'String')) returns contents of EDT_friction_angle as a double

handles.friction_angle = str2double(get(hObject,'String'));
handles.property_table_data(handles.selected_item-1 , 7) = {handles.friction_angle};
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function EDT_friction_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_friction_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDT_nq_Callback(hObject, eventdata, handles)
% hObject    handle to EDT_nq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDT_nq as text
%        str2double(get(hObject,'String')) returns contents of EDT_nq as a double

handles.nq = str2double(get(hObject,'String'));
handles.property_table_data(handles.selected_item-1 , 8) = {handles.nq};
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function EDT_nq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDT_nq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected cell(s) is changed in property_table.
function property_table_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to property_table (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in property_table.
function property_table_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to property_table (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
