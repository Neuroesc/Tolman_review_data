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
    for jj = 1:size(dat,1)
        idx = jj;
        if isfield(dat,'chance_dist') && ~all(isnan(dat.chance_dist(jj,:)))
            continue
        end

        if isempty(dat.mean{idx}) % we want to plot percentage chosen not count
            n = sum(dat.choice{idx},"all","omitmissing");
            c = sum(~isnan(dat.choice{idx}));
        else
            n = round(sum(dat.mean{idx},"all","omitmissing"));
            c = sum(~isnan(dat.mean{idx}));
        end
        o = (1:c)';
        iti = 1000;
        rindx = NaN(iti,c);
        for ii = 1:iti
            rn = randi(c,n,1);
            cn = o(rn);
            rindx(ii,:) = accumarray(cn,ones(size(cn)),size(o),@sum);
        end
        if isempty(dat.mean{idx(1)}) % we will plot percentage chosen not count
            pindx = rindx ./ n .* 100;
        else
            pindx = rindx;        
        end

        m = mean(pindx,"all",'omitmissing');
        s = std(pindx,[],"all",'omitmissing');
        v1 = 1.650.*s;
        v2 = 2.326.*s;

        dat.chance_dist(jj,1:4) = [m s v1 v2];
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION BODY
    % Create figure
    fig_now = figure('Units','pixels','Position',[50 50 210.*5 297.*3],'visible','on');
    set(gcf,'InvertHardCopy','off'); % gives the figure a grey background but means it will save white lines as white    
    set(gcf,'color','w'); % makes the background colour white
    fs = [14 10];

    hbuff = 30;
    vbuff = 220;
    fsiz = 6;

%%%%%%%%%%%%%%%% 
    xnow = 120;
    ynow = 400;
    ax1 = axes('Units','pixels','Position',[xnow ynow 150 400]);
        ah = add_panel_title('a',sprintf('Results summary'),'yoffset',20,'xoffset',-60,'width',400,'fontsize',fs);

        max_or_median = 2; % 1 = max, 2 = mean

        choice_nums = NaN(size(dat,1),7);        
        choice_z = NaN(size(dat,1),5);
        eidx = dat.display_experiment;
        for ii = 1:size(dat,1)
            if any(ismember(dat.experiment{ii},{'Harley_1979'}))
                continue
            end
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
        end
        rindx = all(isnan(choice_nums),2);
        choice_nums(rindx,:) = [];
        choice_z(rindx,:) = [];
        eidx(rindx,:) = [];

        % plot data
        imagesc(choice_nums(:,1:5))
        colormap(gca,cmocean('haline'));
        colormap(gca,flipud(cmocean('dense')));

        % axis settings
        ax = gca;
        % ax.CLim = [0 70];
        ax.CLim(1) = 0;
        ax.YTickLabel = [];
        ylabel('');
        ax.XAxisLocation = 'top';
        ax.XTick = 1:5;
        ax.XTickLabel = {'Shortcut','Adjacent','Outer','Light','Other'};
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
            text(-0.1,centroid,sprintf('%s',u{ii}),'HorizontalAlignment','right','Interpreter','none','Rotation',55,'FontSize',8);
        end

        % axis settings
        ax = gca;
        ax.YTickLabel = [];
        ylabel('');
        ax.XTickLabel = [];
        xlabel('');
        axis on
        ax.TickLength = [0 0];

    ax2b = axes('Units','pixels','Position',[ax1.Position(1) ax1.Position(2)-20 ax1.Position(3)-10 15]);
        imagesc(linspace(ax1.CLim(1),ax1.CLim(2),100),zeros(1,100),linspace(ax1.CLim(1),ax1.CLim(2),100));
        ax2b.CLim = ax1.CLim;
        % ax2b.YTickLabel = [];
        ylabel('');
        axis xy
        colormap(gca,ax1.Colormap);

        ax2b.YTick = [];
        ax2b.XTick = unique([ax1.CLim(1) ax2b.XTick]);
        xlabel('Proportion')
        ax.TickLength = [0 0];
% keyboard
%%%%%%%%%%%%%%%% 
    xnow = xnow+ax1.Position(3)+10;
    ynow = 400;
    ax1b = axes('Units','pixels','Position',[xnow ynow 150 400]);
        % ah = add_panel_title('a',sprintf('Results summary'),'yoffset',20,'xoffset',-60,'width',400,'fontsize',fs);

        % plot data
        imagesc(choice_z)
        colormap(gca,ax1.Colormap);

        % axis settings
        ax = gca;
        ax.CLim = [-4 10];
        ax.YTickLabel = [];
        ylabel('');
        ax.XAxisLocation = 'top';
        ax.XTick = 1:5;
        ax.XTickLabel = {'Shortcut','Adjacent','Outer','Light','Other'};
        xtickangle(25);
        ax.TickLength = [0 0];

    ax2b = axes('Units','pixels','Position',[ax1b.Position(1)+10 ax1b.Position(2)-20 ax1b.Position(3)-10 15]);
        imagesc(linspace(ax1b.CLim(1),ax1b.CLim(2),100),zeros(1,100),linspace(ax1b.CLim(1),ax1b.CLim(2),100));
        ax2b.CLim = ax1b.CLim;
        % ax2b.YTickLabel = [];
        ylabel('');
        axis xy
        colormap(gca,ax1b.Colormap);

        ax2b.YTick = [];
        ax2b.XTick = unique([ax1b.CLim(1) ax2b.XTick]);
        xlabel('Relative to chance (z)')
        ax.TickLength = [0 0];

%%%%%%%%%%%%%%%% Shortcut vs adjacent likelihood scatter
    xnow = xnow+ax1b.Position(3)+hbuff+40;
    ynow = ynow+225;
    ax2 = axes('Units','pixels','Position',[xnow ynow 200 200]);
        ah = add_panel_title('b',sprintf('Shortcut vs adjacent likelihood'),'yoffset',-10,'xoffset',0,'width',400,'fontsize',fs);

        c = inferno(max(col_idx,[],"all",'omitmissing'));
        % scatter(choice_z(:,1),choice_z(:,2),100,c(i,:),'filled','o','MarkerFaceAlpha',0.5,'MarkerEdgeColor',[.3 .3 .3]); hold on;
        ordered_colors = c(col_idx,:);
        for xx = 1:size(choice_z,1)
            scatter(choice_z(xx,1),choice_z(xx,2),100,ordered_colors(xx,:),'filled','o','MarkerFaceAlpha',0.5,'MarkerEdgeColor',ordered_colors(xx,:),'MarkerEdgeAlpha',1); hold on;
        end

        % axis settings        
        axis square
        line([-100 100],[-100 100],'Color',[.5 .5 .5],'LineStyle','--');
        ax2.XLim = ax1b.CLim;
        ax2.YLim = ax1b.CLim;

        xlabel('Shortcut (z)')
        ylabel('Adjacent (z)')
        colormap(ax2,'inferno');
        grid on

        ax2.XTick = unique([min(ax2.XLim) ax2.XTick]);
        % ax2.YTick = [min(ax2.YLim) ax2.YTick];

        text(choice_z(1,1),choice_z(1,2)-0.5,sprintf('Tolman et al.\n(1946)'),'HorizontalAlignment','center','VerticalAlignment','top','FontSize',8)
        text(choice_z(62,1),choice_z(62,2)-0.5,sprintf('Doner et al.\n(2023)'),'HorizontalAlignment','center','VerticalAlignment','top','FontSize',8)
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
        [~,lh] = legendflex(px,{'90%','95%','99%'},'anchor',{'e','e'},'ncol',1,'box','off','buffer',[0 70],'xscale',.5,'fontsize',9,'ref',ax2,'padding',[20 1 1]); 

%%%%%%%%%%%%%%%% Shortcut proportion of use
    % xnow = xnow;
    ynow = ynow-250;
    ax2 = axes('Units','pixels','Position',[xnow ynow 200 150]);
        ah = add_panel_title('c',sprintf('Shortcut likelihood'),'yoffset',10,'xoffset',0,'width',400,'fontsize',fs);

        y = ( choice_nums(:,1) - choice_nums(:,6) ) ./ choice_nums(:,7);
        x = 1:size(choice_nums,1);

        b = bar(x,y,0.8,'k','EdgeColor','none');
        b.FaceColor = 'flat';
        for kk = 1:size(b.CData,1)
            b.CData(kk,:) = c(col_idx(kk),:);
        end

        % axis settings
        box off
        ax2.YLim = ax1b.CLim;

        xlabel('Experiment')
        ylabel('Shortcut (z)')
        ax2.YTick = [min(ax2.YLim) ax2.YTick];

        text(1,y(1)+1,sprintf('Tolman et al. (1946)'),'HorizontalAlignment','left','VerticalAlignment','top','FontSize',6,'Rotation',30)
        text(23,y(23)+1,sprintf('Young et al. (1967)\nBlind rats'),'HorizontalAlignment','left','VerticalAlignment','top','FontSize',6,'Rotation',30)
        text(62,y(62)+1,sprintf('Doner et al. (2023)\nHumans, stable light'),'HorizontalAlignment','left','VerticalAlignment','top','FontSize',6,'Rotation',30)

%%%%%%%%%%%%%%%% Main effect schematic
    xnow = 50;
    ynow = ynow-280;
    % ax2 = axes('Units','pixels','Position',[xnow ynow 250 150]);
    %     ah = add_panel_title('d',sprintf('Experiment results'),'yoffset',0,'xoffset',0,'width',400,'fontsize',fs);
    % 
    %     % plot shaded areas etc
    %     idx = find( ismember(dat.experiment,'Tolman_et_al_1946') );
    %     ax = gca;
    %     params_now = params;
    %     % params.short_color = params.cols(90,:);
    %     params_now.choice_color = 'none';
    %     % params.adjacent_color = params.cols(60,:);
    %     params_now.chance_color = 'none';
    %     params_now.training_color = 'none';
    %     params_now.c1 = 'none';
    %     params_now.c2 = 'none';
    %     params_now.c3 = 'none';
    %     params_now.c4 = 'none';
    %     params_now.c5 = 'none';
    %     params_now.c6 = 'none';
    %     [hx,px,lx,c] = TOL_plotter(ax,dat,idx,params_now);
    % 
    % 
    %     xi = linspace(1,18,100);
    %     cols = [params.adjacent_color;params.short_color;rgb('SlateBlue');rgb('Black');rgb('Black')];
    %     xvals = [9.5,6,5,1,18];
    %     coef = [sum(mifo(:)==1),sum(mifo(:)==2),sum(mifo(:)==3),sum(mifo(:)==4),sum(mifo(:)==5)];
    %     h = [];
    %     s = 1.2;
    %     for jj = 1:length(xvals)
    %         if jj==1
    %             p1 = normpdf(xi,9,s) + normpdf(xi,10,s); % training route
    %         else
    %             p1 = normpdf(xi,xvals(jj),s); % training route
    %         end
    %         p1 = p1 ./ max(p1,[],"all") .* 0.9;
    %         % hnow = plot(xi,p1,'Color',cols(jj,:),'LineWidth',1.5); hold on;
    %         hnow = area(xi,p1,'FaceColor',cols(jj,:),'EdgeColor','none','FaceAlpha',0.4); hold on;
    %         h = [h hnow];
    %     end
    % 
    %     % additional axis settings
    %     ax.XDir = 'reverse';
    %     ax.YLim = [0 1];
    %     ax.YTick = [];
    %     ax.XLim = [0.5 18.5];
    % 
    %     % plot light sources
    %     light_positions = [5];
    %     lnames = {'L',};
    %     y = ones(size(light_positions)) .* ax.YLim(2) .* 0.95;
    %     scatter(light_positions,y,150,"yellow","filled",'s','MarkerEdgeColor','k','Clipping','off');        
    %     text(light_positions,y,lnames,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8,'Rotation',0,'Clipping','off');

    ax2b = axes('Units','pixels','Position',[xnow ynow 350 230]);
        ah = add_panel_title('d',sprintf('Experiment results'),'yoffset',-30,'xoffset',40,'width',400,'fontsize',fs);

        fname = [config.schematic_dir 'findings.png'];
        im = imread(fname,"png");
        image(im);
        axis off;
        daspect([1 1 1])

    ax2c = axes('Units','pixels','Position',[ax2b.Position(1)+ax2b.Position(3)+20 ax2b.Position(2)+50 130 150]);
        coef = [sum(mifo(:)==1),sum(mifo(:)==2),sum(mifo(:)==3),sum(mifo(:)==4),sum(mifo(:)==5)];
        x = 1:length(coef);
        y = coef;

        l = {'Shortcut','Adjacent','Outer','Light','Other'};
        [~,i] = sort(y,'descend');
        y = y(i);
        l = l(i);

        b = bar(x,y,0.9,'k');
        b.FaceColor = 'flat';
        cols = [params.short_color;params.adjacent_color;rgb('Black');rgb('SlateBlue');rgb('White')];
        b.CData = cols(i,:);

        % additional axis settings
        ax = gca;
        ax.XLim = [0.5 5.5];
        ax.XTickLabel = l;
        ylabel('Experiments')
        box off

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


 