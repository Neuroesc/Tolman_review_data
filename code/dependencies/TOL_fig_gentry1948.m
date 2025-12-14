function TOL_fig_gentry1948(config,params,dat)
% TOL_fig_gentry1948, figure of Gentry et al. (1948) apparatus and design
% Figure S8 for: Duvelle and Grieves (2025) Tolman's Sunburst Maze 80 
% years on: A meta-analysis reveals poor replicability and little evidence for 
% shortcutting. European Journal of Neuroscience. DOI: 10.1111/ejn.70365
% Shows results and apparatus used by: Gentry, G., Brown, W. L., & Lee, H. 
% (1948). Spatial location in the learning of a multiple-t maze. Journal of 
% comparative and physiological psychology, 41(5), 312–318.
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
% Apparatus design based on text descriptions and Gentry et al.'s (1948) Fig 1 and 2.
% Panel b values taken from Gentry et al (1948) Fig 4
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
    ynow = 600;
    ax1 = axes('Units','pixels','Position',[xnow-30 ynow 460 250]);
        ah = add_panel_title('a',sprintf('Gentry et al. (1948) maze configurations'),'yoffset',-10,'xoffset',30,'width',400,'fontsize',fs);
        fname = fullfile(config.schematic_dir, 'Gentry et al 1948.png');
        im = imread(fname,"png");
        image(im);
        axis off;
        daspect([1 1 1])

%%%%%%%%%%%%%%%% Gentry et al (1947) Graph showing first test trial responses
% (H1 and H2 groups)
    xnow = 50;
    ynow = ynow-180;
    ax2 = axes('Units','pixels','Position',[xnow ynow 270 130]);
        ah = add_panel_title('b',sprintf('Gentry et al. (1948)\nFinal choices'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find(ismember(dat.experiment,'Gentry_et_al_1948') & ismember(dat.group,'main'))];

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        % ax.XDir = 'reverse';
        ax.YLim = [0 35];

        % plot light sources
        light_positions = [8];
        lnames = {'L'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

        % use legendflex to add legend
        [~,lh] = legendflex([hx,px,lx],{'Choices','Shortcut path','Adjacent paths','chance','p < .05','p < .01'},'anchor',{'e','e'},'ncol',1,'box','off','buffer',[120 10],'xscale',.5,'fontsize',9,'ref',ax,'padding',[20 1 1]); 
        p = {params.short_color(1,:), params.shading_alpha; params.adjacent_color(1,:), params.shading_alpha};   
        i = 1;
        for jj = 1:length(lh)
            if strcmp(lh(jj).Type,'patch')
                lh(jj).FaceColor = p{i,1};
                lh(jj).FaceAlpha = p{i,2};
                i = i+1;
            end
        end 

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


 