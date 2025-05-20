function tfigpaper_tolman1946(config,params,dat)
% tfigpaper_kendler 
% Kendler et al results for Duvelle and Grieves review
% See comments for details about where the data were collected or defined
% 
% SEE ALSO tfigpaper, tfigpaper_main_plot

% HISTORY
%
% version 1.0.0, Release 15/04/25 Initial release
%
% AUTHOR 
% Roddy Grieves
% University of Glasgow, Sir James Black Building
% Neuroethology and Spatial Cognition Lab
% eMail: roddy.grieves@glasgow.ac.uk
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
    ynow = 610;
    ax1 = axes('Units','pixels','Position',[xnow ynow 560 250]);
        ah = add_panel_title('a',sprintf('Ritchie (1948) maze configurations'),'yoffset',-50,'xoffset',20,'width',400,'fontsize',fs);
        fname = [config.schematic_dir 'Ritchie 1948.png'];
        im = imread(fname,"png");
        image(im);
        axis off;
        daspect([1 1 1])

%%%%%%%%%%%%%%%% Ritchie 1948 Graph showing first test trial responses
% final choices
    xnow = 50;
    ynow = ynow-150;
    ax2 = axes('Units','pixels','Position',[xnow ynow 250 130]);
        ah = add_panel_title('b',sprintf('Ritchie (1948)\nFinal choices'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find(ismember(dat.experiment,'Ritchie_1948') & ismember(dat.group,'f1') & ismember(dat.test,'final_choice'))... % L1/F1 is light at right
            find(ismember(dat.experiment,'Ritchie_1948') & ismember(dat.group,'f2') & ismember(dat.test,'final_choice'))]; % L2/F2 is light at left

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        % ax.XDir = 'reverse';
        ax.YLim = [0 80];

        % plot light sources
        light_positions = [3];
        lnames = {'L'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

        % use legendflex to add legend
        [~,lh] = legendflex([hx,px,lx],{'Group','Group 2','Shortcut path','Adjacent paths','chance','p < .05','p < .01'},'anchor',{'e','e'},'nrow',2,'box','off','buffer',[110 -120],'xscale',.5,'fontsize',9,'ref',ax,'padding',[20 1 1]); 
        p = {params.short_color(1,:), params.shading_alpha; params.adjacent_color(1,:), params.shading_alpha};   
        i = 1;
        for jj = 1:length(lh)
            if strcmp(lh(jj).Type,'patch')
                lh(jj).FaceColor = p{i,1};
                lh(jj).FaceAlpha = p{i,2};
                i = i+1;
            end
        end    

%%%%%%%%%%%%%%%% Ritchie 1948 Graph showing first test trial responses
% total entries
    xnow = 50+ax2.Position(3)+hbuff+10;
    ax2 = axes('Units','pixels','Position',[xnow ynow 250 130]);
        ah = add_panel_title('c',sprintf('Ritchie (1948)\nTotal entries'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find(ismember(dat.experiment,'Ritchie_1948') & ismember(dat.group,'f1') & ismember(dat.test,'total_entries'))... % L1/F1 is light at right
            find(ismember(dat.experiment,'Ritchie_1948') & ismember(dat.group,'f2') & ismember(dat.test,'total_entries'))]; % L2/F2 is light at left

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        % ax.XDir = 'reverse';
        ax.YLim = [0 25];

        % plot light sources
        light_positions = [3];
        lnames = {'L'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

        % return
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


 