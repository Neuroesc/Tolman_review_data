function TOL_fig_kendler1947(config,params,dat)
% TOL_fig_kendler1947
% Figure 6
% Kendler et al (1947; 1948) results figure for:
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
% Panel b-c values taken from Kendler and Gasser (1947) table 1 and 2
% Panel d-e values taken from Kendler and Mencher (1948) table 1 and 2
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

    hbuff = 30;
    vbuff = 210;
    fsiz = 6;

%%%%%%%%%%%%%%%% Maze schematic 
    xnow = 30;
    ynow = 610;
    ax1 = axes('Units','pixels','Position',[xnow ynow 560 250]);
        ah = add_panel_title('a',sprintf('Kendler et al. (1947; 1948) and Chamberlain (1947) maze configurations'),'yoffset',-20,'xoffset',20,'width',400,'fontsize',fs);
        fname = [config.schematic_dir 'Kendler 1947.png'];
        im = imread(fname,"png");
        image(im);
        axis off;
        daspect([1 1 1])

%%%%%%%%%%%%%%%% Kendler and Gasser (1947) Graph showing first test trial responses
    xnow = 50;
    ynow = ynow-170;
    ax2 = axes('Units','pixels','Position',[xnow ynow 250 130]);
        ah = add_panel_title('b',sprintf('Kendler and Gasser (1947)\nTest 1 final choices'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find( ismember(dat.experiment,'Kendler_and_Gasser_1947') & ismember(dat.group,'group_0') & ismember(dat.test,'test1') )...
            find( ismember(dat.experiment,'Kendler_and_Gasser_1947') & ismember(dat.group,'group_5') & ismember(dat.test,'test1') )...
            find( ismember(dat.experiment,'Kendler_and_Gasser_1947') & ismember(dat.group,'group_20') & ismember(dat.test,'test1') )...
            find( ismember(dat.experiment,'Kendler_and_Gasser_1947') & ismember(dat.group,'group_100') & ismember(dat.test,'test1') )];

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        % ax.XDir = 'reverse';
        ax.YLim = [0 60];

        % plot light sources
        light_positions = [3.5];
        lnames = {'L'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

%%%%%%%%%%%%%%%% Kendler and Gasser (1947) Graph showing first test trial responses
    xnow = 50+ax2.Position(3)+hbuff+10;
    ax2b = axes('Units','pixels','Position',[xnow ynow 250 130]);
        ah = add_panel_title('c',sprintf('Kendler and Gasser (1947)\n20 additional test trials'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find( ismember(dat.experiment,'Kendler_and_Gasser_1947') & ismember(dat.group,'group_0') & ismember(dat.test,'test2') )...
            find( ismember(dat.experiment,'Kendler_and_Gasser_1947') & ismember(dat.group,'group_5') & ismember(dat.test,'test2') )...
            find( ismember(dat.experiment,'Kendler_and_Gasser_1947') & ismember(dat.group,'group_20') & ismember(dat.test,'test2') )...
            find( ismember(dat.experiment,'Kendler_and_Gasser_1947') & ismember(dat.group,'group_100') & ismember(dat.test,'test2') )];

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        % ax.XDir = 'reverse';
        ax.YLim = [0 15];
        ax2b.YLabel.String = 'Frequency chosen';

        % plot light sources
        light_positions = [3.5];
        lnames = {'L'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

%%%%%%%%%%%%%%%% Kendler and Menchen (1948) Graph showing first test trial responses
    xnow = 50;
    ynow = ynow-vbuff;
    ax2 = axes('Units','pixels','Position',[xnow ynow 250 130]);
        ah = add_panel_title('d',sprintf('Kendler and Menchen (1947)\nTest 1 final choices'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find( ismember(dat.experiment,'Kendler_and_Menchen_1948') & ismember(dat.group,'group_6-6') & ismember(dat.test,'test1') )...
            find( ismember(dat.experiment,'Kendler_and_Menchen_1948') & ismember(dat.group,'group_6-21') & ismember(dat.test,'test1') )...
            find( ismember(dat.experiment,'Kendler_and_Menchen_1948') & ismember(dat.group,'group_21-6') & ismember(dat.test,'test1') )...
            find( ismember(dat.experiment,'Kendler_and_Menchen_1948') & ismember(dat.group,'group_21-21') & ismember(dat.test,'test1') )];

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        % ax.XDir = 'reverse';
        ax.YLim = [0 60];

        % plot light sources
        light_positions = [3.5];
        lnames = {'L'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

        % use legendflex to add legend
        [~,lh] = legendflex([hx,px,lx],{'Group 1','Group 2','Group 3','Group 4','Shortcut path','Adjacent paths','chance','p < .05','p < .01'},'anchor',{'e','e'},'nrow',2,'box','off','buffer',[200 -125],'xscale',.5,'fontsize',9,'ref',ax,'padding',[20 1 1]); 
        p = {params.short_color(1,:), params.shading_alpha; params.adjacent_color(1,:), params.shading_alpha};   
        i = 1;
        for jj = 1:length(lh)
            if strcmp(lh(jj).Type,'patch')
                lh(jj).FaceColor = p{i,1};
                lh(jj).FaceAlpha = p{i,2};
                i = i+1;
            end
        end 

%%%%%%%%%%%%%%%% Kendler and Menchen (1948) Graph showing first test trial responses
    xnow = 50+ax2.Position(3)+hbuff+10;
    ax2b = axes('Units','pixels','Position',[xnow ynow 250 130]);
        ah = add_panel_title('e',sprintf('Kendler and Menchen (1948)\n20 additional test trials'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find( ismember(dat.experiment,'Kendler_and_Menchen_1948') & ismember(dat.group,'group_6-6') & ismember(dat.test,'test2') )...
            find( ismember(dat.experiment,'Kendler_and_Menchen_1948') & ismember(dat.group,'group_6-21') & ismember(dat.test,'test2') )...
            find( ismember(dat.experiment,'Kendler_and_Menchen_1948') & ismember(dat.group,'group_21-6') & ismember(dat.test,'test2') )...
            find( ismember(dat.experiment,'Kendler_and_Menchen_1948') & ismember(dat.group,'group_21-21') & ismember(dat.test,'test2') )];

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        % ax.XDir = 'reverse';
        ax.YLim = [0 15];
        ax2b.YLabel.String = 'Frequency chosen';

        % plot light sources
        light_positions = [3.5];
        lnames = {'L'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

return
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


 