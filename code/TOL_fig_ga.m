function TOL_fig_ga(config,params,dat)
% TOL_fig_stats1
% Figure 10
% Overall stats results figure for:
% Duvelle and Grieves (2025) Rethinking Tolman's Sunburst Maze: A Critical Review of a Classic Spatial Inference Task
% See TOL_data for details about where the data were collected or defined
% 
% SEE ALSO TOL_main, TOL_data, TOL_plotter

% HISTORY
%
% version 1.0.0, Release 15/04/25 Initial release
% version 1.1.0, Release 20/04/25 GitHub release
%
% NOTES
% Panel d is loaded as an image file, .svg and .png provided in this repository
%
% AUTHOR 
% Roddy Grieves
% University of Glasgow, Sir James Black Building
% Neuroethology and Spatial Cognition Lab
% eMail: roddy.grieves@glasgow.ac.uk, eleonore.duvelle@glasgow.ac.uk
% Copyright 2025 Roddy Grieves & Eleonore Duvelle

%%%%%%%%%%%%%%%% ARGUMENT CHECK


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION BODY
    % Create figure
    fig_now = figure('Units','pixels','Position',[50 50 210.*4 297.*3],'visible','on');
    set(gcf,'InvertHardCopy','off'); % gives the figure a grey background but means it will save white lines as white    
    set(gcf,'color','w'); % makes the background colour white
    fs = [14 13];

    hbuff = 30;
    vbuff = 220;
    fsiz = 6;

%%%%%%%%%%%%%%%% Choice schematic 
    xnow = 20;
    ynow = 580;
    ax1 = axes('Units','pixels','Position',[xnow ynow 500 230],'Color','none');
        % ah = add_panel_title('a',sprintf(''),'yoffset',-40,'xoffset',50,'width',400,'fontsize',fs);
        fname = [config.schematic_dir 'choices_ga.png'];
        im = imread(fname,"png");
        image(im);
        axis off;
        box off
        daspect([1 1 1])

%%%%%%%%%%%%%%%% 
    max_or_median = 2; % 1 = max, 2 = mean

    choice_nums = NaN(size(dat,1),7);        
    choice_z = NaN(size(dat,1),5);
    yop = NaN(size(dat,1),1);
    spc = NaN(size(dat,1),1); 
    eidx = dat.display_experiment;
    for ii = 1:size(dat,1)
        % if any(ismember(dat.experiment{ii},{'Harley_1979'}))
        %     continue
        % end
        % if any(ismember(dat.experiment{ii},{'Chamberlain_1947'}))
        %     continue
        % end
        if ~any(dat.main(ii))
            continue
        end
        if isempty(dat.pchoice{ii})
            c = dat.mean{ii};
        else
            c = dat.pchoice{ii};
        end
        
        s_idx = [];
        if ~any(isnan(dat.short(ii,:)))
            s_idx = dat.short(ii,:);
            if max_or_median==2
                choice_nums(ii,1) = mean(c(s_idx),"all",'omitmissing');
            elseif max_or_median==1 
                choice_nums(ii,1) = max(c(s_idx),[],"all",'omitmissing');  
            end
        end
        a_idx = [];
        if ~any(isnan(dat.adjacent(ii,:)))
            a_idx = dat.adjacent(ii,:);
            if max_or_median==2
                choice_nums(ii,2) = mean(c(a_idx),"all",'omitmissing');
            elseif max_or_median==1 
                choice_nums(ii,2) = max(c(a_idx),[],"all",'omitmissing');  
            end              
        end

        o_idx = [];
        if ~any(isnan(dat.outer(ii,:)))
            o_idx = dat.outer(ii,:);
            if max_or_median==2
                choice_nums(ii,3) = mean(c(o_idx),"all",'omitmissing');
            elseif max_or_median==1 
                choice_nums(ii,3) = max(c(o_idx),[],"all",'omitmissing');  
            end                  
        end
        l_idx = [];
        if ~all(isnan(dat.light(ii,:)))
            l_idx = dat.light(ii,:);
            vals = NaN(length(l_idx),1);
            for kk = 1:length(l_idx)
                if isinteger(l_idx(kk))
                    vals(kk,1) = c(l_idx(kk));
                elseif ~isnan(l_idx(kk))
                    x = dat.paths{ii};
                    y = c;
                    nidx = isnan(x) | isnan(y);
                    vals(kk,1) = interp1(x(~nidx),y(~nidx),l_idx(kk),'linear');
                    l_idx(kk) = NaN;
                end
            end
            l_idx = l_idx(~isnan(l_idx));
            if max_or_median==2
                choice_nums(ii,4) = mean(vals,"all",'omitmissing');
            elseif max_or_median==1 
                choice_nums(ii,4) = max(vals,[],"all",'omitmissing');  
            end                
        end

        idx = true(size(c));
        idx([s_idx a_idx o_idx l_idx]) = false;    
        v = c(idx);
        % choice_nums(ii,4) = mean(v,"all",'omitmissing');
        choice_nums(ii,5) = max(v,[],"all",'omitmissing');            
        choice_nums(ii,6:7) = dat.chance_dist(ii,1:2);
    
        choice_z(ii,:) = ( choice_nums(ii,1:5) - dat.chance_dist(ii,1) ) ./ dat.chance_dist(ii,2);
        yop(ii) = dat.year(ii);
        spc(ii) = strcmp(dat.species{ii},'human'); % 1 = human, 0 = animal
    end
    rindx = all(isnan(choice_nums),2);
    choice_nums(rindx,:) = [];
    yop(rindx) = [];
    spc(rindx) = [];    
    choice_z(rindx,:) = [];
    eidx(rindx,:) = [];

    [~,i] = sort(yop,1,"ascend","MissingPlacement",'last');
    choice_nums = choice_nums(i,:);
    yop = yop(i);
    spc = spc(i);
    choice_z = choice_z(i,:);
    eidx = eidx(i,:);

%%%%%%%%%%%%%%%% Tolman results
    xnow = 70;
    ynow = ynow-170;
    ax2c = axes('Units','pixels','Position',[xnow ynow 180 120]);
        ah = add_panel_title('',sprintf('Tolman et al. (1946) results'),'yoffset',0,'xoffset',-10,'width',400,'fontsize',fs);

        x = 1:18;
        y0 = [9 5 1 2 2 19 3 4 1 4 2 1 NaN NaN NaN NaN NaN NaN];
        y = y0./sum(y0,"all",'omitmissing').*100;
        
        b = bar(x,y,0.9,'w','stacked');
        b.FaceColor = 'flat';
        b.CData = ones(size(b.CData));
        b.CData(6,:) = params.short_color;
        b.CData(9,:) = params.adjacent_color;
        b.CData(10,:) = params.adjacent_color;
        b.CData(1,:) = params.outer_color;
        b.CData(18,:) = params.outer_color;
        b.CData(5,:) = params.light_color;

        % additional axis settings
        ax = gca;
        ax.XLim = [0.5 12.5];
        ax.XTick = 1:18;
        ax.XDir = 'reverse';
        ylabel('% Animals')
        xlabel('Path #')
        box off
        ax.YLim = [0 40];

        yp = y ./ sum(y,'all','omitmissing') .* 100;
        for ii = 1:length(y)
            text(ii,y(ii),sprintf('%.f',y0(ii)),'FontSize',8,'HorizontalAlignment','center','VerticalAlignment','bottom');
        end

        % yp = y ./ sum(y,'all','omitmissing') .* 100;
        % for ii = 1:length(yp)
        %     text(ii,y(ii),sprintf('%.f%%',yp(ii)),'FontSize',8,'HorizontalAlignment','center','VerticalAlignment','bottom');
        % end

%%%%%%%%%%%%%%%% Main effect
    xnow = ax2c.Position(1)+ax2c.Position(3)+60;
    ynow = ynow;
    ax2c = axes('Units','pixels','Position',[xnow ynow 180 120]);
        ah = add_panel_title('',sprintf('All study results'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        choice_z_thresh = choice_z;
        choice_z_thresh(choice_z_thresh < 1.96) = NaN;
        [m,mifo] = max(choice_z_thresh,[],2,'omitmissing');
        mifo(isnan(m)) = 6;

        spc = logical(spc);
        coef_animal0 = [sum(mifo(~spc)==1),sum(mifo(~spc)==2),sum(mifo(~spc)==3),sum(mifo(~spc)==4),sum(mifo(~spc)==5),sum(mifo(~spc)==6)];
        coef_human0 = [sum(mifo(spc)==1),sum(mifo(spc)==2),sum(mifo(spc)==3),sum(mifo(spc)==4),sum(mifo(spc)==5),sum(mifo(spc)==6)];

        coef_animal = coef_animal0./sum([coef_animal0+coef_human0],"all",'omitmissing').*100;
        coef_human = coef_human0./sum([coef_animal0+coef_human0],"all",'omitmissing').*100;

        y = coef_animal0+coef_human0;
        x = 1:length(y);

        l = {'Shortcut','Adjacent','Outer','Cued','Other','No Pref.'};
        [~,i] = sort(y,'descend');
        y = y(i);
        l = l(i);
        coef_animal = coef_animal(i);
        coef_human = coef_human(i);

        b = bar(x,[coef_animal(:) coef_human(:)],0.9,'k','stacked');

        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        cols = [params.short_color;params.adjacent_color;params.outer_color;params.light_color;rgb('White');rgb('DimGray')];
        b(1).CData = cols(i,:);
        b(2).CData = cols(i,:);
        b(1).FaceAlpha = 1.0;
        b(2).FaceAlpha = 0.5;
        hatchfill2(b(2),'single');

        % additional axis settings
        ax = gca;
        ax.XLim = [0.5 6.5];
        ax.XTickLabel = l;
        ylabel('% Experiments')
        box off
        ax.YLim = [0 32];

        yp = y ./ sum(y,'all','omitmissing') .* 100;
        for ii = 1:length(yp)
            text(ii,yp(ii),sprintf('%.f',y(ii)),'FontSize',8,'HorizontalAlignment','center','VerticalAlignment','bottom');
        end

        uy = range(ax.YLim)/100;
        ux = range(ax.XLim)/100;
        f = 10;
        fx = ux*f;
        fy = uy*f;
        bx = ux*47;
        by = -uy*0;
        px = patch([ax.XLim(2)-fx ax.XLim(2)-fx ax.XLim(2) ax.XLim(2)]-bx,[ax.YLim(2)-fy ax.YLim(2) ax.YLim(2) ax.YLim(2)-fy]-by,'k','FaceColor','none');
        hatchfill2(px,'single');
        text(0.55,1.0,'= Human studies','FontSize',8,'HorizontalAlignment','left','VerticalAlignment','top','Units','normalized');

% return
% keyboard


% return
% keyboard
%% >>>>>>>>>> Save the overall figure
    if config.save_fig
        fname = [config.fig_dir '\' config.fig_name]; 
        if config.fast_figs
            frame = getframe(gcf); % fig is the figure handle to save
            [raster, raster_map] = frame2im(frame); % raster is the rasterized image, raster_map is the colormap
            if isempty(raster_map)
                imwrite(raster, fname);
            else
                imwrite(raster, raster_map, fname); % fig_file is the path to the image
            end            
        else
            exportgraphics(gcf,fname,'BackgroundColor',[1 1 1],'Colorspace','rgb','Resolution',350);  
        end
        close(gcf);   
    end


 