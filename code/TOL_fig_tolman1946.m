function TOL_fig_tolman1946(config,params,dat)
% TOL_fig_tolman1946 
% Figure 1
% Tolman et al (1946) results figure for:
% Duvelle and Grieves (2025) Rethinking the Sun-burst Maze: A Critical Review of a Classic Spatial Learning Task
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
% Panel b values taken from Tolman et al (1946) Fig 3, pp 19
% Panel c citation counts from Scopus.com
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
    vbuff = 220;
    fsiz = 6;

%%%%%%%%%%%%%%%% Maze schematic 
    xnow = 30;
    ynow = 580;
    ax1 = axes('Units','pixels','Position',[xnow ynow 560 250]);
        ah = add_panel_title('a',sprintf('Tolman et al. (1946) maze configurations'),'yoffset',-20,'xoffset',20,'width',400,'fontsize',fs);
        fname = [config.schematic_dir 'Tolman et al 1946.png'];
        im = imread(fname,"png");
        image(im);
        axis off;
        daspect([1 1 1])
        % text(0.09,1,'Training','FontSize',10,'VerticalAlignment','bottom','HorizontalAlignment','center','Units','normalized')
        % text(0.37,1,'Testing','FontSize',10,'VerticalAlignment','bottom','HorizontalAlignment','center','Units','normalized')
        % text(0.765,1,'Overlay','FontSize',10,'VerticalAlignment','bottom','HorizontalAlignment','center','Units','normalized')

%%%%%%%%%%%%%%%% Tolman et al (1946) Graph showing first test trial responses
% Fifty-six female rats, approximately three months old, Tryon stock
% Values taken from Fig 3, pp 19
    xnow = 50;
    ynow = ynow-190;
    ax = axes('Units','pixels','Position',[xnow ynow 300 130]);
        ah = add_panel_title('b',sprintf('Tolman et al. (1946)\nFirst choices in test'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % get index of data we want to plot in this axis
        idx = find( ismember(dat.experiment,'Tolman_et_al_1946') );

        % use TOL_plotter to plot the data, chance level, shaded regions etc
        ax = gca;
        [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params);

        % use legendflex to add legend
        [~,lh] = legendflex([hx,px,lx],{'Choices','Shortcut path','Adjacent paths','chance','p < .05','p < .01'},'anchor',{'e','e'},'ncol',2,'box','off','buffer',[-50 -140],'xscale',.5,'fontsize',9,'ref',ax,'padding',[20 1 1]); 
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

        % plot light sources
        light_positions = [5];
        lnames = {'L',};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

%%%%%%%%%%%%%%%% Tolman et al (1946) and other study Citations
% citation counts from Scopus.com
    xnow = 50+ax.Position(3)+hbuff+30;
    ax = axes('Units','pixels','Position',[xnow ynow 170 130]);
        ah = add_panel_title('c',sprintf('Citations per article'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        y = [4284, 191, 16, 11, 4, 6, 0, 5, 3, 58, 29, 8]; % citation counts from Scopus.com
        x = 1:length(y);
        nmes = {'Tolman (1948)','Tolman et al. (1946)','Gentry et al. (1947)','Gentry et al. (1948)','Birch & Korn (1958)','Kendler & Gasser (1948)','Kendler & Mencher (1949)','Wilson & Wilson (2018)','Doner et al. (2023)','Harley (1979)','Muir & Taube (2004)','Ritchie (1948)'};
        [~,idx] = sort(y,'descend');
        y = y(idx);
        nmes = nmes(idx);

        b = bar(x,y,0.8,'k');

        ylabel(ax,'Citations');
        ax.XTick = x-0.4;
        ax.XTickLabel = nmes;
        ax.XTickLabelRotation = 60;
        % xlabel('Study')
        ax.YScale = 'log';
        box off

        y2 = y;
        y2(y==0) = 1;
        text(x-0.4,y2,string(y),'HorizontalAlignment','left','VerticalAlignment','bottom');

    ax = axes('Units','pixels','Position',[xnow+100 ynow+60 70 70]);
        b = bar(x,y,0.8,'k');
        ax.XTickLabel = '';
        box off

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


 