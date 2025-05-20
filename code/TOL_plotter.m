function [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params)
% TOL_plotter
% Main code to plot figures for Duvelle and Grieves review
% See individual figure function comments for details about where the data were collected or defined
% 
% SEE ALSO TOL_main

% HISTORY
%
% version 1.0.0, Release 06/05/25 Initial release
%
% AUTHOR 
% Roddy Grieves
% University of Glasgow, Sir James Black Building
% Neuroethology and Spatial Cognition Lab
% eMail: roddy.grieves@glasgow.ac.uk
% Copyright 2025 Roddy Grieves

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION BODY
%%%%%%%%%%%%%%%% Chance line and shading
    if isempty(dat.mean{idx(1)}) % we want to plot percentage chosen not count
        n = sum(dat.choice{idx(1)},"all","omitmissing");
        c = sum(~isnan(dat.choice{idx(1)}));
    else
        n = round(sum(dat.mean{idx(1)},"all","omitmissing"));
        c = sum(~isnan(dat.mean{idx(1)}));
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
    l1 = line([-100 100],[m m],'Color',params.chance_color(1,:),'LineStyle','-');  
    l2 = line([-100 100],[m+v1 m+v1],'Color',params.chance_color(1,:),'LineStyle','--');
    l3 = line([-100 100],[m+v2 m+v2],'Color',params.chance_color(1,:),'LineStyle',':');
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

% %%%%%%%%%%%%%%%% Training route
%     p4 = line(params.axnow,[params.training_route params.training_route],[params.axnow.YLim(1) 100],'Color',params.training_color,'LineStyle',params.training_style);

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
    ylabel('% choices')
    
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

