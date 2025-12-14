function TOL_fig_gentry1947(config,params,dat)
% TOL_fig_gentry1947, figure of Gentry et al. (1947), Birch and Korn (1958)
% Figure S2 for: Duvelle and Grieves (2025) Tolman's Sunburst Maze 80 
% years on: A meta-analysis reveals poor replicability and little evidence for 
% shortcutting. European Journal of Neuroscience. DOI: 10.1111/ejn.70365
% Shows results and apparatus used by: Gentry, G., Brown, W. L., & Kaplan, S. J. 
% (1947). An experimental analysis of the spatial location hypothesis in
% learning and Birch, H. G., & Korn, S. J. (1958). Place-learning, cognitive maps, 
% and parsimony. The Journal of general psychology, 58(1), 17–35.
% See TOL_data for details about where the data were collected or defined
% 
% SEE ALSO TOL_main, TOL_data, TOL_plotter

% HISTORY
%
% version 1.0.0, Release 15/04/25 Initial release
% version 1.1.0, Release 20/04/25 GitHub release
% version 2.0.0, Release 13/12/25 Publication release
% version 2.0.1, Release 14/12/25 Improved comments
%
% NOTES
% Panel a is loaded as an image file, .svg and .png provided in this repository
% Apparatus design based on text descriptions and Gentry et al.'s (1947) Fig 1 and 2.
% Panel b values taken from Gentry et al (1947) Fig 3 and 4 (pp 313)
% Panel c values taken from Gentry et al (1947) Fig 3-10
% Panel d-g taken from Birch and Korn (1958) Fig 3 and 4
%
% AUTHOR 
%
% Roddy Grieves
% University of Glasgow, Sir James Black Building
% Neuroethology and Spatial Cognition Lab
% Copyright 2025 Roddy Grieves

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% INPUTS
%%%%%%%%%%%%%%%% ARGUMENT CHECK
    params0 = params;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION BODY
    % Create figure
    fig_now = figure('Units','pixels','Position',[50 50 210.*3 297.*3],'visible','on');
    set(gcf,'InvertHardCopy','off'); % gives the figure a grey background but means it will save white lines as white    
    set(gcf,'color','w'); % makes the background colour white
    fs = [14 10];

    hbuff = 30;
    vbuff = 195;
    fsiz = 6;

%%%%%%%%%%%%%%%% Maze schematic 
    xnow = 30;
    ynow = 620;
    ax1 = axes('Units','pixels','Position',[xnow ynow 560 250]);
        ah = add_panel_title('a',sprintf('Gentry et al. (1947) and Birch and Korn (1958) maze configurations'),'yoffset',-20,'xoffset',20,'width',400,'fontsize',fs);
        fname = fullfile(config.schematic_dir, 'Gentry et al 1947.png');
        im = imread(fname,"png");
        image(im);
        axis off;
        daspect([1 1 1])

%%%%%%%%%%%%%%%% Gentry et al (1947) Graph showing first test trial responses
% final choices
    xnow = 50;
    ynow = ynow-160;
    ax2 = axes('Units','pixels','Position',[xnow ynow 250 120]);
        ah = add_panel_title('b',sprintf('Gentry et al. (1947)\nExperiment I'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find(ismember(dat.experiment,'Gentry_et_al_1947') & ismember(dat.group,'h1'))... % h1 is light at right
            find(ismember(dat.experiment,'Gentry_et_al_1947') & ismember(dat.group,'h2'))]; % h2 is light at left

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        ax.XDir = 'reverse';
        ax.YLim = [0 30];

        % plot light sources
        light_positions = [5 14];
        lnames = {'L1','L2'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

% experiments 2-5 summarised
    xnow = 50+ax2.Position(3)+hbuff+110;
    ax3 = axes('Units','pixels','Position',[xnow ynow 140 120]);
        ah = add_panel_title('c',sprintf('Gentry et al. (1947)\nExperiments I-V'),'yoffset',0,'xoffset',-40,'width',400,'fontsize',fs);

        gs = {'h1','h2','more_training','cd_removed','de_longer','no_training_cd_present','no_training_cd_removed'};
        d = [];
        for gg = 1:length(gs)
            idx = ismember(dat.experiment,'Gentry_et_al_1947') & ismember(dat.group,gs{gg});
            a = dat.pchoice{idx}(dat.short(idx,:));
            b = max(dat.pchoice{idx}(dat.adjacent(idx,:)),[],"all",'omitmissing');

            c1 = stem(gg-0.25,a,'filled','Color',params.short_color); hold on;
            c2 = stem(gg+0.25,b,'filled','Color',params.adjacent_color);
        end
        ax3.XTick = 1:length(gs);
        ax3.XTickLabel = {'Light at L1','Light at L2','Extra training','CD removed','DE extended','Untrained (U)','U & CD removed'};
        ax3.YLabel.String = '% rats';
        view(90,90);

        % chance
        m = c(1);
        s = c(2);
        v1 = 1.650.*s;
        v2 = 2.326.*s;
        hold on;
        l1 = line([-100 100],[m m],'Color',params.chance_color(1,:),'LineStyle','-');  
        l2 = line([-100 100],[m+v1 m+v1],'Color',params.chance_color(1,:),'LineStyle','--');
        l3 = line([-100 100],[m+v2 m+v2],'Color',params.chance_color(1,:),'LineStyle',':');
        box off
        ax3.XLim = [0.5 length(gs)+0.5];

        p1 = plot(NaN,NaN,'Color',params.short_color,'Marker','o','MarkerSize',8,'LineStyle','none','MarkerFaceColor',params.short_color);
        p2 = plot(NaN,NaN,'Color',params.adjacent_color,'Marker','o','MarkerSize',8,'LineStyle','none','MarkerFaceColor',params.adjacent_color);
        [~,lh] = legendflex([p1 p2],{'Shortcut','Adjacent'},'anchor',{'e','e'},'ncol',1,'box','off','buffer',[5 -10],'xscale',.5,'fontsize',9,'ref',ax3,'padding',[20 1 1]); 

%%%%%%%%%%%%%%%% Birch and Korn (1958) Graph showing first test trial responses
% Final choices
    xnow = 50;
    ynow = ynow-vbuff-40;
    ax2 = axes('Units','pixels','Position',[xnow ynow 250 120]);
        ah = add_panel_title('d',sprintf('Birch and Korn (1958)\nTest 1 final choices'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find( ismember(dat.experiment,'Birch_and_Korn_1958') & ismember(dat.group,'light_right') & ismember(dat.test,'final_choices') )...
            find( ismember(dat.experiment,'Birch_and_Korn_1958') & ismember(dat.group,'light_left') & ismember(dat.test,'final_choices') )... 
            find( ismember(dat.experiment,'Birch_and_Korn_1958') & ismember(dat.group,'light_both') & ismember(dat.test,'final_choices') )];

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % use legendflex to add legend
        [~,lh] = legendflex([hx,px,lx],{'L1','L2','L1&L2','Shortcut path','Adjacent paths','chance','p < .05','p < .01'},'anchor',{'e','e'},'nrow',2,'box','off','buffer',[200 120],'xscale',.5,'fontsize',9,'ref',ax,'padding',[20 1 1]); 
        p = {params.short_color(1,:), params.shading_alpha; params.adjacent_color(1,:), params.shading_alpha};   
        i = 1;
        for jj = 1:length(lh)
            if strcmp(lh(jj).Type,'patch')
                lh(jj).FaceColor = p{i,1};
                lh(jj).FaceAlpha = p{i,2};
                i = i+1;
            end
        end 

        % additional axis settings
        ax.XDir = 'reverse';
        ax.YLim = [0 80];
        xlabel('');

        % plot light sources
        light_positions = [5 14];
        lnames = {'L1','L2'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

% Total entries
    xnow = xnow+ax2.Position(3)+hbuff;
    ynow = ynow;
    ax2 = axes('Units','pixels','Position',[xnow ynow 250 120]);
        ah = add_panel_title('e',sprintf('Birch and Korn (1958)\nTest 1 total entries'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find( ismember(dat.experiment,'Birch_and_Korn_1958') & ismember(dat.group,'light_right') & ismember(dat.test,'total_entries') )...
            find( ismember(dat.experiment,'Birch_and_Korn_1958') & ismember(dat.group,'light_left') & ismember(dat.test,'total_entries') )... 
            find( ismember(dat.experiment,'Birch_and_Korn_1958') & ismember(dat.group,'light_both') & ismember(dat.test,'total_entries') )];

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        ax.XDir = 'reverse';
        ax.YLim = [0 30];
        ylabel('')
        xlabel('');

        % plot light sources
        light_positions = [5 14];
        lnames = {'L1','L2'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

% Final choices, test 2
    xnow = 50;
    ynow = ynow-vbuff+15;
    ax2 = axes('Units','pixels','Position',[xnow ynow 250 120]);
        ah = add_panel_title('f',sprintf('Birch and Korn (1958)\nTest 2 final choices'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find( ismember(dat.experiment,'Birch_and_Korn_1958') & ismember(dat.group,'light_right') & ismember(dat.test,'final_choices_2') )...
            find( ismember(dat.experiment,'Birch_and_Korn_1958') & ismember(dat.group,'light_left') & ismember(dat.test,'final_choices_2') )... 
            find( ismember(dat.experiment,'Birch_and_Korn_1958') & ismember(dat.group,'light_both') & ismember(dat.test,'final_choices_2') )];

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        ax.XDir = 'reverse';
        ax.YLim = [0 80];

        % plot light sources
        light_positions = [5 14];
        lnames = {'L1','L2'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

% Total entries, test 2
    xnow = xnow+ax2.Position(3)+hbuff;
    ax2 = axes('Units','pixels','Position',[xnow ynow 250 120]);
        ah = add_panel_title('g',sprintf('Birch and Korn (1958)\nTest 2 total entries'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find( ismember(dat.experiment,'Birch_and_Korn_1958') & ismember(dat.group,'light_right') & ismember(dat.test,'total_entries_2') )...
            find( ismember(dat.experiment,'Birch_and_Korn_1958') & ismember(dat.group,'light_left') & ismember(dat.test,'total_entries_2') )... 
            find( ismember(dat.experiment,'Birch_and_Korn_1958') & ismember(dat.group,'light_both') & ismember(dat.test,'total_entries_2') )];

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        ax.XDir = 'reverse';
        ax.YLim = [0 30];
        ylabel('')

        % plot light sources
        light_positions = [5 14];
        lnames = {'L1','L2'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

        % return
%% >>>>>>>>>> Save the overall figure
    if config.save_fig
        fname = fullfile(config.fig_dir, config.fig_name); 
        if config.fast_figs
            frame = getframe(gcf); % fig is the figure handle to save
            [raster, raster_map] = frame2im(frame); % raster is the rasterized image, raster_map is the colormap
            if isempty(raster_map)
                imwrite(raster, fname);
            else
                imwrite(raster, raster_map, fname); % fig_file is the path to the image
            end            
        else
            exportgraphics(gcf,fname,'BackgroundColor',[1 1 1],'Colorspace','rgb','Resolution',params.res);  
        end
        close(gcf);   
    end


 