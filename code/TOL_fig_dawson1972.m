function TOL_fig_gentry1948(config,params,dat)
% TOL_fig_gentry1948 
% Figure 4
% Gentry et al (1948) results figure for:
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
% Panel b values taken from Gentry et al (1948) Fig 4
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
    vbuff = 205;
    fsiz = 6;
    ytext = 'PDF';  
    yl = 0.2;

%%%%%%%%%%%%%%%% Maze schematic 
    xnow = 30;
    ynow = 550;
    ax1 = axes('Units','pixels','Position',[xnow-20 ynow 550 300]);
        ah = add_panel_title('a',sprintf('Dawson (1972) maze configurations'),'yoffset',-40,'xoffset',30,'width',400,'fontsize',fs);
        fname = [config.schematic_dir 'Dawson 1972.png'];
        im = imread(fname,"png");
        image(im);
        axis off;
        daspect([1 1 1])

%%%%%%%%%%%%%%%% Dawson (1972) Graph showing first test trial responses, trial 1
    xnow = 50;
    ynow = ynow-160;
    ax = axes('Units','pixels','Position',[xnow ynow 270 130]);
        ah = add_panel_title('b',sprintf('Dawson (1972)\nTrial 1 final choices'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % trial 1
        % males
        m1 = 7.27; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s1 = 3.62; % standard deviation
        n1 = 26; % N of animals
        % females
        m2 = 10.41; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s2 = 3.20; % standard deviation
        n2 = 27; % N of animals

        xi = 1:18;
        y1 = normpdf(xi,m1,s1);
        y2 = normpdf(xi,m2,s2);
        % y1 = y1 ./ max(y1,[],"all",'omitmissing');
        % y2 = y2 ./ max(y2,[],"all",'omitmissing');

        % Shortcut and adjacent shading
        % adjacent path shading
        adj = [9 10];
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
        shrt = [6];
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

        % plot data
        p1 = plot(xi,y1,"Color",params.c1,"LineStyle","-",'Marker','none','LineWidth',1.5); hold on; % males
        p2 = plot(xi,y2,"Color",params.c2,"LineStyle","-",'Marker','none','LineWidth',1.5); % females

        ax.YLim = [0 yl];
        yv = 0;
        plot(m1,yv,"Color",params.c1,'Marker','v','MarkerFaceColor',params.c1);
        plot(m2,yv,"Color",params.c2,'Marker','v','MarkerFaceColor',params.c2);

        % plot light sources
        light_positions = [5];
        lnames = {'L'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

        % % use legendflex to add legend
        % [~,lh] = legendflex([p1,p2,px],{'Males','Females','Shortcut path','Adjacent paths'},'anchor',{'e','e'},'ncol',1,'box','off','buffer',[120 10],'xscale',.5,'fontsize',9,'ref',ax,'padding',[20 1 1]); 
        % p = {params.short_color(1,:), params.shading_alpha; params.adjacent_color(1,:), params.shading_alpha};   
        % i = 1;
        % for jj = 1:length(lh)
        %     if strcmp(lh(jj).Type,'patch')
        %         lh(jj).FaceColor = p{i,1};
        %         lh(jj).FaceAlpha = p{i,2};
        %         i = i+1;
        %     end
        % end 
        ax.XDir = 'reverse';
        ax.XLim = [0.5 18.5];
        ax.XTick = xi;
        xlabel('Path choices')
        ylabel(ytext)
        ytickformat(ax,'%.2f')

% keyboard
%%%%%%%%%%%%%%%% Dawson (1972) Graph showing first test trial responses, trial 2
% Final choices
    xnow = xnow+ax.Position(3)+hbuff;
    ynow = ynow;
    ax = axes('Units','pixels','Position',[xnow ynow 250 120]);
        ah = add_panel_title('c',sprintf('Dawson (1972)\nTrial 2 final choices'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % trial 1
        % control males
        m1 = 7.85; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s1 = 3.82; % standard deviation
        n1 = 13; % N of animals
        % control females
        m2 = 11.57; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s2 = 4.32; % standard deviation
        n2 = 14; % N of animals
        % estrogen males
        m3 = 9.23; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s3 = 4.10; % standard deviation
        n3 = 13; % N of animals
        % testosterone females
        m4 = 11.20; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s4 = 6.94; % standard deviation
        n4 = 5; % N of animals

        xi = 1:18;
        y1 = normpdf(xi,m1,s1);
        y2 = normpdf(xi,m2,s2);
        y3 = normpdf(xi,m3,s3);
        y4 = normpdf(xi,m4,s4);
        % y1 = y1 ./ max(y1,[],"all",'omitmissing');
        % y2 = y2 ./ max(y2,[],"all",'omitmissing');
        % y3 = y3 ./ max(y3,[],"all",'omitmissing');
        % y4 = y4 ./ max(y4,[],"all",'omitmissing');
        
        % Shortcut and adjacent shading
        % adjacent path shading
        adj = [9 10];
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
        shrt = [6];
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

        % plot data
        p1 = plot(xi,y1,"Color",params.c1,"LineStyle","-",'Marker','none','LineWidth',1.5); hold on; % control males
        p2 = plot(xi,y2,"Color",params.c2,"LineStyle","-",'Marker','none','LineWidth',1.5); % control females
        p3 = plot(xi,y3,"Color",params.c3,"LineStyle","-",'Marker','none','LineWidth',1.5); % estrogen males
        p4 = plot(xi,y4,"Color",params.c4,"LineStyle","-",'Marker','none','LineWidth',1.5); % testosterone females

        ax.YLim = [0 yl];
        yv = 0;
        plot(m1,yv,"Color",params.c1,'Marker','v','MarkerFaceColor',params.c1);
        plot(m2,yv,"Color",params.c2,'Marker','v','MarkerFaceColor',params.c2);
        plot(m3,yv,"Color",params.c3,'Marker','v','MarkerFaceColor',params.c3);
        plot(m4,yv,"Color",params.c4,'Marker','v','MarkerFaceColor',params.c4);

        % plot light sources
        light_positions = [5];
        lnames = {'L'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

        % use legendflex to add legend
        [~,lh] = legendflex([p1,p2,p3,p4,px],{'Ctrl. Males','Ctrl. Females','Exp. Males','Exp. Females','Shortcut path','Adjacent paths'},'anchor',{'e','e'},'ncol',1,'box','off','buffer',[0 120],'xscale',.5,'fontsize',9,'ref',ax,'padding',[20 1 1]); 
        p = {params.short_color(1,:), params.shading_alpha; params.adjacent_color(1,:), params.shading_alpha};   
        i = 1;
        for jj = 1:length(lh)
            if strcmp(lh(jj).Type,'patch')
                lh(jj).FaceColor = p{i,1};
                lh(jj).FaceAlpha = p{i,2};
                i = i+1;
            end
        end 
        lh(7).Color = params.c1;
        lh(9).Color = params.c2;
        lh(11).Color = params.c3;
        lh(13).Color = params.c4;

        ax.XDir = 'reverse';
        ax.XLim = [0.5 18.5];
        ax.XTick = xi;
        xlabel('Path choices')
        % ylabel(ytext)
        ytickformat(ax,'%.2f')

% keyboard
%%%%%%%%%%%%%%%% Dawson (1972) Graph showing first test trial responses, trial 2
% Final choices
    xnow = 50;
    ynow = ynow-vbuff;
    ax = axes('Units','pixels','Position',[xnow ynow 270 120]);
        ah = add_panel_title('d',sprintf('Dawson (1972)\nTrial 3 final choices'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % trial 1
        % control males
        m1 = 6.29; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s1 = 4.30; % standard deviation
        n1 = 14; % N of animals
        % control females
        m2 = 11.36; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s2 = 3.46; % standard deviation
        n2 = 14; % N of animals
        % estrogen males
        m3 = 9.54; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s3 = 3.97; % standard deviation
        n3 = 13; % N of animals

        xi = 1:18;
        y1 = normpdf(xi,m1,s1);
        y2 = normpdf(xi,m2,s2);
        y3 = normpdf(xi,m3,s3);
        % y1 = y1 ./ max(y1,[],"all",'omitmissing');
        % y2 = y2 ./ max(y2,[],"all",'omitmissing');
        % y3 = y3 ./ max(y3,[],"all",'omitmissing');

        % Shortcut and adjacent shading
        % adjacent path shading
        adj = [9 10];
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
        shrt = [6];
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

        % plot data
        p1 = plot(xi,y1,"Color",params.c1,"LineStyle","-",'Marker','none','LineWidth',1.5); hold on; % control males
        p2 = plot(xi,y2,"Color",params.c2,"LineStyle","-",'Marker','none','LineWidth',1.5); % control females
        p3 = plot(xi,y3,"Color",params.c3,"LineStyle","-",'Marker','none','LineWidth',1.5); % estrogen males

        ax.YLim = [0 yl];        
        yv = 0;
        plot(m1,yv,"Color",params.c1,'Marker','v','MarkerFaceColor',params.c1);
        plot(m2,yv,"Color",params.c2,'Marker','v','MarkerFaceColor',params.c2);
        plot(m3,yv,"Color",params.c3,'Marker','v','MarkerFaceColor',params.c3);
        
        % plot light sources
        light_positions = [5];
        lnames = {'L'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

        % % use legendflex to add legend
        % [~,lh] = legendflex([p1,p2,p3,px],{'Males','Females','Males+Estrogen','Shortcut path','Adjacent paths'},'anchor',{'e','e'},'ncol',1,'box','off','buffer',[120 10],'xscale',.5,'fontsize',9,'ref',ax,'padding',[20 1 1]); 
        % p = {params.short_color(1,:), params.shading_alpha; params.adjacent_color(1,:), params.shading_alpha};   
        % i = 1;
        % for jj = 1:length(lh)
        %     if strcmp(lh(jj).Type,'patch')
        %         lh(jj).FaceColor = p{i,1};
        %         lh(jj).FaceAlpha = p{i,2};
        %         i = i+1;
        %     end
        % end 
        ax.XDir = 'reverse';
        ax.XLim = [0.5 18.5];
        ax.XTick = xi;
        xlabel('Path choices')
        ylabel(ytext)
        ytickformat(ax,'%.2f')

%%%%%%%%%%%%%%%% Michik (1973) Graph showing first test trial responses
% Final choices
    xnow = xnow+ax.Position(3)+hbuff;
    ynow = ynow;
    ax = axes('Units','pixels','Position',[xnow ynow 270 120]);
        ah = add_panel_title('e',sprintf('Michik (1973)\nTrial 1 final choices'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % trial 1
        % control males
        m1 = 6.2; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s1 = 3.048; % standard deviation
        n1 = 9; % N of animals
        % control females
        m2 = 9.8; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s2 = 3.642; % standard deviation
        n2 = 4; % N of animals
        % experimental males
        m3 = 9.7; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s3 = 3.467; % standard deviation
        n3 = 10; % N of animals
        % experimental females
        m4 = 12.1; % mean path chosen (1-18, 5 was shortcut, 9.5 was training)
        s4 = 2.441; % standard deviation
        n4 = 10; % N of animals

        xi = 1:18;
        y1 = normpdf(xi,m1,s1);
        y2 = normpdf(xi,m2,s2);
        y3 = normpdf(xi,m3,s3);
        y4 = normpdf(xi,m4,s4);        
        % y1 = y1 ./ max(y1,[],"all",'omitmissing');
        % y2 = y2 ./ max(y2,[],"all",'omitmissing');
        % y3 = y3 ./ max(y3,[],"all",'omitmissing');

        % Shortcut and adjacent shading
        % adjacent path shading
        adj = [9 10];
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
        shrt = [6];
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

        % plot data
        p1 = plot(xi,y1,"Color",params.c1,"LineStyle","-",'Marker','none','LineWidth',1.5); hold on; % control males
        p2 = plot(xi,y2,"Color",params.c2,"LineStyle","-",'Marker','none','LineWidth',1.5); % control females
        p3 = plot(xi,y3,"Color",params.c3,"LineStyle","-",'Marker','none','LineWidth',1.5); % estrogen males
        p4 = plot(xi,y4,"Color",params.c4,"LineStyle","-",'Marker','none','LineWidth',1.5); % estrogen males

        ax.YLim = [0 yl];        
        yv = 0;
        plot(m1,yv,"Color",params.c1,'Marker','v','MarkerFaceColor',params.c1);
        plot(m2,yv,"Color",params.c2,'Marker','v','MarkerFaceColor',params.c2);
        plot(m3,yv,"Color",params.c3,'Marker','v','MarkerFaceColor',params.c3);
        plot(m4,yv,"Color",params.c3,'Marker','v','MarkerFaceColor',params.c4);
        
        % plot light sources
        light_positions = [5];
        lnames = {'L'};
        y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
        scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
        text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

        % % use legendflex to add legend
        % [~,lh] = legendflex([p1,p2,p3,px],{'Males','Females','Males+Estrogen','Shortcut path','Adjacent paths'},'anchor',{'e','e'},'ncol',1,'box','off','buffer',[120 10],'xscale',.5,'fontsize',9,'ref',ax,'padding',[20 1 1]); 
        % p = {params.short_color(1,:), params.shading_alpha; params.adjacent_color(1,:), params.shading_alpha};   
        % i = 1;
        % for jj = 1:length(lh)
        %     if strcmp(lh(jj).Type,'patch')
        %         lh(jj).FaceColor = p{i,1};
        %         lh(jj).FaceAlpha = p{i,2};
        %         i = i+1;
        %     end
        % end 
        ax.XDir = 'reverse';
        ax.XLim = [0.5 18.5];
        ax.XTick = xi;
        xlabel('Path choices')
        % ylabel(ytext)
        ytickformat(ax,'%.2f')

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


 