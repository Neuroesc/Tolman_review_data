function TOL_fig_stats1(config,params,dat)
% TOL_fig_stats1
% Figure 10
% Overall stats results figure for:
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
% Panel d is loaded as an image file, .svg and .png provided in this repository
%
% AUTHOR 
% Roddy Grieves
% University of Glasgow, Sir James Black Building
% Neuroethology and Spatial Cognition Lab
% eMail: roddy.grieves@glasgow.ac.uk, eleonore.duvelle@glasgow.ac.uk
% Copyright 2025 Roddy Grieves & Eleonore Duvelle

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION BODY
    % Create figure
    fig_now = figure('Units','pixels','Position',[50 50 210.*3 297.*3],'visible','on');
    set(gcf,'InvertHardCopy','off'); % gives the figure a grey background but means it will save white lines as white    
    set(gcf,'color','w'); % makes the background colour white
    fs = [14 10];

    hbuff = 50;
    vbuff = 220;
    fsiz = 6;

%%%%%%%%%%%%%%%% Brights vs Dulls
    xnow = 50;
    ynow = 650;
    ax1 = axes('Units','pixels','Position',[xnow ynow 110 150]);
        ah = add_panel_title('a',sprintf(''),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);
        
        % Tolman et al. (1946) pp 19
        % Finally, of the 19 rats which chose path No. 6, 10 were Tryon  'brights' and nine were Tryon 'dulls.
        x = 1:2;
        idx = [find( ismember(dat.experiment,'Tolman_et_al_1946') )];
        % Tolman et al. (1946) pp 15
        % Fifty-six female rats, approximately three months old, were used in this experiment. These  rats came from the Tryon stock, and 26 of them "were Trybn 'brighfs' and 30 were Tryon 'dulls'  
        y = [10 9] ./ [26 30] .* 100;
        % Tolman et al. (1946) pp 18
        % On the test trial three of the 5$ rats were discarded because they  made 'No choice' after six min. 
        % Note: we don't know how many of these 3 rats were bright or dulls

        b = bar(x,y,0.9,'k');
        b.FaceColor = 'flat';
        cols = [rgb('Black');rgb('Purple')];
        b.CData = cols;

        ax1.XTickLabel = {'''Bright''','''Dull'''};
        ylabel('Shortcut use (% strain)')
        box off;
        ax1.XLim = [0.5 2.5];
        text(0.1,1,sprintf('X{^2} = %.1f, {\\itp} = %s',0.437,strrep(num2str(0.5086,2),'0.','.')),'VerticalAlignment','bottom','HorizontalAlignment','left','Units','normalized','FontSize',9)

%%%%%%%%%%%%%%%% Rodents vs primates
    xnow = xnow+ax1.Position(3)+hbuff;
    ax2 = axes('Units','pixels','Position',[xnow ynow 110 150]);
        ah = add_panel_title('b',sprintf(''),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        idx = [find( ismember(dat.experiment,'Young_et_al_1967') & ismember(dat.group,'group_5') )...
            find( ismember(dat.experiment,'Young_et_al_1967') & ismember(dat.group,'group_6') )];

        max_or_median = 2; % 1 = max, 2 = mean

        choice_nums = NaN(length(idx),2);        
        for ii = 1:length(idx)
            if isempty(dat.pchoice{idx(ii)})
                c = dat.mean{idx(ii)};
            else
                c = dat.pchoice{idx(ii)};
            end
            s_idx = [];
            if ~any(isnan(dat.short(idx(ii),:)))
                s_idx = dat.short(idx(ii),:);
                if max_or_median==2
                    choice_nums(ii,1) = mean(c(s_idx),"all",'omitmissing');
                elseif max_or_median==1 
                    choice_nums(ii,1) = max(c(s_idx),[],"all",'omitmissing');  
                end
            end
            choice_nums(ii,2) = dat.nchoices(idx(ii));
        end

        x = 1:2;
        y = choice_nums(:,1);

        b = bar(x,y,0.9,'k');
        b.FaceColor = 'flat';
        cols = [rgb('Black');rgb('Purple')];
        b.CData = cols;

        ax2.XTickLabel = {'Rodents','Primates'};
        ylabel('Shortcut use (% subjects)')
        box off;
        ax2.XLim = [0.5 2.5];
        text(0.1,1,sprintf('X{^2} = %.1f, {\\itp} = %s',0.296,strrep(num2str(0.5862,2),'0.','.')),'VerticalAlignment','bottom','HorizontalAlignment','left','Units','normalized','FontSize',9)

        % keyboard
%%%%%%%%%%%%%%%% Wilson and Wilson pointing
    xnow = xnow+ax2.Position(3)+hbuff+60;
    ynow = ynow;
    ax2 = axes('Units','pixels','Position',[xnow ynow 50 150]);
        rdat = xlsread([config.dat_dir 'wilson_wilson_2018_data.csv']); % num, age, group, gender, path, pointing, drawing
        rdat(:,5) = abs( rdat(:,5)-6 ); % path chosen, shortcut = 0
        rdat(:,6) = abs( rdat(:,6) ); % pointing error         

        gidx = rdat(:,3);
        d = NaN(3,3);
        for ii = 1:3
            d(ii,1,1) = sum(rdat(gidx==ii,5)==0) ./ sum(gidx==ii) .* 100;            
            d(ii,2,1) = mean(rdat(gidx==ii,6),'all','omitnan');
            d(ii,3,1) = mean(rdat(gidx==ii,7),'all','omitnan');
        end

        % p1 = stem(1:3,d(:,1),"filled",'Color','k');
        p1 = bar(1:3,d(:,1),0.7,'k');

        ax = gca;
        ax.XLim = [.5 3.5];
        % ax.XTick = 1:3; 
        % pnames2 = {'Stable','Ambient','Unstable'};        
        % ax.XTickLabel = pnames2;
        % ax.XTickLabelRotation = 25;
        % box off
        % ylabel(sprintf('Pointing')) 
        view(90,90)
        box off
        ax3.XColor = 'none';
        text(0.6,-0.1,sprintf('Shortcutting\n(%%)'),'Units','normalized','FontSize',8,'HorizontalAlignment','center','VerticalAlignment','top')

    xnow = 200;
    ax3 = axes('Units','pixels','Position',[ax2.Position(1)-49.5 ynow 50 150]);
        ah = add_panel_title('c',sprintf(''),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        % p1 = stem(1:3,d(:,2),"filled",'Color','r');
        p2 = bar(1:3,d(:,2),0.7,'r');

        ax = gca;
        ax.XLim = [.5 3.5];
        % ax.XTick = 1:3; 
        % pnames2 = {'Stable','Ambient','Unstable'};        
        % ax.XTickLabel = pnames2;
        % ax.XTickLabelRotation = 25;
        % box off
        % ylabel(sprintf('Pointing')) 
        view(270,-90)
        box off
        ax3.XAxisLocation = 'bottom';
        ax3.XTickLabel = {'Stable','Ambient','Unstable'};  
        ax3.YTickLabel{1} = '';
        text(0.4,-0.1,sprintf('Pointing\naccuracy'),'Units','normalized','FontSize',8,'HorizontalAlignment','center','VerticalAlignment','top')






keyboard
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


 