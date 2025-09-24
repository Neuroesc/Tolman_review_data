function TOL_fig_stats2(config,params,dat)
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
        ah = add_panel_title('a',sprintf('Tolman et al. (1946)'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);
        
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
        ah = add_panel_title('b',sprintf('Young et al. (1967)'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

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
        ah = add_panel_title('c',sprintf('Wilson and Wilson (2018)'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

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

%%%%%%%%%%%%%%%% Doner et al. (2023) SBSOD scores
% Across both studies, participants in Experiments 1 and 2 had a mean SBSOD score of 
% 3.7 (SD = 1.0). We then filtered the responses to take a closer look at the SBSOD 
% responses from the participants in the ambient lighting condition, who had no influence 
% of a beacon. There was a total of 80 ambient participants. 6/80 or 8% of participants 
% (2 males, 4 females) total chose the ‘Place response’ hallway (#6) and had an average 
% SBSOD score of 3.2 (SD = 1.6). 27/80 (6 males, 19 females, 1 gender queer/gender 
% nonconforming, 1 transmale) participants had a “kinesthetic response’” hallway 
% choice (Hallways 9 or 10) with an average SBSOD score of 3.7 (SD = 1.0). An independent 
% samples T-Test on the SBSOD scores for all ambient condition participants who executed 
% a “place” or “kinesthetic response” strategy indicated no significant difference in 
% the means t(31) = −1.0, p = .33. Note that due to our small sample size, we could not 
% further divide by gender for the T-Test analysis.
    xnow = 50;
    ynow = ynow-240;
    ax3 = axes('Units','pixels','Position',[xnow ynow 110 150]);
        ah = add_panel_title('d',sprintf('Doner et al. (2023)'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        x = 1:2;
        y = [3.2 3.7];
        s = [1.6 1.0];

        errorbar(x(1),y(1),s(1),'Color',rgb('Black'),'LineStyle','none','Marker','.','MarkerSize',30); hold on;
        errorbar(x(2),y(2),s(2),'Color',rgb('Purple'),'LineStyle','none','Marker','.','MarkerSize',30); hold on;

        ax3.XTick = 1:2;
        ax3.XTickLabel = {'Place','Response'};
        ylabel('SBSOD score')
        box off;
        ax3.XLim = [0.5 2.5];
        ax3.YLim(1) = 0;
        text(0,1,sprintf('t(%d) = %.1f, {\\itp} = %s',31,-1,strrep(num2str(0.33,2),'0.','.')),'VerticalAlignment','bottom','HorizontalAlignment','left','Units','normalized','FontSize',9)

%%%%%%%%%%%%%%%% Harley
    xnow = xnow+ax3.Position(3)+hbuff+20;
    ynow = ynow;
    ax3 = axes('Units','pixels','Position',[xnow ynow 100 150]);
        ah = add_panel_title('e',sprintf('Harley (1979)'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        idx1 = ismember(dat.experiment,{'Harley_1979'}) & ismember(dat.group,{'control'}) & ismember(dat.test,{'test1'});
        idx2 = ismember(dat.experiment,{'Harley_1979'}) & ismember(dat.group,{'hippocampal'}) & ismember(dat.test,{'test1'});
        idx3 = ismember(dat.experiment,{'Harley_1979'}) & ismember(dat.group,{'cortical'}) & ismember(dat.test,{'test1'});
        
        s_idx = dat.short(find(idx1,1),:);
        
        d1 = cell2mat(dat.choice(idx1,:));
        d2 = cell2mat(dat.choice(idx2,:));
        d3 = cell2mat(dat.choice(idx3,:));
        
        p1s = sum(d1(:,s_idx),'all') ./ sum(d1,"all") .* 100;
        p2s = sum(d2(:,s_idx),'all') ./ sum(d2,"all") .* 100;
        p3s = sum(d3(:,s_idx),'all') ./ sum(d3,"all") .* 100;
        % [p1 p2 p3]
        % [sum(d1,"all") sum(d2,"all") sum(d3,"all")]
        
        % a_idx = dat.adjacent(find(idx1,1),1);
        % p1a = sum(d1(:,a_idx),'all') ./ sum(d1,"all") .* 100;
        % p2a = sum(d2(:,a_idx),'all') ./ sum(d2,"all") .* 100;
        % p3a = sum(d3(:,a_idx),'all') ./ sum(d3,"all") .* 100;
        % 
        % v1 = (p1s-p1a) ./ (p1s+p1a);
        % v2 = (p2s-p2a) ./ (p2s+p2a);
        % v3 = (p3s-p3a) ./ (p3s+p3a);

        b = bar(1:3,[p1s p2s p3s],0.9,'k');
        b.FaceColor = 'flat';
        cols = [rgb('Black');rgb('Purple');rgb('Black')];
        b.CData = cols;

        ax3.XTickLabel = {'Sham','Hippocampal','Cortical'};
        ylabel('Shortcut use (%)')
        box off;
        ax3.XLim = [0.5 3.5];

        res = compute2propXtest(sum(d1,"all"), p1s, sum(d2,"all"), p2s);        
        text(0,1,res.text_result,'VerticalAlignment','top','HorizontalAlignment','left','Units','normalized','FontSize',8)
        text(0.5,1,'Lesion pre-training','VerticalAlignment','bottom','HorizontalAlignment','center','Units','normalized','FontSize',9)

    ax3r = axes('Units','pixels','Position',[xnow+ax3.Position(3)+hbuff ax3.Position(2:4)]);
        % ah = add_panel_title('e',sprintf('Harley (1979)'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        idx1 = ismember(dat.experiment,{'Harley_1979'}) & ismember(dat.group,{'retention_control'}) & ismember(dat.test,{'postop1'});
        idx2 = ismember(dat.experiment,{'Harley_1979'}) & ismember(dat.group,{'retention_hippocampus'}) & ismember(dat.test,{'postop1'});
        idx3 = ismember(dat.experiment,{'Harley_1979'}) & ismember(dat.group,{'retention_cortical'}) & ismember(dat.test,{'postop1'});
        
        s_idx = dat.short(find(idx1,1),:);
        
        d1 = cell2mat(dat.choice(idx1,:));
        d2 = cell2mat(dat.choice(idx2,:));
        d3 = cell2mat(dat.choice(idx3,:));
        
        p1s = sum(d1(:,s_idx),'all') ./ sum(d1,"all") .* 100;
        p2s = sum(d2(:,s_idx),'all') ./ sum(d2,"all") .* 100;
        p3s = sum(d3(:,s_idx),'all') ./ sum(d3,"all") .* 100;
        % [p1 p2 p3]
        % [sum(d1,"all") sum(d2,"all") sum(d3,"all")]
        
        % a_idx = dat.adjacent(find(idx1,1),1);
        % p1a = sum(d1(:,a_idx),'all') ./ sum(d1,"all") .* 100;
        % p2a = sum(d2(:,a_idx),'all') ./ sum(d2,"all") .* 100;
        % p3a = sum(d3(:,a_idx),'all') ./ sum(d3,"all") .* 100;
        % 
        % v1 = (p1s-p1a) ./ (p1s+p1a);
        % v2 = (p2s-p2a) ./ (p2s+p2a);
        % v3 = (p3s-p3a) ./ (p3s+p3a);

        b = bar(1:3,[p1s p2s p3s],0.9,'k');
        b.FaceColor = 'flat';
        cols = [rgb('Black');rgb('Purple');rgb('Black')];
        b.CData = cols;

        ax3r.XTickLabel = {'Sham','Hippocampal','Cortical'};
        ylabel('Shortcut use (%)')
        box off;
        ax3r.XLim = [0.5 3.5];
        ax3r.YLim = ax3.YLim;

        res = compute2propXtest(sum(d1,"all"), p1s, sum(d2,"all"), p2s);        
        text(0,1,res.text_result,'VerticalAlignment','top','HorizontalAlignment','left','Units','normalized','FontSize',8)
        text(0.5,1,'Lesion post-training','VerticalAlignment','bottom','HorizontalAlignment','center','Units','normalized','FontSize',9)

%%%%%%%%%%%%%%%% Muir and Taube
    xnow = 50;
    ynow = ynow-250;
    ax4 = axes('Units','pixels','Position',[xnow ynow 130 150]);
        ah = add_panel_title('f',sprintf('Muir and Taube (2004)'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        arm_angs = [0 24 48 72 108 132 156 180];
        goal_arm = [1 1 4 7 4 7 4 7 7 4 7 4 1 4 7 4];
        choice_1_arm = [8 8 8 4 3 6 8 6 6 2 4 6 1 1 1 1];
        num_errors = [4 4 4 7 6 1 3 NaN NaN 2 25 8 0 NaN NaN 2];
        pfd_shift_maze = [-0.93 -6.02 -6.79 4.18 -8.39 14.89 -9.04 12.98 -6.87 0.98 21.24 3.03 4.36 -3.29 NaN -5.04];
        pfd_shift_full = [-5.45 12.51 5.81 -11.05 -10.32 -3.71 2.59 11.36 1.46 1.66 5.24 -6.04 9.22 3.44 3.31 -8.75];

        x = abs( arm_angs(choice_1_arm) - arm_angs(goal_arm) );
        y = abs( pfd_shift_maze );
        x = x(:);
        y = y(:);

        alp = 0.5;
        s = scatter(x,y,50,rgb('Black'),"filled",'MarkerFaceAlpha',alp,'MarkerEdgeColor','none'); hold on;
        r = refline;
        set(r,'Color','r')

        % ax3.XTick = 1:2;
        % ax3.XTickLabel = {'Place','Response'};
        ylabel(sprintf('HD drift |(%c)|',176))
        xlabel(sprintf('Path error |(%c)|',176))
        grid on;
        % box off;
        % ax3.XLim = [0.5 2.5];
        ax4.YLim = [0 50];
        line(ax4.XLim,[0 0],'Color',[.5 .5 .5],'LineStyle','-')

        nindx = ~isnan(x(:)) & ~isnan(y(:));
        [r,p] = corr(x(nindx),y(nindx),"Type","Pearson","Rows",'pairwise');
        text(0.1,1,sprintf('r = %.1f, {\\itp} = %s',r,strrep(num2str(p,2),'0.','.')),'VerticalAlignment','bottom','HorizontalAlignment','left','Units','normalized','FontSize',9)

%%%%%%%%%%%%%%%% Brights vs Dulls
    xnow = xnow+ax4.Position(3)+hbuff+10;
    ax5 = axes('Units','pixels','Position',[xnow ynow 110 150]);
        ah = add_panel_title('g',sprintf('Effect of distal cues'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        idx = [find( ismember(dat.experiment,'doner_et_al_2023') & ismember(dat.group,'stable_light') )...
            find( ismember(dat.experiment,'doner_et_al_2023') & ismember(dat.group,'stable_light_distal') )...
                        find( ismember(dat.experiment,'Young_et_al_1967') & ismember(dat.group,'group_1') )...
            find( ismember(dat.experiment,'Gentry_et_al_1947') & ismember(dat.group,'h1') )];

        max_or_median = 2; % 1 = max, 2 = mean

        choice_nums = NaN(length(idx),5);        
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
                choice_nums(ii,3) = choice_nums(ii,1)';
                choice_nums(ii,1) = ( choice_nums(ii,1) - dat.chance_dist(idx(ii),1) ) ./ dat.chance_dist(idx(ii),2);
                choice_nums(ii,4) = dat.chance_dist(idx(ii),1);
                choice_nums(ii,5) = dat.chance_dist(idx(ii),2);

            end
            choice_nums(ii,2) = dat.nchoices(idx(ii));
        end

        x = 1:2;
        y = choice_nums(:,1);

        b = bar(x,y(1:2),0.9,'k');
        b.FaceColor = 'flat';
        cols = [rgb('Black');rgb('Purple')];
        b.CData = cols;

        ax5.XTickLabel = {'(-)Distal','(+)Distal'};
        ylabel(sprintf('Shortcut use (z)'))
        box off;
        ax5.XLim = [0.5 2.5];
        ax5.YLim = [-2 3];
        line(ax5.XLim,[0 0],'Color','k')
        xlabel('Humans');

        % significance 1
        obs2 = choice_nums(1,3);
        obs1 = choice_nums(2,3);
        mu2 = choice_nums(1,4);
        mu1 = choice_nums(2,4);
        sigma2 = choice_nums(1,5);
        sigma1 = choice_nums(2,5);
        
        muD = mu1 - mu2;
        varD = sigma1^2 + sigma2^2;
        se = sqrt(varD);
        z = ( (obs1 - obs2) - muD ) / se;
        p = 2*(1 - normcdf(abs(z)));
        text(0.5,1,sprintf('z = %.1f, {\\itp} = %s',z,strrep(num2str(p,2),'0.','.')),'VerticalAlignment','bottom','HorizontalAlignment','center','FontSize',8,'Units','normalized')
        % text(1.5,y(1),sprintf('Doner et al. (2023)'),'VerticalAlignment','bottom','HorizontalAlignment','center','FontSize',8)

    ax6 = axes('Units','pixels','Position',ax5.Position+[ax5.Position(3)+10 0 0 0]);
        x = 1:2;
        y = choice_nums(:,1);

        b = bar(x,y(3:4),0.9,'k');
        b.FaceColor = 'flat';
        cols = [rgb('Black');rgb('Purple')];
        b.CData = cols;

        ax6.XTickLabel = {'(-)Distal','(+)Distal'};
        ylabel(sprintf('Shortcut use (z)'))
        box off;
        ax6.XLim = ax5.XLim;
        ax6.YLim = ax5.YLim;
        ax6.YColor = 'none';
        line(ax6.XLim,[0 0],'Color','k')
        xlabel('Rodents');

        % significance 2
        obs2 = choice_nums(3,3);
        obs1 = choice_nums(4,3);
        mu2 = choice_nums(3,4);
        mu1 = choice_nums(4,4);
        sigma2 = choice_nums(3,5);
        sigma1 = choice_nums(4,5);
        
        muD = mu1 - mu2;
        varD = sigma1^2 + sigma2^2;
        se = sqrt(varD);
        z = ( (obs1 - obs2) - muD ) / se;
        p = 2*(1 - normcdf(abs(z)));
        text(0.5,1,sprintf('z = %.1f, {\\itp} = %s',z,strrep(num2str(p,2),'0.','.')),'VerticalAlignment','bottom','HorizontalAlignment','center','FontSize',8,'Units','normalized')

        % text(0.5,y(3),sprintf('Young et al. (1967)'),'VerticalAlignment','bottom','HorizontalAlignment','left','FontSize',8)
        % text(2.5,y(4),sprintf('Gentry et al. (1947)'),'VerticalAlignment','top','HorizontalAlignment','right','FontSize',8)

% keyboard
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


 