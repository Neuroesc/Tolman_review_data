function [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params)
% TOL_plotter, plots data figures for Duvelle and Grieves (2026)
% Main code to plot figures for: Duvelle and Grieves (2026) Tolman's Sunburst Maze 80 
% years on: A meta-analysis reveals poor replicability and little evidence for 
% shortcutting. European Journal of Neuroscience. DOI: 
% https://doi.org/10.1111/ejn.70365
% Highlights shortcuts, cued paths and plots the proportion of choices to each
% path. Data are stored in TOL_data and accessed directly from the table
% provided by that code.
% 
% USAGE
%
% [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params)
%
% INPUT
%
% 'ax' - Axis handle, where to produce plot
%
% 'dat' - Table, produced by TOL_data
%
% 'idx' - Row index into dat, specifies which experiment TOL_plotter should plot
%       the results from
%
% 'params' - Optional, structure containing plotting settings, produced by TOL_main,
%       specifies which colours to use for shortcut shading etc
%
% OUTPUT
%
% 'hx' - Handle(s) to plotted data lines, 1xN handles
%
% 'px' - Handles to shading patches [shortcut, adjacent]
%
% 'lx' - Handles to lines showing chance lines [chance, p<.05, p<.01]
%
% 'c' - 1x2, mean and standard deviation of chance shuffle
%
% NOTES
% 1. The experiments of Dawson (1972) are not plotted using this function
%
% 2. Some experiments, such as Kendler et al. (1948,1949) report follow up stats
% of 20 combined trials, these provide only mean and standard deviations,
% TOL_plotter will detect  and handle these exceptions.
%
% 3. For plots in Duvelle and Grieves (2025), where multiple experiments (groups
% etc) were shown in some figures, the chance shuffle of the first group plotted
% was retained and any further chance shuffles were not shown. This is based on
% the idea that groups were often of similar sizes and so chance should be
% similar across groups. This was done only for visualisation.
%
% EXAMPLE
%
% % To plot Tolman et al.'s (1946) results:
% dat = TOL_data; % get data
% idx = find( ismember(dat.experiment,'Tolman_et_al_1946') ); % find row index for Tolman et al. 1946
% figure % create figure
% ax = gca; % get axis handle
% [hx,px,lx,c] = TOL_plotter(ax,dat,idx,[]); % use TOL_plotter to plot the data, chance level, shaded regions etc
% 
% SEE ALSO TOL_main, TOL_data

% HISTORY
%
% version 1.0.0, Release 06/05/25 Initial release
% version 1.1.0, Release 20/04/25 GitHub release
% version 2.0.0, Release 13/12/25 Publication release
% version 2.0.1, Release 14/12/25 Improved comments
% version 2.0.2, Release 05/01/26 Updated comments, finalised for publication
%
% NOTES
%
% AUTHOR 
%
% Roddy Grieves
% University of Glasgow, Sir James Black Building
% Neuroethology and Spatial Cognition Lab
% eMail: roddy.grieves@glasgow.ac.uk, eleonore.duvelle@glasgow.ac.uk
% Copyright 2025 Roddy Grieves

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION BODY
    if ~exist('params','var') || isempty(params)
        % default parameters for plots
        params = struct;
        params.cols = inferno(128); % general color scheme
        params.short_color = params.cols(90,:); % shortcut path color in plots
        params.choice_color = params.cols(1,:); % choice color in plots (c1-c6 is used below instead)
        params.choice_marker = 'd'; % marker to use showing % choices (m1-m6 is used below instead)  
        params.linestyle = '-'; % linestyle when plotting choice %   
        params.adjacent_color = params.cols(60,:); % adjacent path color in plots
        params.light_color = rgb('Fuchsia'); % cued path color in plots
        params.outer_color = rgb('SeaGreen'); % outer path color in plots
        params.other_color = rgb('SlateBlue'); % 'other' path color in plots
        params.nopref_color = rgb('DimGray'); % 'no pref' color for plotting
    
        params.chance_color = [.5 .5 .5; .5 .5 .5]; % chance line color
        params.shading_alpha = 0.2; % transparency of adjacent/shortcut shaded areas
        params.c1 = rgb('Black'); % color 1
        params.c2 = rgb('Crimson'); % color 2
        params.c3 = rgb('ForestGreen'); % color 3
        params.c4 = rgb('SlateBlue'); % color 4
        params.c5 = rgb('Fuchsia'); % color 5
        params.c6 = rgb('Navy'); % color 6
        params.m1 = 'o'; % marker 1
        params.m2 = '^'; % marker 2
        params.m3 = 's'; % marker 3
        params.m4 = 'd'; % marker 4
        params.m5 = 'p'; % marker 5
        params.m6 = 'v'; % marker 6
        params.style_offset = 0; % used to offset color/style used
        params.res = 350; % resolution at which to save figures
    end

%%%%%%%%%%%%%%%% Chance line and shading
    if isempty(dat.mean{idx(1)}) % we want to plot percentage chosen not count
        n = sum(dat.choice{idx(1)},"all","omitmissing");
        c = sum(~isnan(dat.choice{idx(1)}));
        if ismember(dat.species{idx(1)},'human')
            ytext = '% participants';
        else
            ytext = '% animals';            
        end
    else
        n = round(sum(dat.mean{idx(1)},"all","omitmissing"));
        c = sum(~isnan(dat.mean{idx(1)}));
        ytext = '% choices';
    end
    o = (1:c)';
    iti = 1000;
    rindx = NaN(iti,c);
    for ii = 1:iti
        rn = randi(c,n,1);
        cn = o(rn);
        rindx(ii,:) = accumarray(cn,ones(size(cn)),size(o),@sum);
    end
    if isempty(dat.mean{idx(1)}) % we will plot percentage chosen not count
        pindx = rindx ./ n .* 100;
    else
        pindx = rindx;        
    end

    m = mean(pindx,"all",'omitmissing');
    s = std(pindx,[],"all",'omitmissing');
    v1 = 1.650.*s;
    v2 = 2.326.*s;
    hold on;
    l1 = line([-100 100],[m m],'Color',params.chance_color(1,:),'LineStyle','-','LineWidth',2);  
    l2 = line([-100 100],[m+v1 m+v1],'Color',params.chance_color(1,:),'LineStyle','--','LineWidth',1.5);
    l3 = line([-100 100],[m+v2 m+v2],'Color',params.chance_color(1,:),'LineStyle',':','LineWidth',1);
    lx = [l1 l2 l3];

    % p3 = patch(ax,[-100 -100 100 100],[0 m+v1 m+v1 0],'k','FaceColor',params.chance_color(1,:),'FaceAlpha',params.chance_shading(1),'EdgeColor','none');
    % p4 = patch(ax,[-100 -100 100 100],[m+v1 m+v2 m+v2 m+v1],'k','FaceColor',params.chance_color(2,:),'FaceAlpha',params.chance_shading(2),'EdgeColor','none');
    c = [m s];

%%%%%%%%%%%%%%%% Shortcut and adjacent shading
    % adjacent path shading
    adj = dat.adjacent(idx(1),:);
    x = [];
    y = [];
    for aa = 1:length(adj)
        a = adj(aa)-0.5;
        b = adj(aa)+0.5;
        x = [x a a b b a];
        y = [y 0 100 100 0 0];
    end
    p2 = patch(ax,x,y,'k','FaceColor',params.adjacent_color,'EdgeColor','none','FaceAlpha',params.shading_alpha); hold on;

    % shortcut shading
    shrt = dat.short(idx(1),:);
    x = [];
    y = [];    
    for aa = 1:length(shrt)
        a = shrt(aa)-0.5;
        b = shrt(aa)+0.5;
        x = [x a a b b a];
        y = [y 0 100 100 0 0];        
    end
    p1 = patch(ax,x,y,'k','FaceColor',params.short_color,'EdgeColor','none','FaceAlpha',params.shading_alpha); hold on;    
    px = [p1 p2];

%%%%%%%%%%%%%%%% Actual data
    hx = [];
    if isfield(params,'style_offset') && ~isempty(params.style_offset) && ~isnan(params.style_offset)
        offset = params.style_offset;
    else
        offset = 0;
    end
    for ii = 1:length(idx)
        if isempty(dat.mean{idx(ii)}) % we want to plot percentage chosen not count
            p5 = plot(ax,dat.paths{idx(ii)},dat.pchoice{idx(ii)},'k','LineStyle',params.linestyle,'Color',params.(sprintf('c%d',ii+offset)),'Marker',params.(sprintf('m%d',ii+offset)),'MarkerFaceColor',params.(sprintf('c%d',ii+offset)));
            ax.YLim = [0 max(dat.pchoice{idx(ii)},[],"all").*1.2];
            hx = [hx p5];
        else
            p5 = errorbar(ax,dat.mean{idx(ii)},dat.std{idx(ii)},'k','LineStyle',params.linestyle,'Color',params.(sprintf('c%d',ii+offset)),'Marker',params.(sprintf('m%d',ii+offset)),'MarkerFaceColor',params.(sprintf('c%d',ii+offset)));
            ax.YLim = [0 max(dat.mean{idx(ii)}+dat.std{idx(ii)},[],"all").*1.2];
            hx = [hx p5];            
        end
    end

%%%%%%%%%%%%%%%% General settings
    box off;
    ax.XLim = [min(dat.paths{idx(1)})-0.5 max(dat.paths{idx(1)})+0.5];
    ax.XTick = dat.paths{idx(1)};
    xlabel('Path choices')
    ylabel(ytext)
    
% %%%%%%%%%%%%%%%% Legend
%     if any(l)
%         if isfield(params,'legend_columns') && any(params.legend_columns)
%             ncol = params.legend_columns;
%         else
%             ncol = 1;
%         end
% 
%         [~,lh] = legendflex([p5,p3,p2,p4,p1],{'Choices','Shortcut path','Adjacent paths','Training route','Chance'},'anchor',{'e','e'},'ncol',ncol,'box','off','buffer',params.add_legend,'xscale',.5,'fontsize',9,'ref',params.axnow,'padding',[20 1 1]); 
%         if ~ebar
%             lh(8).FaceAlpha = p2.FaceAlpha;
%             lh(9).FaceAlpha = p3.FaceAlpha;
%         else
%             lh(7).FaceAlpha = p2.FaceAlpha;
%             lh(8).FaceAlpha = p3.FaceAlpha;
%         end
%     else
%         lh = [];
%     end

