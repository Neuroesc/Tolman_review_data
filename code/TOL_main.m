function TOL_main
% TOL_main, main code for Duvelle and Grieves (2025)
% Code to plot figures for: Duvelle and Grieves (2025) Tolman's Sunburst Maze 80 
% years on: A meta-analysis reveals poor replicability and little evidence for 
% shortcutting. European Journal of Neuroscience. DOI: 10.1111/ejn.70365
% Data are stored and loaded using TOL_data
%
% SEE ALSO TOL_data, TOL_plotter

% HISTORY
%
% version 1.0.0, Release 15/04/25 Initial release
% version 1.1.0, Release 20/04/25 GitHub release
% version 2.0.0, Release 13/12/25 Publication release
% version 2.1.0, Release 14/12/25 Publication release for all OSes
%
% NOTES
%
% (1) All main studies discussed in the review should be available alongside this
% code within the same repository, if not, please contact the authors for copies
% of any papers that are inaccessible.
%
% (2) Data were digitized using the WebPlotDigitizer available at https://automeris.io
% Data were also available for some studies online:
% Doner et al. (2023): http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
% and Wilson and Wilson (2018): https://ndownloader.figstatic.com/files/13987709
%
% (3) All citations:
% Published:
% Tolman, E. C., Ritchie, B. F., & Kalish, D. (1946). Studies in spatial learning: Orientation and the short-cut. Journal of experimental psychology, 36, 13–24
% Gentry, G., Brown, W. L., & Kaplan, S. J. (1947). An experimental analysis of the spatial location hypothesis in learning. Journal of Comparative and ….
% Birch, H. G., & Korn, S. J. (1958). Place-learning, cognitive maps, and parsimony. The Journal of general psychology, 58(1), 17–35.
% Ritchie, B. F. (1948). Studies in spatial learning; place orientation and direction orientation. Journal of experimental psychology, 38(6), 659–669.
% Gentry, G., Brown, W. L., & Lee, H. (1948). Spatial location in the learning of a multiple-t maze. Journal of comparative and physiological psychology, 41(5), 312–318.
% Wilson, S. P., & Wilson, P. N. (2018). Failure to demonstrate short-cutting in a replication and extension of Tolman et al.’s spatial learning experiment with humans. Plos One, 13(12), e0208794.
% Doner, S., Zheng, J., McAvan, A. S., Starrett, M. J., Campbell, H., Sanders, D., & Ekstrom, A. (2023). Evidence for flexible navigation strategies during spatial learning involving path choices. Spatial Cognition & Computation, 23(3), 233–262.
% Kendler, H. H., & Gasser, W. P. (1948). Variables in spatial learning; number of reinforcements during training. Journal of comparative and physiological psychology, 41(3), 178–187.
% Kendler, H. H., & Mencher, H. C. (1949). Variables in spatial learning. II. Degree of motivation during training and test trials. Journal of comparative and physiological psychology, 42(6), 493–501.
% Young, H. F., Greenberg, E. R., Paton, W., & Jane, J. A. (1967). A reinvestigation of cognitive maps. Psychonomic science, 9(11), 589–590.
% Dawson, J. L. (1972). Effects of sex hormones on cognitive style in rats and men. Behavior Genetics, 2(1), 21–42.
% Harley, C. W. (1979). Arm choices in a sunburst maze: effects of hippocampectomy in the rat. Physiology & Behavior, 23(2), 283–290.
% Muir, G. M., & Taube, J. S. (2004). Head direction cell activity and behavior in a navigation task requiring a cognitive mapping strategy. Behavioural Brain Research, 153(1), 249–253.
% Theses and dissertations:
% Chamberlain, H. (1947). An experimental investigation of the relation of motivation to the degree of spatial learning in the white rat (Masters thesis). University of Colorado.
% Michik, G. L. (1973). Protein malnutrition and cognitive style in hooded rats: an anthropological analog (Masters thesis). Western Washington State College 
% Ritchie, B. F. (1946). Spatial learning in rats (PhD thesis) University of California, Berkeley
%
% AUTHOR 
%
% Roddy Grieves
% University of Glasgow, Sir James Black Building
% Neuroethology and Spatial Cognition Lab
% eMail: roddy.grieves atglasgow.ac.uk, eleonore.duvelle atglasgow.ac.uk
% Copyright 2025 Roddy Grieves

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% INPUTS
    close all;
    dat = TOL_data; % collect data for all studies in a table

    % configuration settings
    config = struct;
    % Note: need to run this from the code folder, if not, ask the user to do so
    config.main_path = 'C:\Users\roddyg\Documents\GitHub\neuroesc\Tolman_review_data';    
    if ~exist(config.main_path,'dir')
        warning('config.main_path does not exist. Define config.main_path in TOL_main as the location of Tolman_review_data directory to avoid directory selection in future.')
        config.main_path = uigetdir(pwd,'Select Tolman_review_data directory');
    end
    config.dat_dir = fullfile(config.main_path, 'data'); % where the data files are/will be saved
    config.fig_dir = fullfile(config.main_path, 'main figures'); % where the main figures will be saved
    config.schematic_dir = fullfile(config.main_path, 'schematics');% where schematics can be found
    config.fast_figs = false; % save figures faster but at a lower quality
    config.save_fig = 0; % 1 = save figures, 0 = do not save

    % main figures
    plot_opts.plot_tolman1946       = 0; % TOL_fig_tolman1946   % Fig 1 Tolman et al. (1946)
                                                                % Fig 2 was created entirely in Inkscape
    plot_opts.plot_overall_stats1   = 0; % TOL_fig_stats1       % Fig 3, Tolman's results stand out
    plot_opts.plot_overall_stats2   = 0; % TOL_fig_stats2       % Fig 4, What does the task measure?

    % supplementary figures
    plot_opts.plot_tryon1929        = 0; % TOL_fig_tryon1929    % Fig S1 Tolman, Tryon and Jeffress (1929)    
    plot_opts.plot_gentry1947       = 0; % TOL_fig_gentry1947   % Fig S2 Gentry et al. (1947) & Birch and Korn (1958)
    plot_opts.plot_harley1979       = 0; % TOL_fig_harley1979   % Fig S3 Harley (1979)
    plot_opts.plot_wilson2018       = 0; % TOL_fig_wilson2018   % Fig S4 Wilson and Wilson (2018) & Doner et al. (2023)
    plot_opts.plot_young1967        = 0; % TOL_fig_young1967    % Fig S5 Young et al. (1967)
    plot_opts.plot_ritchie1948      = 0; % TOL_fig_ritchie1948  % Fig S6 Ritchie (1948)
    plot_opts.plot_kendler1947      = 0; % TOL_fig_kendler1947  % Fig S7 Kendler et al. (1947; 1948)
    plot_opts.plot_gentry1948       = 0; % TOL_fig_gentry1948   % Fig S8 Gentry et al. (1948) 
    plot_opts.plot_muir2004         = 0; % TOL_fig_muir2004     % Fig S9 Muir and Taube (2004)
    plot_opts.plot_dawson1972       = 0; % TOL_fig_dawson1972   % Fig S10 Dawson (1972)    
    plot_opts.plot_ga               = 0; % TOL_fig_ga           % Graphical Abstract

    % parameters for plots
    params = struct;
    params.cols = inferno(128); % general color scheme
    params.short_color = params.cols(90,:); % shortcut path color in plots
    params.choice_color = params.cols(1,:); % choice color in plots (c1-c6 is used below instead)
    params.choice_marker = 'd'; % marker to use showing % choices (m1-m6 is used below instead)  
    params.linestyle = '-'; % linestyle when plotting choice %   
    params.adjacent_color = params.cols(60,:); % adjacent path color in plots
    params.light_color = rgb('Fuchsia'); % cued path color in plots
    params.outer_color = rgb('SeaGreen'); % outer path color in plots
    params.other_color = rgb('SlateBlue'); % 'other' path color in plots
    params.nopref_color = rgb('DimGray'); % 'no pref' color for plotting

    params.chance_color = [.5 .5 .5; .5 .5 .5]; % chance line color
    params.shading_alpha = 0.2; % transparency of adjacent/shortcut shaded areas
    params.c1 = rgb('Black'); % color 1
    params.c2 = rgb('Crimson'); % color 2
    params.c3 = rgb('ForestGreen'); % color 3
    params.c4 = rgb('SlateBlue'); % color 4
    params.c5 = rgb('Fuchsia'); % color 5
    params.c6 = rgb('Navy'); % color 6
    params.m1 = 'o'; % marker 1
    params.m2 = '^'; % marker 2
    params.m3 = 's'; % marker 3
    params.m4 = 'd'; % marker 4
    params.m5 = 'p'; % marker 5
    params.m6 = 'v'; % marker 6
    params.style_offset = 0; % used to offset color/style used
    params.res = 350; % resolution at which to save figures

    %% Create the figure output folder if it doesn't exist
    if config.save_fig
        if ~isfolder(config.fig_dir)
            mkdir(config.fig_dir);
            disp(['Created figure output folder at ' config.fig_dir])
        end
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MAIN FIGURES
%%%%%%%%%%%%%%%% Tolman et al. (1946) 
% Tolman, E. C., Ritchie, B. F., & Kalish, D. (1946). Studies in spatial learning: Orientation and the short-cut. Journal of experimental psychology, 36, 13–24
% Figure showing results from the main Tolman et al. (1946) study, maze
% schematic from png file, final choice graph, bar chart showing the citations
% per publication
    if plot_opts.plot_tolman1946
        config.fig_name = 'Fig1.png';
        TOL_fig_tolman1946(config,params,dat);
    end

%%%%%%%%%%%%%%%% Overall stats 1
% All studies summarised based on shortcut/adjacent/light/other path choices,
% studies plotted as a function of shortcut vs adjacent likelihood, shortcut use
% across studies, bar chart showing most common findings
    if plot_opts.plot_overall_stats1
        config.fig_name = 'Fig3.png';
        TOL_fig_stats1(config,params,dat);
    end

%%%%%%%%%%%%%%%% Overall stats 2
% All studies summarised based on shortcut/adjacent/light/other path choices,
% studies plotted as a function of shortcut vs adjacent likelihood, shortcut use
% across studies, bar chart showing most common findings
    if plot_opts.plot_overall_stats2
        config.fig_name = 'Fig4.png';
        TOL_fig_stats2(config,params,dat);
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SUPPLEMENTARY FIGURES
%%%%%%%%%%%%%%%% Tolman, Tryon and Jeffress (1929)
% Tolman, E. C., Tryon, R. C., & Jeffress, L. A. A self-recording maze with an automatic delivery table. University of California Press.% Figure showing results from the Muir and Taube (2004) study, maze
% schematic from png file
    if plot_opts.plot_tryon1929
        config.fig_name = 'FigS1.png';
        TOL_fig_tryon1929(config,params,dat);
    end

%%%%%%%%%%%%%%%% Gentry et al. (1947) & Birch and Korn (1958)
% Gentry, G., Brown, W. L., & Kaplan, S. J. (1947). An experimental analysis of the spatial location hypothesis in learning. Journal of Comparative and ….
% Birch, H. G., & Korn, S. J. (1958). Place-learning, cognitive maps, and parsimony. The Journal of general psychology, 58(1), 17–35.
% Figure showing results from Gentry et al. (1947) & Birch and Korn (1958),
% maze schematic from png file, Gentry experiment 1 first choice graph, summary
% of experiments, Birch and Korn test 1 and test 2 first and final choices
    if plot_opts.plot_gentry1947
        config.fig_name = 'FigS2.png';
        TOL_fig_gentry1947(config,params,dat);
    end

%%%%%%%%%%%%%%%% Harley (1979)
% Harley, C. W. (1979). Arm choices in a sunburst maze: effects of hippocampectomy in the rat. Physiology & Behavior, 23(2), 283–290.
% Figure showing results from the Harley (1979) study, maze
% schematic from png file, final choice graph for acquisition and retention
% groups
    if plot_opts.plot_harley1979
        config.fig_name = 'FigS3.png';
        TOL_fig_harley1979(config,params,dat);
    end

%%%%%%%%%%%%%%%% Wilson and Wilson (2018) & Doner et al. (2023)
% Wilson, S. P., & Wilson, P. N. (2018). Failure to demonstrate short-cutting in a replication and extension of Tolman et al.'s spatial learning experiment with humans. Plos One, 13(12), e0208794.
% Doner, S., Zheng, J., McAvan, A. S., Starrett, M. J., Campbell, H., Sanders, D., & Ekstrom, A. (2023). Evidence for flexible navigation strategies during spatial learning involving path choices. Spatial Cognition & Computation, 23(3), 233–262.
% Figure showing results from the Wilson and Wilson (2018) & Doner et al. (2023)
% human studies, schematic from png file, Wilson and Wilson final choice graph,
% Doner et al. Experiment 1-3 final choice graphs
    if plot_opts.plot_wilson2018
        config.fig_name = 'FigS4.png';
        TOL_fig_wilson2018(config,params,dat);
    end    

%%%%%%%%%%%%%%%% Young et al. (1967)
% Young, H. F., Greenberg, E. R., Paton, W., & Jane, J. A. (1967). A reinvestigation of cognitive maps. Psychonomic science, 9(11), 589–590.
% Figure showing results from the Young et al. (1967) study, maze
% schematic from png file, final choice graph for groups 1/2/4, 3 and 5/6
    if plot_opts.plot_young1967
        config.fig_name = 'FigS5.png';
        TOL_fig_young1967(config,params,dat);
    end

%%%%%%%%%%%%%%%% Ritchie (1948)
% Ritchie, B. F. (1948). Studies in spatial learning; place orientation and direction orientation. Journal of experimental psychology, 38(6), 659–669.
% Figure showing results from the Ritchie (1948) study, maze
% schematic from png file, final choice graph, total entries graph
    if plot_opts.plot_ritchie1948
        config.fig_name = 'FigS6.png';
        TOL_fig_ritchie1948(config,params,dat);
    end

%%%%%%%%%%%%%%%% Kendler et al. (1947; 1948)
% Kendler, H. H., & Gasser, W. P. (1948). Variables in spatial learning; number of reinforcements during training. Journal of comparative and physiological psychology, 41(3), 178–187.
% Kendler, H. H., & Mencher, H. C. (1949). Variables in spatial learning. II. Degree of motivation during training and test trials. Journal of comparative and physiological psychology, 42(6), 493–501.
% Figure showing results from the Kendler et al. (1947; 1948) and Chamberlain
% (1947) studies, maze schematic from png file, Kendler and Gasser final choice
% graph, additional test trials final choice graph, same for Kendler and Mencher
    if plot_opts.plot_kendler1947
        config.fig_name = 'FigS7.png';
        TOL_fig_kendler1947(config,params,dat);
    end

%%%%%%%%%%%%%%%% Gentry et al. (1948) 
% Gentry, G., Brown, W. L., & Lee, H. (1948). Spatial location in the learning of a multiple-t maze. Journal of comparative and physiological psychology, 41(5), 312–318.
% Figure showing results from the Gentry et al. (1948) study, maze
% schematic from png file, final choice graph
    if plot_opts.plot_gentry1948
        config.fig_name = 'FigS8.png';
        TOL_fig_gentry1948(config,params,dat);
    end

%%%%%%%%%%%%%%%% Muir and Taube (2004)
% Muir, G. M., & Taube, J. S. (2004). Head direction cell activity and behavior in a navigation task requiring a cognitive mapping strategy. Behavioural Brain Research, 153(1), 249–253.
% Figure showing results from the Muir and Taube (2004) study, maze
% schematic from png file, final choice graph for maze configuration II, summary
% graph for all maze configurations
% See function for information sent by Gary Muir about the configuration
% identification
    if plot_opts.plot_muir2004
        config.fig_name = 'FigS9.png';
        TOL_fig_muir2004(config,params,dat);
    end

%%%%%%%%%%%%%%%% Dawson (1972)
% Dawson, J. L. (1972). Effects of sex hormones on cognitive style in rats and men. Behavior Genetics, 2(1), 21-42.
% Figure showing results from the Dawson (1972) study, maze
% schematic from png file, final choice graph
    if plot_opts.plot_dawson1972
        config.fig_name = 'FigS10.png';
        TOL_fig_dawson1972(config,params,dat);
    end

%%%%%%%%%%%%%%%% Graphical abstract
% schematic from png file
    if plot_opts.plot_ga
        config.fig_name = 'GA.png';
        TOL_fig_ga(config,params,dat);
    end

