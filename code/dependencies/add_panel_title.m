function ah = add_panel_title(text1,text2,varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ################################################################# %% DESCRIPTION
%FUNCTION  short desc.
%
% USAGE:
%           out = template(in) process with default settings
%
%           out = template(in,optional1) process using optional argument 1
%
%           out = template(___,Name,Value,...) process with Name-Value pairs used to control aspects 
%           of the process
%
%           Parameters include:
%
%           'param1'          -   (default = X) Scalar value, parameter to do something
%
%           'param2'          -   (default = X) Scalar value, parameter to do something
%
% EXAMPLES:
%
%           % run function using default values
%           out = template(in,varargin)
%
% See also: FUNCTION2 FUNCTION3

% HISTORY:
% version 1.0.0, Release 00/00/00 Initial release
%
% Author: Roddy Grieves
% UCL, 26 Bedford Way
% eMail: r.grieves@ucl.ac.uk
% Copyright 2020 Roddy Grieves

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ################################################################# %% INPUT ARGUMENTS CHECK
%% Prepare default settings     
    def_fontsize            = [18 10];  
    def_xoffset             = [0 0];     
    def_yoffset             = [0 0]; 
    def_width               = [20 20]; 
    def_fig                 = gcf;        
    def_ax                  = gca;             
    
%% Parse inputs
    p = inputParser;
    addRequired(p,'text1',@(x) ischar(x) | isstring(x));   
    addRequired(p,'text2',@(x) ischar(x) | isstring(x));   
    addParameter(p,'fontsize',def_fontsize,@(x) isnumeric(x));   
    addParameter(p,'xoffset',def_xoffset,@(x) isnumeric(x));           
    addParameter(p,'yoffset',def_yoffset,@(x) isnumeric(x));   
    addParameter(p,'width',def_width,@(x) isnumeric(x));      
    addParameter(p,'fig',def_fig,@(x) ~isempty(x));   
    addParameter(p,'ax',def_ax,@(x) ~isempty(x));       
    parse(p,text1,text2,varargin{:});

%% Retrieve parameters 
    config = p.Results;
    
%% ##################################### Heading 2
%% #################### Heading 3
%% Heading 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ################################################################# %% FUNCTION BODY
    % make sure correct axis is current
    set(config.fig,'CurrentAxes',config.ax);

    % add annotations
    if numel(config.xoffset)<2
        config.xoffset = config.xoffset([1 1]);
    end
    if numel(config.yoffset)<2
        config.yoffset = config.yoffset([1 1]);
    end    
    if numel(config.fontsize)<2
        config.fontsize = config.fontsize([1 1]);
    end
    if numel(config.width)<2
        config.width = config.width([1 1]);
    end
    
    xnow = config.ax.Position(1);
    ynow = config.ax.Position(2) + config.ax.Position(4);
    
    ah{1} = annotation('textbox','Units','pixels','Position',[xnow-30+config.xoffset(1), ynow+30+config.yoffset(1), config.ax.Position(3)+config.width(1), 20],'string',(config.text1),'FontSize',config.fontsize(1),'LineStyle','none','interpreter','tex','HorizontalAl','left'); 
    ah{2} = annotation('textbox','Units','pixels','Position',[xnow-5+config.xoffset(2), ynow+20+config.yoffset(2), config.ax.Position(3)+config.width(2), 20],'string',config.text2,'FontSize',config.fontsize(2),'LineStyle','none','interpreter','tex','HorizontalAl','left');
























