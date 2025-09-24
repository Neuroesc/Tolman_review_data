function TOL_fig_muir2004(config,params,dat)
% TOL_fig_harley1979
% Figure 9
% Muir and Taube (2004) results figure for:
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
% Panel a is loaded as an image file, .svg and .png provided in this repository
% Panel b values taken from Muir and Taube (2004) table 1
% Mazes are labelled 1-3 in Muir and Taube (2004) figure 1, these correspond to
% A-C in their table 1, and I-III in our figure.
%
% AUTHOR 
% Roddy Grieves
% University of Glasgow, Sir James Black Building
% Neuroethology and Spatial Cognition Lab
% eMail: roddy.grieves@glasgow.ac.uk, eleonore.duvelle@glasgow.ac.uk
% Copyright 2025 Roddy Grieves & Eleonore Duvelle

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% INPUTS
%%%%%%%%%%%%%%%% ARGUMENT CHECK
    params0 = params;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION BODY
    % Create figure
    fig_now = figure('Units','pixels','Position',[50 50 210.*3 297.*3],'visible','on');
    set(gcf,'InvertHardCopy','off'); % gives the figure a grey background but means it will save white lines as white    
    set(gcf,'color','w'); % makes the background colour white
    fs = [14 10];

    hbuff = 50;
    vbuff = 160;
    fsiz = 6;

%%%%%%%%%%%%%%%% Maze schematic 
    xnow = 50;
    ynow = 350;
    ax1 = axes('Units','pixels','Position',[xnow-20 ynow 500 500]);
        ah = add_panel_title('a',sprintf('Muir and Taube (2004) maze configurations'),'yoffset',-30,'xoffset',20,'width',400,'fontsize',fs);
        fname = [config.schematic_dir 'Muir and Taube 2004.png'];
        im = imread(fname,"png");
        image(im);
        axis off;
        daspect([1 1 1])
        % text(0.09,1,'Training','FontSize',10,'VerticalAlignment','bottom','HorizontalAlignment','center','Units','normalized')
        % text(0.37,1,'Testing','FontSize',10,'VerticalAlignment','bottom','HorizontalAlignment','center','Units','normalized')
        % text(0.765,1,'Overlay','FontSize',10,'VerticalAlignment','bottom','HorizontalAlignment','center','Units','normalized')

%%%%%%%%%%%%%%%% 
    xnow = 50;
    ynow = ynow-vbuff;
    ax2 = axes('Units','pixels','Position',[xnow ynow 250 120]);
        ah = add_panel_title('b',sprintf('Muir and Taube (2004)\nMaze II results'),'yoffset',10,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = find( ismember(dat.experiment,'Muir_and_Taube_2004') & ismember(dat.group,'maze_II') );

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % use legendflex to add legend
        [~,lh] = legendflex([hx,px,lx],{'Maze II','Shortcut path','Adjacent paths','chance','p < .05','p < .01'},'anchor',{'e','e'},'nrow',2,'box','off','buffer',[60 -110],'xscale',.5,'fontsize',9,'ref',ax,'padding',[20 1 1]); 
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
        ax2.YLim = [0 60];
        xlabel('');

% experiments 2-5 summarised
    xnow = xnow+ax2.Position(3)+hbuff;
    % ynow = ynow-vbuff-40;
    ax3 = axes('Units','pixels','Position',[xnow ynow 180 120]);
        ah = add_panel_title('c',sprintf('Muir and Taube (2004)\nMaze I-III'),'yoffset',10,'xoffset',0,'width',400,'fontsize',fs);

        gs = {'maze_I','maze_II','maze_III'};
        d = [];
        for gg = 1:length(gs)
            idx = ismember(dat.experiment,'Muir_and_Taube_2004') & ismember(dat.group,gs{gg});
            a = dat.pchoice{idx}(dat.short(idx,:));
            b = max(dat.pchoice{idx}(dat.adjacent(idx,:)),[],"all",'omitmissing');

            c1 = stem(gg-0.25,a,'filled','Color',params.short_color); hold on;
            c2 = stem(gg+0.25,b,'filled','Color',params.adjacent_color);
        end
        ax3.XTick = 1:length(gs);
        ax3.XTickLabel = {'Maze I','Maze II','Maze III'};
        ax3.YLabel.String = '% animals';

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
        ax3.YLim = ax2.YLim;

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


 