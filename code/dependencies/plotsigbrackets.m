function [result1,result2,to] = plotsigbrackets(ds,gs,varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ################################################################# %% DESCRIPTION
%FUNCTION  short desc.
%
% USAGE:
%     out = template(in) process with default settings
% 
%     out = template(in,optional1) process using optional argument 1
% 
%     out = template(___,Name,Value,...) process with Name-Value pairs used to control aspects 
%     of the process
% 
%     Parameters include:
% 
%     'param1'          -   (default = X) Scalar value, parameter to do something
% 
%     'param2'          -   (default = X) Scalar value, parameter to do something
% 
% INPUT:
%     in    - input as a vector
%
% OUTPUT:
%     out   - output as a vector
%
% EXAMPLES:
%
%     % run function using default values
%     out = template(in,varargin)
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
% %% Prepare default settings
%     def_param2              = 1;        
%     def_param3              = 1;             
%     
% %% Parse inputs
%     p = inputParser;
%     addRequired(p,'in',@(x) ~isempty(x) && ~all(isnan(x(:))));  
%     addOptional(p,'param2',def_param1,@(x) isnumeric(x) && isscalar(x)); 
%     addParameter(p,'param3',def_param2,@(x) isnumeric(x) && isscalar(x));   
%     parse(p,in,varargin{:});
% 
% %% Retrieve parameters 
%     config = p.Results;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ################################################################# %% INPUT ARGUMENTS CHECK
%% Parse inputs
    inp = inputParser;
    addRequired(inp,'ds',@(x) isnumeric(x) && ~isempty(x) && ~all(isnan(x(:)))); 
    addRequired(inp,'gs',@(x) isnumeric(x) && ~isempty(x) && ~all(isnan(x(:)))); 
    addParameter(inp,'fig',gcf,@(x) ~isempty(x));   
    addParameter(inp,'ax',gca,@(x) ~isempty(x));   
    
    % stats settings    
    addParameter(inp,'test','anova',@(x) any(validatestring(x,{'anova','kw','friedman','repeatt'})));         
    addParameter(inp,'display',1,@(x) islogical(x) || isscalar(x));    
    addParameter(inp,'exactp',0,@(x) islogical(x) || isscalar(x));        
    addParameter(inp,'test_only',0,@(x) islogical(x) || isscalar(x));    
    
    % bracket settings
    addParameter(inp,'bracket_y_base',inf,@(x) isnumeric(x) && ~isempty(x));   
    addParameter(inp,'bracket_y_gap_coeff',15,@(x) isnumeric(x) && ~isempty(x)); % brackets are separated by range(axis Y limits)/bracket_y_gap_coeff
    addParameter(inp,'bracket_text_y_gap_coeff',-1,@(x) isnumeric(x) && ~isempty(x)); % text is separated from brackets by bracket_y_gap/text_y_gap_coeff
    addParameter(inp,'bracket_colour','k',@(x) ischar(x) || isnumeric(x));   
    addParameter(inp,'bracket_line_width',1,@(x) isnumeric(x));   
    addParameter(inp,'bracket_text_fsize',10,@(x) isnumeric(x));   
    addParameter(inp,'plot_brackets',1,@(x) isnumeric(x));   
    
    % omnibus settings
    addParameter(inp,'omnibus_text_fsize',8,@(x) isnumeric(x));   
    addParameter(inp,'omnibus_ydrop_coeff',2,@(x) isnumeric(x)); % the vertical drop of omnibus bars is bracket_y_gap/omnibus_ydrop_coeff
    addParameter(inp,'omnibus_line_width',1,@(x) isnumeric(x));   
    addParameter(inp,'omnibus_colour','k',@(x) ischar(x) || isnumeric(x));   
    addParameter(inp,'plot_omnibus',0,@(x) isnumeric(x));   
    addParameter(inp,'omnibus_text_y_gap_coeff',10,@(x) isnumeric(x) && ~isempty(x)); % text is separated from brackets by bracket_y_gap/text_y_gap_coeff
    
    
    % parse inputs
    parse(inp,ds,gs,varargin{:});
    config = inp.Results;
    to = [];
    
% close all; ds =[rand(100,1).*2;rand(100,1).*3;rand(100,1).*4;rand(100,1).*5]; gs =[ones(100,1);ones(100,1).*2;ones(100,1).*3;ones(100,1).*4]; figure;meanplot(ds,gs); plotsigbrackets(ds,gs);

%% ##################################### Statistical tests
    % make sure correct axis is current
    set(config.fig,'CurrentAxes',config.ax);
    hold on;
    axis manual

    % get some information
    ds = double( config.ds );
    gs = double( config.gs );
    ngroups = length(unique(gs));
    
    %% Run omnibus test and comparisons
    % If we want to plot the brackets we need to run the multiple
    % comparisons. Either the user can provide the omnibus and post-hoc
    % p-values or just the post-hoc ones, but they cannot just provide the
    % omnibus value on its own. Otherwise we have no stats model to run our
    % pairwise stats on.
    sts = NaN;
    switch config.test
        case {'anova'}
            [omnip,a,sts] = anova1(ds,gs,'off');
            mens = accumarray(gs,ds,[],@nanmean);
            stds = accumarray(gs,ds,[],@nanstd);
            sems = accumarray(gs,ds,[],@nansem);            
            eta = a{2,2} ./ a{4,2}; % Eta-squared = SSbetween / SStotal
            result1 = [a{2,3} a{3,3} a{2,5} a{2,6} eta sts.means];
            
            if config.display
                disp(sprintf('\t\tANOVA: F(%d,%d) = %.1f, p = %s, eta2 = %.4f\n\t\tgroup n: %s\n\t\tmeans: %s\n\t\tstd: %s\n\t\tsem: %s',result1(1),result1(2),result1(3),mat2str(result1(4),3),result1(5),mat2str(sts.n),mat2str(mens(:)',3),mat2str(stds(:)',3),mat2str(sems(:)',3) ) )
                if config.exactp
                    disp(result1(4));
                end
            end                
        case {'kw'}
            [omnip,a,sts] = kruskalwallis(ds,gs,'off');
            meds = accumarray(gs,ds,[],@nanmedian);
            stds = accumarray(gs,ds,[],@(x) mad(x,1)); 
            epsilon = a{2,5} ./ ( (sum(~isnan(ds(:))).^2-1)/(sum(~isnan(ds(:)))+1) ); % epsilon squared
            result1 = [a{2,3} a{3,3} a{2,5} a{2,6} epsilon meds(:)'];  

            if config.display
                disp(sprintf('\t\tKruskal-wallis: X2(%d,%d) = %.1f, p = %s, epsilon2 = %.4f\n\t\tgroup n: %s\n\t\tmedians: %s\n\t\tmad: %s',result1(1),result1(2),result1(3),mat2str(result1(4),3),result1(5),mat2str(sts.n),mat2str(meds(:)',3),mat2str(stds(:)',3) ) )
                if config.exactp
                    disp(result1(4));
                end            
            end  
        case {'friedman'}
            [~,gidx] = sort(gs,'ascend');
            ds2 = ds(gidx);
            ds3 = reshape(ds2,[],ngroups);
            [omnip,a,sts] = friedman(ds3,1,'off');
            meds = accumarray(gs,ds,[],@nanmedian);      
            stds = accumarray(gs,ds,[],@(x) mad(x,1));                
            result1 = [a{2,3} a{3,3} a{2,5} a{2,6} meds(:)'];   
            
            if config.display
                disp(sprintf('\t\tFriedman: X2(%d,%d) = %.1f, p = %s\n\t\tgroup n: %s\n\t\tmedians: %s\n\t\tmad: %s',result1(1),result1(2),result1(3),mat2str(result1(4),3),mat2str(sts.n),mat2str(meds(:)',3),mat2str(stds(:)',3) ) )
                if config.exactp
                    disp(result1(4));
                end            
            end   
        case {'repeatt'}
            [~,gidx] = sort(gs,'ascend');
            ds2 = ds(gidx);
            ds3 = reshape(ds2,[],ngroups);
            [~,omnip,~,sts] = ttest(ds3(:,1),ds3(:,2));
            meds = accumarray(gs,ds,[],@nanmean);      
            stds = accumarray(gs,ds,[],@nanstd);  
            sems = accumarray(gs,ds,[],@nansem);  
            result1 = [sts.df sts.tstat omnip meds(:)'];      
            if config.display
                disp(sprintf('\t\tPaired ttest: t(%d) = %.1f, p = %s\n\t\tgroup n: %s\n\t\tmeans: %s\n\t\tSD: %s\n\t\tSEM: %s',sts.df,sts.tstat,mat2str(omnip,3),mat2str([sum(~isnan(ds3(:,1))) sum(~isnan(ds3(:,2)))]),mat2str(meds(:)',3),mat2str(stds(:)',3),mat2str(sems(:)',3) ) )
                if config.exactp
                    disp(omnip);
                end            
            end              
    end        
     
    %% If more than 2 groups, run multiple comparisons
    % Thankfully multcompare can work out and adapt to the omnibus test that
    % was run
    if ngroups>2 && omnip<=.05
        if ~isstruct(sts)
            error('Omnibus p-value provided but no multiple comparison test results given, either provide these or disable significance brackets (set bbars to 0)');
        end
        [c,m,h,~] = multcompare(sts,'display','off','ctype','dunn-sidak');
        pindx = c(:,end);
        gvals = c(:,1:2);
        xvals = sort(unique(gs));

        for pp = 1:length(pindx)
            if pindx(pp)<=.05
                disp(sprintf('\t\t\tgroup %d v %d: p = %s',xvals(gvals(pp,1)),xvals(gvals(pp,2)),mat2str(pindx(pp),3)) ) 
                if config.exactp
                    disp(pindx(pp));
                end                  
            end
        end
    end
    if config.test_only
        result2 = [];
        if ngroups>2 && omnip<=.05 % if we are going to need pairwise brackets
            for bb = 1:length(pindx) % for every multiple comparison computed
                if pindx(bb)<=.05 % if it was significant
                    x1 = xvals( gvals(bb,1) ); % the starting x coordinate
                    x2 = xvals( gvals(bb,2) ); % the ending x coordinate
                    result2 = [result2; x1 x2 pindx(bb)];
                end
            end
        end
        return
    end
    
%% ##################################### Add pairwise brackets
    if isinf(config.bracket_y_base) % inf is the default setting, which means we will use the axis y limit
        bracket_y_base = config.ax.YLim(2) + 0.08.*range(config.ax.YLim);
    else
        bracket_y_base = config.bracket_y_base; % user value
    end
    bracket_y_gap = range(config.ax.YLim) ./ config.bracket_y_gap_coeff;
    text_y_gap = bracket_y_gap ./ config.bracket_text_y_gap_coeff;
    
    xvals = sort(unique(gs));
    ylevel_now = bracket_y_base;
    result2 = [];

    if ngroups>2 && omnip<=.05 && config.plot_brackets % if we are going to need pairwise brackets
        for bb = 1:length(pindx) % for every multiple comparison computed
            if pindx(bb)<=.05 % if it was significant
                %% draw pairwise bracket
                x1 = xvals( gvals(bb,1) ); % the starting x coordinate
                x2 = xvals( gvals(bb,2) ); % the ending x coordinate
                
                y1 = ylevel_now; % the starting y coordinate
                y2 = ylevel_now; % the ending y coordinate
        
                hold on;
                plot([x1 x2],[y1 y2],'Color',config.bracket_colour,'LineWidth',config.bracket_line_width,'Clipping','off');
        
                %% add pairwise test result
                text_str = sprintf('%s',strrep(num2str(omnip,'%.3f'),'0.','.'));
                if pindx(bb)<=.05
                    text_str = {'*'};
                    if pindx(bb)<=.01
                        text_str = {'**'};                    
                        if pindx(bb)<=.001
                            text_str = {'***'};   
                        end
                    end
                end
                if config.bracket_text_fsize>0
                    text(mean([x1 x2]),mean([y1 y2])+text_y_gap,text_str,'FontSize',config.bracket_text_fsize,'HorizontalAl','center','VerticalAl','bottom')
                end
        
                %% increment future bracket y-level
                ylevel_now = ylevel_now + bracket_y_gap;
                result2 = [result2; x1 x2 pindx(bb)];
            end
        end
    end

%% ##################################### Add omnibus bracket
    ydrop = bracket_y_gap ./ config.omnibus_ydrop_coeff; % how much will the caps on the ends drop vertically
    text_y_gap = bracket_y_gap ./ config.omnibus_text_y_gap_coeff;

    if config.plot_omnibus % if we are going to need the omnibus bracket
        %% draw omnibus bracket
        x1 = nanmin(xvals); % the starting x coordinate
        x2 = nanmax(xvals); % the ending x coordinate

        y1 = ylevel_now; % the starting y coordinate
        y2 = ylevel_now; % the ending y coordinate

        hold on;
        errorbar([x1 x2],[y1 y2],[ydrop ydrop],[ydrop ydrop],'Color',config.omnibus_colour,'LineWidth',config.omnibus_line_width,'CapSize',0,'Clipping','off');

        % add omnibus test result
        if omnip<=.001
            S = sprintf('{\\itp} = %0.1e',omnip);
            S = regexprep(S, {'e[+-]0+\>', 'e\+?(-?)0*(\d+)'}, {'', '{\\times}10^{$1$2}'});
            text_str = S;                           
        else
            text_str = cellstr(sprintf('{\\itp} = %s',strrep(num2str(omnip,'%.3f'),'0.','.')));                    
        end
          

        to = text(mean([x1 x2]),mean([y1 y2])+text_y_gap,text_str,'FontSize',config.omnibus_text_fsize,'HorizontalAl','center','VerticalAl','bottom');
    end








