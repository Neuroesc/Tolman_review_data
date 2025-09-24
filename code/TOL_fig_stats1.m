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

%%%%%%%%%%%%%%%% ARGUMENT CHECK


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION BODY
    % Create figure
    fig_now = figure('Units','pixels','Position',[50 50 210.*3 297.*3],'visible','on');
    set(gcf,'InvertHardCopy','off'); % gives the figure a grey background but means it will save white lines as white    
    set(gcf,'color','w'); % makes the background colour white
    fs = [14 10];

    hbuff = 30;
    vbuff = 220;
    fsiz = 6;

%%%%%%%%%%%%%%%% Choice schematic 
    xnow = 20;
    ynow = 680;
    ax1 = axes('Units','pixels','Position',[xnow ynow 560 190],'Color','none');
        ah = add_panel_title('a',sprintf(''),'yoffset',-40,'xoffset',50,'width',400,'fontsize',fs);
        fname = [config.schematic_dir 'choices.png'];
        im = imread(fname,"png");
        image(im);
        axis off;
        box off
        daspect([1 1 1])

%%%%%%%%%%%%%%%% 
    max_or_median = 2; % 1 = max, 2 = mean

    choice_nums = NaN(size(dat,1),7);        
    choice_z = NaN(size(dat,1),5);
    yop = NaN(size(dat,1),1);
    eidx = dat.display_experiment;
    for ii = 1:size(dat,1)
        % if any(ismember(dat.experiment{ii},{'Harley_1979'}))
        %     continue
        % end
        if isempty(dat.pchoice{ii})
            c = dat.mean{ii};
        else
            c = dat.pchoice{ii};
        end
        s_idx = [];
        if ~any(isnan(dat.short(ii,:)))
            s_idx = dat.short(ii,:);
            if max_or_median==2
                choice_nums(ii,1) = mean(c(s_idx),"all",'omitmissing');
            elseif max_or_median==1 
                choice_nums(ii,1) = max(c(s_idx),[],"all",'omitmissing');  
            end
        end
        a_idx = [];
        if ~any(isnan(dat.adjacent(ii,:)))
            a_idx = dat.adjacent(ii,:);
            if max_or_median==2
                choice_nums(ii,2) = mean(c(a_idx),"all",'omitmissing');
            elseif max_or_median==1 
                choice_nums(ii,2) = max(c(a_idx),[],"all",'omitmissing');  
            end              
        end

        o_idx = [];
        if ~any(isnan(dat.outer(ii,:)))
            o_idx = dat.outer(ii,:);
            if max_or_median==2
                choice_nums(ii,3) = mean(c(o_idx),"all",'omitmissing');
            elseif max_or_median==1 
                choice_nums(ii,3) = max(c(o_idx),[],"all",'omitmissing');  
            end                  
        end
        l_idx = [];
        if ~all(isnan(dat.light(ii,:)))
            l_idx = dat.light(ii,:);
            vals = NaN(length(l_idx),1);
            for kk = 1:length(l_idx)
                if isinteger(l_idx(kk))
                    vals(kk,1) = c(l_idx(kk));
                elseif ~isnan(l_idx(kk))
                    x = dat.paths{ii};
                    y = c;
                    nidx = isnan(x) | isnan(y);
                    vals(kk,1) = interp1(x(~nidx),y(~nidx),l_idx(kk),'linear');
                    l_idx(kk) = NaN;
                end
            end
            l_idx = l_idx(~isnan(l_idx));
            if max_or_median==2
                choice_nums(ii,4) = mean(vals,"all",'omitmissing');
            elseif max_or_median==1 
                choice_nums(ii,4) = max(vals,[],"all",'omitmissing');  
            end                
        end

        idx = true(size(c));
        idx([s_idx a_idx o_idx l_idx]) = false;    
        v = c(idx);
        % choice_nums(ii,4) = mean(v,"all",'omitmissing');
        choice_nums(ii,5) = max(v,[],"all",'omitmissing');            
        choice_nums(ii,6:7) = dat.chance_dist(ii,1:2);
    
        choice_z(ii,:) = ( choice_nums(ii,1:5) - dat.chance_dist(ii,1) ) ./ dat.chance_dist(ii,2);
        yop(ii) = dat.year(ii);
    end
    rindx = all(isnan(choice_nums),2);
    choice_nums(rindx,:) = [];
    yop(rindx) = [];
    choice_z(rindx,:) = [];
    eidx(rindx,:) = [];

    [~,i] = sort(yop,1,"ascend","MissingPlacement",'last');
    choice_nums = choice_nums(i,:);
    yop = yop(i);
    choice_z = choice_z(i,:);
    eidx = eidx(i,:);

    xnow = 170;
    ynow = ynow-380;
    ax1 = axes('Units','pixels','Position',[xnow ynow 120 320]);
        ah = add_panel_title('b',sprintf('Results summary'),'yoffset',15,'xoffset',-90,'width',400,'fontsize',fs);
        
        % plot data
        imagesc(choice_z,'AlphaData',~isnan(choice_z));
        % colormap(gca,cmocean('haline'));
        colormap(gca,flipud(cmocean('dense')));
        colormap(gca,'viridis');

        % axis settings
        ax = gca;
        % ax.CLim = [0 70];
        ax.CLim = [floor(min(choice_z,[],"all",'omitmissing')) ceil(max(choice_z,[],"all",'omitmissing'))];
        ax.YTickLabel = [];
        ylabel('');
        ax.XAxisLocation = 'top';
        ax.XTick = 1:5;
        ax.XTickLabel = {'Shortcut','Adjacent','Outer','Cued','Other'};
        xtickangle(25);
        ax.TickLength = [0 0];

        [m,mifo] = max(choice_z,[],2,'omitmissing');

    ax1b = axes('Units','pixels','Position',[ax1.Position(1)-20 ax1.Position(2) 15 ax1.Position(4)]);
        [u,j,i] = unique(eidx,'stable');
        col_idx = i;
        col_idx(i>1) = i(i>1)+2;
        imagesc(col_idx);
        colormap(gca,'inferno');

        for ii = 1:length(u)
            centroid = mean(find(i==ii),"all");
            if ii==10
                centroid = centroid+1;
            end
            text(-0.1,centroid,sprintf('%s',u{ii}),'HorizontalAlignment','right','Interpreter','none','Rotation',0,'FontSize',7);
        end

        % axis settings
        ax = gca;
        ax.YTickLabel = [];
        ylabel('');
        ax.XTickLabel = [];
        xlabel('');
        axis on
        ax.TickLength = [0 0];

    ax2b = axes('Units','pixels','Position',[ax1.Position(1) ax1.Position(2)-20 ax1.Position(3) 15]);
        imagesc(linspace(ax1.CLim(1),ax1.CLim(2),100),zeros(1,100),linspace(ax1.CLim(1),ax1.CLim(2),100));
        ax2b.CLim = ax1.CLim;
        % ax2b.YTickLabel = [];
        ylabel('');
        axis xy
        colormap(gca,ax1.Colormap);

        ax2b.YTick = [];
        ax2b.XTick = unique([ax1.CLim(1) ax2b.XTick]);
        xlabel('Relative to chance (z)')
        ax.TickLength = [0 0];

% keyboard

% %%%%%%%%%%%%%%%% 
%     xnow = 120;
%     ynow = ynow-360;
%     ax1 = axes('Units','pixels','Position',[xnow ynow 120 300]);
%         ah = add_panel_title('b',sprintf('Results summary'),'yoffset',15,'xoffset',-60,'width',400,'fontsize',fs);
% 
%         max_or_median = 2; % 1 = max, 2 = mean
% 
%         choice_nums = NaN(size(dat,1),7);        
%         choice_z = NaN(size(dat,1),5);
%         eidx = dat.display_experiment;
%         for ii = 1:size(dat,1)
%             if any(ismember(dat.experiment{ii},{'Harley_1979'}))
%                 continue
%             end
%             if isempty(dat.pchoice{ii})
%                 c = dat.mean{ii};
%             else
%                 c = dat.pchoice{ii};
%             end
%             s_idx = [];
%             if ~any(isnan(dat.short(ii,:)))
%                 s_idx = dat.short(ii,:);
%                 if max_or_median==2
%                     choice_nums(ii,1) = mean(c(s_idx),"all",'omitmissing');
%                 elseif max_or_median==1 
%                     choice_nums(ii,1) = max(c(s_idx),[],"all",'omitmissing');  
%                 end
%             end
%             a_idx = [];
%             if ~any(isnan(dat.adjacent(ii,:)))
%                 a_idx = dat.adjacent(ii,:);
%                 if max_or_median==2
%                     choice_nums(ii,2) = mean(c(a_idx),"all",'omitmissing');
%                 elseif max_or_median==1 
%                     choice_nums(ii,2) = max(c(a_idx),[],"all",'omitmissing');  
%                 end              
%             end
% 
%             o_idx = [];
%             if ~any(isnan(dat.outer(ii,:)))
%                 o_idx = dat.outer(ii,:);
%                 if max_or_median==2
%                     choice_nums(ii,3) = mean(c(o_idx),"all",'omitmissing');
%                 elseif max_or_median==1 
%                     choice_nums(ii,3) = max(c(o_idx),[],"all",'omitmissing');  
%                 end                  
%             end
%             l_idx = [];
%             if ~all(isnan(dat.light(ii,:)))
%                 l_idx = dat.light(ii,:);
%                 vals = NaN(length(l_idx),1);
%                 for kk = 1:length(l_idx)
%                     if isinteger(l_idx(kk))
%                         vals(kk,1) = c(l_idx(kk));
%                     elseif ~isnan(l_idx(kk))
%                         x = dat.paths{ii};
%                         y = c;
%                         nidx = isnan(x) | isnan(y);
%                         vals(kk,1) = interp1(x(~nidx),y(~nidx),l_idx(kk),'linear');
%                         l_idx(kk) = NaN;
%                     end
%                 end
%                 l_idx = l_idx(~isnan(l_idx));
%                 if max_or_median==2
%                     choice_nums(ii,4) = mean(vals,"all",'omitmissing');
%                 elseif max_or_median==1 
%                     choice_nums(ii,4) = max(vals,[],"all",'omitmissing');  
%                 end                
%             end
% 
%             idx = true(size(c));
%             idx([s_idx a_idx o_idx l_idx]) = false;    
%             v = c(idx);
%             % choice_nums(ii,4) = mean(v,"all",'omitmissing');
%             choice_nums(ii,5) = max(v,[],"all",'omitmissing');            
%             choice_nums(ii,6:7) = dat.chance_dist(ii,1:2);
% 
%             choice_z(ii,:) = ( choice_nums(ii,1:5) - dat.chance_dist(ii,1) ) ./ dat.chance_dist(ii,2);
%         end
%         rindx = all(isnan(choice_nums),2);
%         choice_nums(rindx,:) = [];
%         choice_z(rindx,:) = [];
%         eidx(rindx,:) = [];
% 
%         % plot data
%         imagesc(choice_nums(:,1:5))
%         colormap(gca,cmocean('haline'));
%         colormap(gca,flipud(cmocean('dense')));
% 
%         % axis settings
%         ax = gca;
%         % ax.CLim = [0 70];
%         ax.CLim(1) = 0;
%         ax.YTickLabel = [];
%         ylabel('');
%         ax.XAxisLocation = 'top';
%         ax.XTick = 1:5;
%         ax.XTickLabel = {'Shortcut','Adjacent','Outer','Cued','Other'};
%         xtickangle(25);
%         ax.TickLength = [0 0];
% 
%         [m,mifo] = max(choice_z,[],2,'omitmissing');
% 
%     ax1b = axes('Units','pixels','Position',[ax1.Position(1)-20 ax1.Position(2) 15 ax1.Position(4)]);
%         [u,j,i] = unique(eidx,'stable');
%         col_idx = i;
%         col_idx(i>1) = i(i>1)+2;
%         imagesc(col_idx);
%         colormap(gca,'inferno');
% 
%         for ii = 1:length(u)
%             centroid = mean(find(i==ii),"all");
%             if ii==10
%                 centroid = centroid+1;
%             end
%             text(-0.1,centroid,sprintf('%s',u{ii}),'HorizontalAlignment','right','Interpreter','none','Rotation',55,'FontSize',7);
%         end
% 
%         % axis settings
%         ax = gca;
%         ax.YTickLabel = [];
%         ylabel('');
%         ax.XTickLabel = [];
%         xlabel('');
%         axis on
%         ax.TickLength = [0 0];
% 
%     ax2b = axes('Units','pixels','Position',[ax1.Position(1) ax1.Position(2)-20 ax1.Position(3)-10 15]);
%         imagesc(linspace(ax1.CLim(1),ax1.CLim(2),100),zeros(1,100),linspace(ax1.CLim(1),ax1.CLim(2),100));
%         ax2b.CLim = ax1.CLim;
%         % ax2b.YTickLabel = [];
%         ylabel('');
%         axis xy
%         colormap(gca,ax1.Colormap);
% 
%         ax2b.YTick = [];
%         ax2b.XTick = unique([ax1.CLim(1) ax2b.XTick]);
%         xlabel('Proportion')
%         ax.TickLength = [0 0];
% 
% %%%%%%%%%%%%%%%% 
%     xnow = xnow+ax1.Position(3)+10;
%     ax1b = axes('Units','pixels','Position',[xnow ax1.Position(2) ax1.Position(3) ax1.Position(4)]);
%         % ah = add_panel_title('a',sprintf('Results summary'),'yoffset',20,'xoffset',-60,'width',400,'fontsize',fs);
% 
%         % plot data
%         imagesc(choice_z)
%         colormap(gca,ax1.Colormap);
% 
%         % axis settings
%         ax = gca;
%         ax.CLim = [-4 10];
%         ax.YTickLabel = [];
%         ylabel('');
%         ax.XAxisLocation = 'top';
%         ax.XTick = 1:5;
%         ax.XTickLabel = {'Shortcut','Adjacent','Outer','Cued','Other'};
%         xtickangle(25);
%         ax.TickLength = [0 0];
% 
%     ax2b = axes('Units','pixels','Position',[ax1b.Position(1)+10 ax1b.Position(2)-20 ax1b.Position(3)-10 15]);
%         imagesc(linspace(ax1b.CLim(1),ax1b.CLim(2),100),zeros(1,100),linspace(ax1b.CLim(1),ax1b.CLim(2),100));
%         ax2b.CLim = ax1b.CLim;
%         % ax2b.YTickLabel = [];
%         ylabel('');
%         axis xy
%         colormap(gca,ax1b.Colormap);
% 
%         ax2b.YTick = [];
%         ax2b.XTick = unique([ax1b.CLim(1) ax2b.XTick]);
%         xlabel('Relative to chance (z)')
%         ax.TickLength = [0 0];

%%%%%%%%%%%%%%%% Shortcut vs adjacent likelihood scatter
    xnow = xnow+ax1b.Position(3)+hbuff+120;
    ynow = ynow+180;
    ax2 = axes('Units','pixels','Position',[xnow ynow 200 150]);
        ah = add_panel_title('c',sprintf('Shortcut vs adjacent preference'),'yoffset',0,'xoffset',10,'width',400,'fontsize',fs);

        c = inferno(max(col_idx,[],"all",'omitmissing'));
        % scatter(choice_z(:,1),choice_z(:,2),100,c(i,:),'filled','o','MarkerFaceAlpha',0.5,'MarkerEdgeColor',[.3 .3 .3]); hold on;
        ordered_colors = c(col_idx,:);
        for xx = 1:size(choice_z,1)
            scatter(choice_z(xx,1),choice_z(xx,2),70,ordered_colors(xx,:),'filled','o','MarkerFaceAlpha',0.5,'MarkerEdgeColor',ordered_colors(xx,:),'MarkerEdgeAlpha',1); hold on;
        end

        % axis settings        
        axis square
        line([-100 100],[-100 100],'Color',[.5 .5 .5],'LineStyle','--');
        ax2.XLim = ax2b.CLim;
        ax2.YLim = ax2b.CLim;

        xlabel('Shortcut (z)')
        ylabel('Adjacent (z)')
        colormap(ax2,'inferno');
        grid on

        ax2.XTick = unique([min(ax2.XLim) ax2.XTick]);
        % ax2.YTick = [min(ax2.YLim) ax2.YTick];

        idx1 = find(ismember(eidx,'Tolman et al. (1946)'),1,'first');
        text(choice_z(idx1,1),choice_z(idx1,2)-0.5,sprintf('Tolman et al.\n(1946)'),'HorizontalAlignment','center','VerticalAlignment','top','FontSize',6)

        idx3 = find(ismember(eidx,'Doner et al. (2023)')); 
        idx3 = idx3(4);
        text(choice_z(idx3,1),choice_z(idx3,2)-0.5,sprintf('Doner et al.\n(2023)'),'HorizontalAlignment','center','VerticalAlignment','top','FontSize',6)
% keyboard
        % add covariance ellipses
        data = [choice_z(:,1),choice_z(:,2)];
        
        % Calculate the eigenvectors and eigenvalues
        covariance = cov(data);
        [eigenvec, eigenval ] = eig(covariance);
        
        % Get the index of the largest eigenvector
        [largest_eigenvec_ind_c, r] = find(eigenval == max(max(eigenval)));
        largest_eigenvec = eigenvec(:, largest_eigenvec_ind_c);
        
        % Get the largest eigenvalue
        largest_eigenval = max(max(eigenval));
        
        % Get the smallest eigenvector and eigenvalue
        if(largest_eigenvec_ind_c == 1)
            smallest_eigenval = max(eigenval(:,2));
            smallest_eigenvec = eigenvec(:,2);
        else
            smallest_eigenval = max(eigenval(:,1));
            smallest_eigenvec = eigenvec(1,:);
        end
        
        % Calculate the angle between the x-axis and the largest eigenvector
        angle = atan2(largest_eigenvec(2), largest_eigenvec(1));
        
        % This angle is between -pi and pi.
        % Let's shift it such that the angle is between 0 and 2pi
        if(angle < 0)
            angle = angle + 2*pi;
        end
        
        % Get the coordinates of the data mean
        avg = mean(data);
        
        % Get the 95% confidence interval error ellipse
        cols = winter(3);
        p = [0.9 0.95 0.99];
        px = [];
        for pp = 1:length(p)
            chisquare_val = sqrt(chi2inv(p(pp),2));
            theta_grid = linspace(0,2*pi);
            phi = angle;
            X0=avg(1);
            Y0=avg(2);
            a=chisquare_val*sqrt(largest_eigenval);
            b=chisquare_val*sqrt(smallest_eigenval);
            
            % the ellipse in x and y coordinates 
            ellipse_x_r  = a*cos( theta_grid );
            ellipse_y_r  = b*sin( theta_grid );
            
            %Define a rotation matrix
            R = [ cos(phi) sin(phi); -sin(phi) cos(phi) ];
            
            %let's rotate the ellipse to some angle phi
            r_ellipse = [ellipse_x_r;ellipse_y_r]' * R;
            
            % Draw the error ellipse
            en = plot(r_ellipse(:,1) + X0,r_ellipse(:,2) + Y0,'Color',cols(pp,:),'LineStyle','-');
            px = [px en];
        end

        % use legendflex to add legend
        [~,lh] = legendflex(px,{'90%','95%','99%'},'anchor',{'e','e'},'ncol',1,'box','off','buffer',[20 70],'xscale',.5,'fontsize',9,'ref',ax2,'padding',[20 1 1]); 
        lh(4).Color = cols(1,:);
        lh(6).Color = cols(2,:);
        lh(8).Color = cols(3,:);

%%%%%%%%%%%%%%%% Shortcut proportion of use
    % xnow = xnow;
    ynow = ynow-210;
    ax2 = axes('Units','pixels','Position',[xnow+20 ynow 180 120]);
        ah = add_panel_title('d',sprintf('Shortcut preference'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        y = ( choice_nums(:,1) - choice_nums(:,6) ) ./ choice_nums(:,7);
        x = 1:size(choice_nums,1);

        b = bar(x,y,0.8,'k','EdgeColor','none');
        b.FaceColor = 'flat';
        for kk = 1:size(b.CData,1)
            b.CData(kk,:) = c(col_idx(kk),:);
        end

        % axis settings
        box off
        ax2.YLim = ax2b.CLim+[0 1];

        xlabel('Experiment')
        ylabel('Shortcut (z)')
        ax2.YTick = unique([min(ax2.YLim) ax2.YTick]);
        line(ax2.XLim,[1.96 1.96],'Color',[.5 .5 .5]);
        ax2.XLim = [min(x)-1 max(x)+1];
        ax2.XTick = unique([1 ax2.XTick(ax2.XTick>0) max(x)]);

        idx1 = find(ismember(eidx,'Tolman et al. (1946)'),1,'first');
        text(idx1,ax2.YLim(2),sprintf('Tolman et al. (1946)'),'HorizontalAlignment','left','VerticalAlignment','bottom','FontSize',6,'Rotation',0)
        line([idx1 idx1],[y(idx1) ax2.YLim(2)],'Color','k');

        idx2 = find(ismember(eidx,'Young et al. (1967)'));
        idx2 = idx2(4);
        text(idx2,ax2.YLim(2)-4,sprintf('Young et al. (1967)\nBlind rats'),'HorizontalAlignment','right','VerticalAlignment','bottom','FontSize',6,'Rotation',0)
        line([idx2 idx2],[y(idx2) ax2.YLim(2)-4],'Color','k');

        idx4 = find(ismember(eidx,'Harley (1979)'));
        idx4 = idx4(1);
        text(idx4,ax2.YLim(2)-3,sprintf('Harley (1979)\nSham rats'),'HorizontalAlignment','left','VerticalAlignment','bottom','FontSize',6,'Rotation',0)
        line([idx4 idx4],[y(idx4) ax2.YLim(2)-3],'Color','k');

        idx3 = find(ismember(eidx,'Doner et al. (2023)')); 
        idx3 = idx3(4);
        text(idx3,ax2.YLim(2),sprintf('Doner et al. (2023)\nHumans, stable light'),'HorizontalAlignment','right','VerticalAlignment','bottom','FontSize',6,'Rotation',0)
        line([idx3 idx3],[y(idx3) ax2.YLim(2)],'Color','k');


%%%%%%%%%%%%%%%% Main effect
    xnow = 70;
    ynow = ynow-200;
    ax2c = axes('Units','pixels','Position',[xnow ynow 150 120]);
        ah = add_panel_title('e',sprintf('Experiment results'),'yoffset',-10,'xoffset',0,'width',400,'fontsize',fs);

        choice_z_thresh = choice_z;
        choice_z_thresh(choice_z_thresh < 1.96) = NaN;
        [m,mifo] = max(choice_z_thresh,[],2,'omitmissing');
        mifo(isnan(m)) = 6;

        coef = [sum(mifo(:)==1),sum(mifo(:)==2),sum(mifo(:)==3),sum(mifo(:)==4),sum(mifo(:)==5),sum(mifo(:)==6)];
        x = 1:length(coef);
        y = coef;

        l = {'Shortcut','Adjacent','Outer','Cued','Other','No Pref.'};
        [~,i] = sort(y,'descend');
        y = y(i);
        l = l(i);

        b = bar(x,y,0.9,'k');
        b.FaceColor = 'flat';
        cols = [params.short_color;params.adjacent_color;params.outer_color;params.light_color;rgb('White');rgb('White')];
        b.CData = cols(i,:);

        % additional axis settings
        ax = gca;
        ax.XLim = [0.5 6.5];
        ax.XTickLabel = l;
        ylabel('Experiments')
        box off

        yp = y ./ sum(y,'all','omitmissing') .* 100;
        for ii = 1:length(yp)
            text(ii,y(ii),sprintf('%.f%%',yp(ii)),'FontSize',8,'HorizontalAlignment','center','VerticalAlignment','bottom');
        end

%%%%%%%%%%%%%%%% Adjacent path preference
    xnow = ax2c.Position(1)+ax2c.Position(3)+50;
    ynow = ynow;
    ax3c = axes('Units','pixels','Position',[xnow ynow 100 120]);
        ah = add_panel_title('f',sprintf('Adjacent preference'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);

        adj_nums = NaN(size(dat,1),2);        
        adj_z = NaN(size(dat,1),2);
        out_nums = NaN(size(dat,1),2);        
        out_z = NaN(size(dat,1),2);
        eidx = dat.display_experiment;
        for ii = 1:size(dat,1)
            % if any(ismember(dat.experiment{ii},{'Harley_1979'}))
            %     continue
            % end
            if isempty(dat.pchoice{ii})
                c = dat.mean{ii};
            else
                c = dat.pchoice{ii};
            end

            s_idx = [];
            if ~any(isnan(dat.short(ii,:)))
                s_idx = dat.short(ii,:);

                if ~any(isnan(dat.adjacent(ii,:)))
                    a_idx = dat.adjacent(ii,:);
                    [B,I] = sort(a_idx-s_idx,2,"ascend",'MissingPlacement','last');
                    vals = c(a_idx);
                    vals_ordered = vals(I);
                    adj_nums(ii,:) = vals_ordered;
                end

                if ~any(isnan(dat.outer(ii,:)))
                    o_idx = dat.outer(ii,:);
                    [B,I] = sort(o_idx-s_idx,2,"ascend",'MissingPlacement','last');
                    vals = c(o_idx);
                    vals_ordered = vals(I);
                    out_nums(ii,:) = vals_ordered;
                end
            end

            adj_z(ii,:) = ( adj_nums(ii,1:2) - dat.chance_dist(ii,1) ) ./ dat.chance_dist(ii,2);
            out_z(ii,:) = ( out_nums(ii,1:2) - dat.chance_dist(ii,1) ) ./ dat.chance_dist(ii,2);            
        end
        rindx = all(isnan(adj_nums),2);
        adj_nums(rindx,:) = [];
        adj_z(rindx,:) = [];
        rindx = all(isnan(out_nums),2);
        out_nums(rindx,:) = [];
        out_z(rindx,:) = [];

        adj_z_sig = adj_z(any(adj_z>1.96,2),:);
        out_z_sig = out_z(any(out_z>1.96,2),:);
        % mean(choice_z_sig,1,'omitmissing')
        % std(choice_z_sig,[],1,'omitmissing')
        % [h,p,ci,stats] = ttest(choice_z_sig(:,1),choice_z_sig(:,2),'Tail','both')
        
        [eh,ph,ds,gs] = datadotplot(ax3c,adj_z_sig,'gcolors',[.5 .5 .5],'etype',2,'msize',4);
        [result1,result2,to] = plotsigbrackets(ds,gs,'bracket_y_base',ax3c.YLim(2),'bracket_y_gap_coeff',15,'plot_omnibus',1);

        for jj = 1:length(ph)
            ph{jj}.MarkerFaceColor = [.5 .5 .5];
        end

        % axis settings
        ax = gca;
        ax.XTick = [1 2];
        ax.XTickLabel = {'Intersect','Alternative'};
        ax.XLim = [0.5 size(adj_z_sig,2)+0.5];
        ax.YLim = [-5 15];

        box off
        ylabel('Relative to chance (z)')
        ytickformat(ax,'%.f')
        ax = gca;
        line(ax.XLim,[1.96 1.96],'Color',[.5 .5 .5]);

        for ii = 1:size(adj_z_sig,2)
            p = sum(adj_z_sig(:,ii)>2.576) ./ sum(~isnan(adj_z_sig(:,ii))) .* 100;
            text(ii,ax.YLim(1),sprintf('%.f%%',p),'FontSize',8,'HorizontalAlignment','center','VerticalAlignment','bottom');
        end

%%%%%%%%%%%%%%%% Outer path preference
    xnow = ax3c.Position(1)+ax3c.Position(3)+60;
    ynow = ynow;
    ax4c = axes('Units','pixels','Position',[xnow ynow 100 120]);
        ah = add_panel_title('g',sprintf('Outer preference'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);
       
        [eh,ph,ds,gs] = datadotplot(ax4c,out_z_sig,'gcolors',[.5 .5 .5],'etype',2,'msize',4);
        [result1,result2,to] = plotsigbrackets(ds,gs,'bracket_y_base',ax3c.YLim(2),'bracket_y_gap_coeff',15,'plot_omnibus',1);

        for jj = 1:length(ph)
            ph{jj}.MarkerFaceColor = [.5 .5 .5];
        end

        % axis settings
        ax = gca;
        ax.XTick = [1 2];
        ax.XTickLabel = {'Reward','Alternative'};
        ax.XLim = [0.5 size(out_z_sig,2)+0.5];
        ax.YLim = [-5 15];

        box off
        ylabel('Relative to chance (z)')
        ytickformat(ax,'%.f')
        ax = gca;
        line(ax.XLim,[1.96 1.96],'Color',[.5 .5 .5]);

        for ii = 1:size(out_z_sig,2)
            p = sum(out_z_sig(:,ii)>2.576) ./ sum(~isnan(out_z_sig(:,ii))) .* 100;
            text(ii,ax.YLim(1),sprintf('%.f%%',p),'FontSize',8,'HorizontalAlignment','center','VerticalAlignment','bottom');
        end

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


 