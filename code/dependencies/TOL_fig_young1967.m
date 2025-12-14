function TOL_fig_young1967(config,params,dat)
% TOL_fig_young1967, figure of Young et al.'s (1948) apparatus and design
% Figure S5 for: Duvelle and Grieves (2025) Tolman's Sunburst Maze 80 
% years on: A meta-analysis reveals poor replicability and little evidence for 
% shortcutting. European Journal of Neuroscience. DOI: 10.1111/ejn.70365
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
%
% Panel a is loaded as an image file, .svg and .png provided in this repository
% Panel b-d values taken from Young et al (1967) figure 2
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
    vbuff = 210;
    fsiz = 6;

%%%%%%%%%%%%%%%% Maze schematic 
    xnow = 30;
    ynow = 610;
    ax1 = axes('Units','pixels','Position',[xnow ynow 560 250]);
        ah = add_panel_title('a',sprintf('Young et al. (1967) maze configurations'),'yoffset',-20,'xoffset',20,'width',400,'fontsize',fs);
        fname = fullfile(config.schematic_dir, 'Young et al 1967.png');
        im = imread(fname,"png");
        image(im);
        axis off;
        daspect([1 1 1])

%%%%%%%%%%%%%%%% Young et al. (1967)
% Group 1 - all test lanes used, regular sunburst test, apparatus 1
% Group 2 - all test lanes open but center runway in amphitheater removed, apparatus 1
% Group 4 - enucleation four weeks prior to experiment, apparatus 1
    xnow = 50;
    ynow = ynow-180;
    ax2 = axes('Units','pixels','Position',[xnow ynow 250 130]);
        ah = add_panel_title('b',sprintf('Young et al. (1967)\nGroups 1, 2 & 4'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find( ismember(dat.experiment,'Young_et_al_1967') & ismember(dat.group,'group_1') )...
            find( ismember(dat.experiment,'Young_et_al_1967') & ismember(dat.group,'group_2') )...
            find( ismember(dat.experiment,'Young_et_al_1967') & ismember(dat.group,'group_4') )];

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        params.style_offset = 0;
        [hx1,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        ax.XDir = 'reverse';
        ax.YLim = [0 70];

%%%%%%%%%%%%%%%% Young et al. (1967)
% Group 3 - two center lanes closed (6, 7), apparatus 1
    xnow = 50+ax2.Position(3)+hbuff+10;
    % ynow = ynow-190;
    ax3 = axes('Units','pixels','Position',[xnow ynow 250 130]);
        ah = add_panel_title('c',sprintf('Young et al. (1967)\nGroup 3'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find( ismember(dat.experiment,'Young_et_al_1967') & ismember(dat.group,'group_3') )];

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        params.style_offset = 3;        
        [hx2,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        ax.XDir = 'reverse';
        ax.YLim = [0 70];

%%%%%%%%%%%%%%%% Young et al. (1967)
% Group 5 - all test lanes open, apparatus 2, rats
% Group 6 - all test lanes open, apparatus 2, squirrel monkeys
    xnow = 50;
    ynow = ynow-vbuff;
    ax4 = axes('Units','pixels','Position',[xnow ynow 250 130]);
        ah = add_panel_title('d',sprintf('Young et al. (1967)\nGroups 5 & 6'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = [find( ismember(dat.experiment,'Young_et_al_1967') & ismember(dat.group,'group_5') )...
            find( ismember(dat.experiment,'Young_et_al_1967') & ismember(dat.group,'group_6') )];

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        params.style_offset = 4;                
        [hx3,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % additional axis settings
        ax.XDir = 'reverse';
        ax.YLim = [0 70];

        % use legendflex to add legend
        gstring = {'Reward at R1, 5 rats',...
            'Reward at R1, 5 rats, training path removed',...
            'Reward at R1, 4 blind rats',...
            'Reward at R1, 5 rats, paths #6 and #7 closed',...
            'Reward at R2, 9 rats',...
            'Reward at R2, 5 squirrel monkeys',...
            'Shortcut path','Adjacent paths','chance','p < .05','p < .01'};        
        [~,lh] = legendflex([hx1,hx2,hx3,px,lx],gstring,'anchor',{'e','e'},'ncol',1,'box','off','buffer',[300 0],'xscale',.5,'fontsize',9,'ref',ax,'padding',[20 1 1]); 
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


 