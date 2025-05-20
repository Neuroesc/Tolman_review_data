function TOL_main
% tfigpaper
% Main code to plot figures for Duvelle and Grieves review
% See individual figure function comments for details about where the data were collected or defined
% 
% SEE ALSO tfigpaper_main_plot

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
    close all;
    dat = TOL_data;

    % configuration settings
    config = struct;
    config.fig_dir = 'C:\Users\roddyg\Documents\GitHub\neuroesc\Tolman_review_data\main figures\';
    config.schematic_dir = 'C:\Users\roddyg\Documents\GitHub\neuroesc\Tolman_review_data\schematics\';    
    config.fast_figs = false;
    config.save_fig = 1;

    % parameters for plots
    params = struct;
    params.cols = inferno(128);
    params.short_color = params.cols(90,:);
    params.choice_color = params.cols(1,:);
    params.choice_marker = 'd'; % marker to use showing % choices      
    params.adjacent_color = params.cols(60,:);
    params.chance_color = [.5 .5 .5; .5 .5 .5];
    params.chance_style = '--';
    params.chance_shading = [0.5 0.25];
    params.training_color = [0 0 0];
    params.training_style = '--';
    params.shading_alpha = 0.2;
    params.linestyle = '-';
    params.c1 = rgb('Black');
    params.c2 = rgb('Crimson');
    params.c3 = rgb('ForestGreen');
    params.c4 = rgb('SlateBlue');
    params.c5 = rgb('Fuchsia');
    params.c6 = rgb('Navy');
    params.m1 = 'o';
    params.m2 = '^';
    params.m3 = 's';
    params.m4 = 'd';
    params.m5 = 'p';
    params.m6 = 'v';
    params.style_offset = 0;

    % plotting options
    plot_opts.plot_tolman1946 = 0; % Fig 1 Tolman et al. (1946) 
    plot_opts.plot_gentry1947 = 0; % Fig 2 Gentry et al. (1947) & Birch and Korn (1958)
    plot_opts.plot_ritchie1948 = 0; % Fig 3 Ritchie (1948)
    plot_opts.plot_gentry1948 = 0; % Fig 4 Gentry et al. (1948) 
    plot_opts.plot_wilson2018 = 0; % Fig 5 Wilson and Wilson (2018) & Doner et al. (2023)
    plot_opts.plot_kendler1947 = 0; % Fig 6 Kendler et al. (1947; 1948)
    plot_opts.plot_young1967 = 0; % Fig 7 Young et al. (1967)
    plot_opts.plot_harley1979 = 0; % Fig 8 Harley (1979)
    plot_opts.plot_muir2004 = 0; % Fig 9 Muir and Taube (2004)
    plot_opts.plot_overall_stats = 1; % Fig 10


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION BODY
%%%%%%%%%%%%%%%% Tolman et al. (1946) 
    if plot_opts.plot_tolman1946
        config.fig_name = 'Fig 1.png';
        TOL_fig_tolman1946(config,params,dat);
    end

%%%%%%%%%%%%%%%% Gentry et al. (1947) & Birch and Korn (1958)
    if plot_opts.plot_gentry1947
        config.fig_name = 'Fig 2.png';
        TOL_fig_gentry1947(config,params,dat);
    end

%%%%%%%%%%%%%%%% Ritchie (1948)
    if plot_opts.plot_ritchie1948
        config.fig_name = 'Fig 3.png';
        TOL_fig_ritchie1948(config,params,dat);
    end

%%%%%%%%%%%%%%%% Gentry et al. (1948) 
    if plot_opts.plot_gentry1948
        config.fig_name = 'Fig 4.png';
        TOL_fig_gentry1948(config,params,dat);
    end

%%%%%%%%%%%%%%%% Wilson and Wilson (2018) & Doner et al. (2023)
    if plot_opts.plot_wilson2018
        config.fig_name = 'Fig 5.png';
        TOL_fig_wilson2018(config,params,dat);
    end

%%%%%%%%%%%%%%%% Kendler et al. (1947; 1948)
    if plot_opts.plot_kendler1947
        config.fig_name = 'Fig 6.png';
        TOL_fig_kendler1947(config,params,dat);
    end

%%%%%%%%%%%%%%%% Young et al. (1967)
    if plot_opts.plot_young1967
        config.fig_name = 'Fig 7.png';
        TOL_fig_young1967(config,params,dat);
    end

%%%%%%%%%%%%%%%% Harley (1979)
    if plot_opts.plot_harley1979
        config.fig_name = 'Fig 8.png';
        TOL_fig_harley1979(config,params,dat);
    end

%%%%%%%%%%%%%%%% Muir and Taube (2004)
    if plot_opts.plot_muir2004
        config.fig_name = 'Fig 9.png';
        TOL_fig_muir2004(config,params,dat);
    end

%%%%%%%%%%%%%%%% Overall stats
    if plot_opts.plot_overall_stats
        config.fig_name = 'Fig 10.png';
        TOL_fig_stats1(config,params,dat);
    end








% 
return
% 
% idx = find(ismember(dat.experiment,'Gentry_et_al_1947') & ismember(dat.group,'h1') & ismember(dat.test,'final_choice'));
% 
% m_s = dat.short(idx(1),:); % shortcut
% m_a = dat.training(idx(1),:); % training start
% m_of = 1; % outer towards food
% m_oa = 18; % outer away from food
% m_l = 5; % light
% mus = [m_s; m_a; m_of; m_oa; m_l];
% sigma = 1;
% 
% gm = gmdistribution(mus',repmat(sigma,size(mus,1),size(mus,1)));
% 
% 
% d = dat.pchoice(idx);
% 
% 






v1 = [0 24+36+18+18]; % north
v2 = [-18 0]; % west
v3 = [60 0]; % east
vs = [v1;v2;v3];
[th,ra] = cart2pol(vs(:,1),vs(:,2));
vs = normalize(vs,2,'norm');
w = ra ./ sum(ra,"all");
vs = vs .* w(:);

% iti = 1000;
% d = NaN(iti,2);
% for ii = 1:iti
%     % rindx = randi(size(th,1),1);
%     nv = randi(size(vs,1),1);
%     rindx = randsample(1:length(th),nv,true,w);
%     temp_vect = sum(vs(rindx,:),1);
%     [t_temp,r_temp] = cart2pol(temp_vect(:,1),temp_vect(:,2));
%     d(ii) = rad2deg( t_temp );
% 
%     % keyboard
% end
% 
% xi = linspace(0,180,19);
% x = movmean(xi,2,'Endpoints','discard');
% h = histcounts(d(:,1),xi,'Normalization','count');
% 
% figure
% tiledlayout('flow')
% nexttile
% bar(x,h,0.9,'k');
% 
% nexttile
% bar(x,imgaussfilt(h,1.5),0.9,'k');



xi = linspace(0,180,19);
xi = [0:10:80 100:10:180];
m = rad2deg(th);
% s = ra./sum(ra,"all").*100;
s = (1-vs).*10;
y1 = normpdf(xi,m(1),s(1));
y2 = normpdf(xi,m(2),s(2));
y3 = normpdf(xi,m(3),s(3));
y1 = y1 ./ sum(y1,"all");
y2 = y2 ./ sum(y2,"all");
y3 = y3 ./ sum(y3,"all");


w = ( ra ./ sum(ra,"all") );
d = y1 .* w(1) + y2 .* w(2) + y3 .* w(3);
% d = y1 .* ra(1) .* y2 .* ra(2)  y3 .* ra(3);


figure
tiledlayout('flow')
nexttile
bar(xi,y1,0.9,'r'); hold on;
bar(xi,y2,0.9,'g');
bar(xi,y3,0.9,'b');

nexttile
bar(xi,d,0.9,'k');





% keyboard

return
choice_nums = NaN(size(dat,1),4);
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
        choice_nums(ii,1) = c(s_idx);
    end
    a_idx = [];
    if ~any(isnan(dat.adjacent(ii,:)))
        a_idx = dat.adjacent(ii,:);
        choice_nums(ii,2) = mean(c(a_idx),"all",'omitmissing');
    end
    o_idx = [];
    if ~any(isnan(dat.outer(ii,:)))
        o_idx = dat.outer(ii,:);
        choice_nums(ii,3) = mean(c(o_idx),"all",'omitmissing');
    end
    idx = true(size(c));
    idx([s_idx a_idx o_idx]) = false;    
    v = c(idx);
    % choice_nums(ii,4:(4+length(v)-1)) = v;
    choice_nums(ii,4) = mean(v,"all",'omitmissing');

    choice_nums(ii,:) = choice_nums(ii,:) - dat.chance(ii);
end
% choice_nums(all(isnan(choice_nums),2),:) = [];


figure
tiledlayout('flow');
nexttile([2 1])
imagesc(choice_nums)
colormap(cmocean('balance'))
colorbar
caxis([-25 30])

nexttile([1 1])
plot(choice_nums')

nexttile([1 1])


figure
[C,IA,IC] = unique(dat.experiment);

c = inferno(max(IC,[],"all",'omitmissing'));
scatter(choice_nums(:,1),choice_nums(:,2),120,c(IC,:),'filled','o','MarkerFaceAlpha',0.5); hold on;
text(choice_nums(ismember(dat.experiment,'Tolman_et_al_1946'),1),choice_nums(ismember(dat.experiment,'Tolman_et_al_1946'),2),'T','HorizontalAlignment','center','VerticalAlignment','middle')
text(choice_nums(ismember(dat.experiment,'wilson_2018'),1),choice_nums(ismember(dat.experiment,'wilson_2018'),2),'w','HorizontalAlignment','center','VerticalAlignment','middle')
text(choice_nums(ismember(dat.experiment,'doner_et_al_2023'),1),choice_nums(ismember(dat.experiment,'doner_et_al_2023'),2),'d','HorizontalAlignment','center','VerticalAlignment','middle')
text(choice_nums(ismember(dat.experiment,'Harley_1979'),1),choice_nums(ismember(dat.experiment,'Harley_1979'),2),'h','HorizontalAlignment','center','VerticalAlignment','middle')

% keyboard
axis square
a = axis;
line([-100 100],[-100 100],'Color',[.5 .5 .5],'LineStyle','--');
axis(a);
% colormap('viridis')







% rng(1); % For reproducibility
% X = choice_nums(:,[1 2]);
% [idx,C] = kmeans(X,2);
% x1 = min(X(:,1)):0.01:max(X(:,1));
% x2 = min(X(:,2)):0.01:max(X(:,2));
% [x1G,x2G] = meshgrid(x1,x2);
% XGrid = [x1G(:),x2G(:)]; % Defines a fine grid on the plot
% 
% idx2Region = kmeans(XGrid,2,'MaxIter',100,'Start',C);
% 
% figure;
% gscatter(XGrid(:,1),XGrid(:,2),idx2Region,...
%     [0,0.75,0.75;0.75,0,0.75;0.75,0.75,0],'..');
% hold on;
% plot(X(:,1),X(:,2),'k*','MarkerSize',5);
% title 'Fisher''s Iris Data';
% xlabel 'Petal Lengths (cm)';
% ylabel 'Petal Widths (cm)'; 
% legend('Region 1','Region 2','Region 3','Data','Location','SouthEast');
% hold off;


return



















