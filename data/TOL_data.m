function dat = TOL_data
% TOL_data
% Store for the data from all Tolman sunburst replication experiments for:
% Duvelle and Grieves (2025) Rethinking the Sun-burst Maze: A Critical Review of a Classic Spatial Learning Task
% See individual sections for details about where the data were collected
% 
% SEE ALSO TOL_main

% HISTORY
%
% version 1.0.0, Release 30/04/25 Initial release
% version 1.1.0, Release 20/04/25 GitHub release
%
% AUTHOR 
% Roddy Grieves
% University of Glasgow, Sir James Black Building
% Neuroethology and Spatial Cognition Lab
% eMail: roddy.grieves@glasgow.ac.uk, eleonore.duvelle@glasgow.ac.uk
% Copyright 2025 Roddy Grieves & Eleonore Duvelle

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% INPUTS
%%%%%%%%%%%%%%%% DATA
    warning('off','MATLAB:table:RowsAddedExistingVars');
    dat = table;

%%%%%%%%%%%%%%%% Tolman et al (1946)
    % Fifty-six female rats, approximately three months old, Tryon stock
    % Searle (1949) noted that Tryon rats (F22 generation) were pigmented (pp 286)
    % Krechevsky (1933) noted that Tryon rats (F7 generation) were mixed pigmented and albino (pp 100)
    % Values taken from Fig 3, pp 19
    idx = 1;
    dat.experiment(idx) = {'Tolman_et_al_1946'}; % experiment label
    dat.group(idx) = {''}; % experiment group
    dat.test(idx) = {''}; % experiment test of this group
    dat.notes(idx) = {''}; % notes about experiment group
    dat.n(idx) = 56; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 53; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 0; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'tryon'}; % strain of rats, otherwise = NaN
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[9 5 1 2 2 19 3 4 1 4 2 1 NaN NaN NaN NaN NaN NaN]}; % frequency choice of each path
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all",'omitmissing').*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/12*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = NaN; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1946; % year of publication

%%%%%%%%%%%%%%%% Kendler and Gasser (1947)
    % Group 0, that did not receive reward/training
    % 12 male albino rats of the Wistar strain  
    % values taken from Table 1, pp 182
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Gasser_1947'}; % experiment label
    dat.group(idx) = {'group_0'}; % experiment group
    dat.test(idx) = {'test1'};   
    dat.notes(idx) = {'did not receive training'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 12; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[6 0 1 0 1 4]}; % frequency choice of each path
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % values taken from Table 2, pp 183
    % Only group means and standard deviation are given
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Gasser_1947'}; % experiment label
    dat.group(idx) = {'group_0'}; % experiment group
    dat.test(idx) = {'test2'};       
    dat.notes(idx) = {'did not receive training, mean & stdev of 20 post-test trials'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 12; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {''}; % frequency choice of each path
    dat.pchoice(idx,:) = {''}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 20/6; % chance level for this experiment
    dat.mean(idx,:) = {[8.08 2.50 1.33 2.00 1.75 4.33]}; % mean choices of each path
    dat.std(idx,:) = {[3.43 1.50 0.94 1.08 0.92 1.70]}; % stdev choices of each path
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % Group 5, that received 5 training trials
    % 12 male albino rats of the Wistar strain  
    % values taken from Table 1, pp 182   
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Gasser_1947'}; % experiment label
    dat.group(idx) = {'group_5'}; % experiment group
    dat.test(idx) = {'test1'};       
    dat.notes(idx) = {'5 training trials'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 12; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[4 1 2 0 1 3]}; % frequency choice of each path
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % values taken from Table 2, pp 183
    % Only group means and standard deviation are given
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Gasser_1947'}; % experiment label
    dat.group(idx) = {'group_5'}; % experiment group
    dat.test(idx) = {'test2'};       
    dat.notes(idx) = {'5 training trials, mean & stdev of 20 post-test trials'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 12; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {''}; % frequency choice of each path
    dat.pchoice(idx,:) = {''}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 20/6; % chance level for this experiment
    dat.mean(idx,:) = {[5.73 3.64 2.46 2.09 1.55 4.36]}; % mean choices of each path
    dat.std(idx,:) = {[1.76 2.50 1.16 1.00 1.16 1.67]}; % stdev choices of each path
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % Group 20, that received 20 training trials
    % 12 male albino rats of the Wistar strain  
    % values taken from Table 1, pp 182   
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Gasser_1947'}; % experiment label
    dat.group(idx) = {'group_20'}; % experiment group
    dat.test(idx) = {'test1'};       
    dat.notes(idx) = {'given 20 training trials'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 12; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[5 1 1 2 0 3]}; % frequency choice of each path
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % values taken from Table 2, pp 183
    % Only group means and standard deviation are given
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Gasser_1947'}; % experiment label
    dat.group(idx) = {'group_20'}; % experiment group
    dat.test(idx) = {'test2'};       
    dat.notes(idx) = {'given 20 training trials, mean & stdev of 20 post-test trials'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 12; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {''}; % frequency choice of each path
    dat.pchoice(idx,:) = {''}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 20/6; % chance level for this experiment
    dat.mean(idx,:) = {[6.33 5.08 1.92 1.17 1.92 3.58]}; % mean choices of each path
    dat.std(idx,:) = {[4.59 3.35 1.04 0.99 1.26 2.06]}; % stdev choices of each path
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % Group 100, that received 100 training trials
    % 12 male albino rats of the Wistar strain  
    % values taken from Table 1, pp 182  
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Gasser_1947'}; % experiment label
    dat.group(idx) = {'group_100'}; % experiment group
    dat.test(idx) = {'test1'};       
    dat.notes(idx) = {'given 100 training trials'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 12; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[7 0 3 0 1 2]}; % frequency choice of each path
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % values taken from Table 2, pp 183
    % Only group means and standard deviation are given
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Gasser_1947'}; % experiment label
    dat.group(idx) = {'group_100'}; % experiment group
    dat.test(idx) = {'test2'};       
    dat.notes(idx) = {'given 100 training trials, mean & stdev of 20 post-test trials'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 12; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {''}; % frequency choice of each path
    dat.pchoice(idx,:) = {''}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 20/6; % chance level for this experiment
    dat.mean(idx,:) = {[6.77 3.31 2.77 1.39 1.31 4.46]}; % mean choices of each path
    dat.std(idx,:) = {[4.92 2.30 1.31 1.08 0.99 3.43]}; % stdev choices of each path
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

%%%%%%%%%%%%%%%% Kendler and Menchen (1948)
    % Group 6-6
    % The first number of the numerical identification refers  to the number of hours of food 
    % deprivation prevailing prior to the daily experimental runs  during the training series. 
    % The number following the hyphen refers to the motivation, based  upon food deprivation, 
    % existing during the test trials.
    % 11 male albino rats of the Wistar strain  
    % values taken from Table 1, pp 496
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Menchen_1948'}; % experiment label
    dat.group(idx) = {'group_6-6'}; % experiment group
    dat.test(idx) = {'test1'};       
    dat.notes(idx) = {'6 hours deprivation before training, 6 hours deprivation before testing'}; % notes about experiment group    
    dat.n(idx) = 11; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 11; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[5 0 1 0 0 5]}; % frequency choice of each path
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1948; % year of publication

    % values taken from Table 1, pp 496
    % Only group means and standard deviation are given
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Menchen_1948'}; % experiment label
    dat.group(idx) = {'group_6-6'}; % experiment group
    dat.test(idx) = {'test2'};       
    dat.notes(idx) = {'6 hours deprivation before training, 6 hours deprivation before testing, mean & stdev of 20 post-test trials'}; % notes about experiment group    
    dat.n(idx) = 11; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 11; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {''}; % frequency choice of each path
    dat.pchoice(idx,:) = {''}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 20/6; % chance level for this experiment
    dat.mean(idx,:) = {[7.09 4.18 1.00 0.73 1.46 5.55]}; % mean choices of each path
    dat.std(idx,:) = {[5.05 5.13 1.21 0.98 1.16 5.07]}; % stdev choices of each path
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1948; % year of publication

    % Group 6-21
    % The first number of the numerical identification refers  to the number of hours of food 
    % deprivation prevailing prior to the daily experimental runs  during the training series. 
    % The number following the hyphen refers to the motivation, based  upon food deprivation, 
    % existing during the test trials.
    % 11 male albino rats of the Wistar strain  
    % values taken from Table 1, pp 496  
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Menchen_1948'}; % experiment label
    dat.group(idx) = {'group_6-21'}; % experiment group
    dat.test(idx) = {'test1'};       
    dat.notes(idx) = {'6 hours deprivation before training, 21 hours deprivation before testing'}; % notes about experiment group    
    dat.n(idx) = 11; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 11; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[4 1 1 1 0 4]}; % frequency choice of each path
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1948; % year of publication

    % values taken from Table 1, pp 496
    % Only group means and standard deviation are given
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Menchen_1948'}; % experiment label
    dat.group(idx) = {'group_6-21'}; % experiment group
    dat.test(idx) = {'test2'};       
    dat.notes(idx) = {'6 hours deprivation before training, 21 hours deprivation before testing, mean & stdev of 20 post-test trials'}; % notes about experiment group    
    dat.n(idx) = 11; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 11; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {''}; % frequency choice of each path
    dat.pchoice(idx,:) = {''}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 20/6; % chance level for this experiment
    dat.mean(idx,:) = {[5.55 3.18 2.27 1.09 1.27 6.64]}; % mean choices of each path
    dat.std(idx,:) = {[3.45 2.17 2.26 1.24 1.29 5.09]}; % stdev choices of each path
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1948; % year of publication

    % Group 21-6
    % The first number of the numerical identification refers  to the number of hours of food 
    % deprivation prevailing prior to the daily experimental runs  during the training series. 
    % The number following the hyphen refers to the motivation, based  upon food deprivation, 
    % existing during the test trials.
    % 12 male albino rats of the Wistar strain  
    % values taken from Table 1, pp 496  
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Menchen_1948'}; % experiment label
    dat.group(idx) = {'group_21-6'}; % experiment group
    dat.test(idx) = {'test1'};       
    dat.notes(idx) = {'21 hours deprivation before training, 6 hours deprivation before testing'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 12; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[2 1 1 1 2 5]}; % frequency choice of each path
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1948; % year of publication

    % values taken from Table 1, pp 496
    % Only group means and standard deviation are given
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Menchen_1948'}; % experiment label
    dat.group(idx) = {'group_21-6'}; % experiment group
    dat.test(idx) = {'test2'};       
    dat.notes(idx) = {'21 hours deprivation before training, 6 hours deprivation before testing, mean & stdev of 20 post-test trials'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 12; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'Wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {''}; % frequency choice of each path
    dat.pchoice(idx,:) = {''}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 20/6; % chance level for this experiment
    dat.mean(idx,:) = {[3.83 4.83 2.25 1.42 1.75 5.92]}; % mean choices of each path
    dat.std(idx,:) = {[2.48 4.24 1.83 1.18 1.30 4.75]}; % stdev choices of each path
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1948; % year of publication

    % Group 21-21
    % The first number of the numerical identification refers  to the number of hours of food 
    % deprivation prevailing prior to the daily experimental runs  during the training series. 
    % The number following the hyphen refers to the motivation, based  upon food deprivation, 
    % existing during the test trials.
    % 12 male albino rats of the Wistar strain  
    % values taken from Table 1, pp 496  
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Menchen_1948'}; % experiment label
    dat.group(idx) = {'group_21-21'}; % experiment group
    dat.test(idx) = {'test1'};       
    dat.notes(idx) = {'21 hours deprivation before training, 21 hours deprivation before testing'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 12; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[5 1 1 2 0 3]}; % frequency choice of each path
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1948; % year of publication

    % values taken from Table 1, pp 496
    % Only group means and standard deviation are given
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Kendler_and_Menchen_1948'}; % experiment label
    dat.group(idx) = {'group_21-21'}; % experiment group
    dat.test(idx) = {'test2'};       
    dat.notes(idx) = {'21 hours deprivation before training, 21 hours deprivation before testing, mean & stdev of 20 post-test trials'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 12; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {''}; % frequency choice of each path
    dat.pchoice(idx,:) = {''}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 20/6; % chance level for this experiment
    dat.mean(idx,:) = {[6.33 5.08 1.92 1.17 1.92 3.58]}; % mean choices of each path
    dat.std(idx,:) = {[4.59 3.35 1.04 0.99 1.26 2.06]}; % stdev choices of each path
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3.5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1948; % year of publication

%%%%%%%%%%%%%%%% Chamberlain (1947)
    % Group 6-21
    % The first number of the numerical identification refers  to the number of hours of food 
    % deprivation prevailing prior to the daily experimental runs  during the training series. 
    % The number following the hyphen refers to the motivation, based  upon food deprivation, 
    % existing during the test trials.
    % 6 male albino rats of the Wistar strain  
    % values taken from Table 5, pp 46  
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Chamberlain_1947'}; % experiment label
    dat.group(idx) = {'group_6-21'}; % experiment group
    dat.test(idx) = {'test1'};       
    dat.notes(idx) = {'6 hours deprivation before training, 21 hours deprivation before testing'}; % notes about experiment group    
    dat.n(idx) = 6; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects    
    dat.nchoices(idx) = 6; % total number of choices (i.e. subjects not excluded)
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[1 0 0 0 2 3]}; % frequency choice of each path
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 2; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [2 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % Group 21-21
    % 9 male albino rats of the Wistar strain  
    % values taken from Table 5, pp 46     
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.group(idx) = {'group_21-21'}; % experiment group
    dat.notes(idx) = {'21 hours deprivation before training, 21 hours deprivation before testing'}; % notes about experiment group    
    dat.n(idx) = 6; % total number of subjects
    dat.choice(idx,:) = {[1 1 1 1 1 4]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.light(idx,:) = [2 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

%%%%%%%%%%%%%%%% Young, Greenberg, Paton and Jane (1967)
    % Group 1
    % 5 albino rats
    % all test lanes open, i.e. regular sunburst test
    % apparatus 1: normal sunburst layout
    % values taken from Fig 2, pp 590
    % shortcut path is estimated to be number 4 based on schematic in fig 1
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Young_et_al_1967'}; % experiment label
    dat.group(idx) = {'group_1'}; % experiment group
    dat.test(idx) = {''}; % experiment test of this group    
    dat.notes(idx) = {'all test lanes used, regular sunburst test, apparatus 1'}; % notes about experiment group    
    dat.n(idx) = 5; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'albino'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:12}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[4 0 0 3 5 4 1 1 0 0 0 2]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all",'omitmissing').*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [6 7]; % which paths were adjacent to the training route
    dat.short(idx,:) = 4; % which path was the shortcut route
    dat.training(idx,:) = 6.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/12*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1967; % year of publication

    % Group 2
    % 5 normal albino rats, 
    % all test lanes open but center runway in amphitheater removed
    % apparatus 1: normal sunburst layout
    % values taken from Fig 2, pp 590
    % shortcut path is estimated to be number 4 based on schematic in fig 1
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Young_et_al_1967'}; % experiment label
    dat.group(idx) = {'group_2'}; % experiment group
    dat.test(idx) = {''}; % experiment test of this group    
    dat.notes(idx) = {'all test lanes open but center runway in amphitheater removed, apparatus 1'}; % notes about experiment group    
    dat.n(idx) = 5; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'albino'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:12}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[9 0 1 3 8 41 17 9 3 0 1 2]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all",'omitmissing').*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [6 7]; % which paths were adjacent to the training route
    dat.short(idx,:) = 4; % which path was the shortcut route
    dat.training(idx,:) = 6.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/12*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1967; % year of publication

    % Group 3
    % 5 normal albino  rats
    % two center lanes closed (6, 7) i.e. adjacent paths closed
    % apparatus 1: normal sunburst layout
    % values taken from Fig 2, pp 590
    % shortcut path is estimated to be number 4 based on schematic in fig 1
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Young_et_al_1967'}; % experiment label
    dat.group(idx) = {'group_3'}; % experiment group
    dat.test(idx) = {''}; % experiment test of this group    
    dat.notes(idx) = {'two center lanes closed (6, 7), apparatus 1'}; % notes about experiment group    
    dat.n(idx) = 5; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'albino'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:12}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[1 1 3 1 13 NaN NaN 0 0 1 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all",'omitmissing').*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [5 8]; % which paths were adjacent to the training route
    dat.short(idx,:) = 4; % which path was the shortcut route
    dat.training(idx,:) = 6.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/10*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1967; % year of publication

    % Group 4
    % 4-four  blind albino rats
    % enucleation four weeks prior to  experiment
    % apparatus 1: normal sunburst layout
    % values taken from Fig 2, pp 590
    % shortcut path is estimated to be number 4 based on schematic in fig 1
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Young_et_al_1967'}; % experiment label
    dat.group(idx) = {'group_4'}; % experiment group
    dat.test(idx) = {''}; % experiment test of this group        
    dat.notes(idx) = {'enucleation four weeks prior to  experiment, apparatus 1'}; % notes about experiment group    
    dat.n(idx) = 4; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'albino'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:12}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[0 0 1 6 3 3 0 1 0 0 0 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all",'omitmissing').*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [6 7]; % which paths were adjacent to the training route
    dat.short(idx,:) = 4; % which path was the shortcut route
    dat.training(idx,:) = 6.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/12*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1967; % year of publication

    % Group 5
    % 9 normal albino rats
    % all test lanes open
    % apparatus 2: training path had an extra left turn at the end
    % values taken from Fig 2, pp 590
    % shortcut path is estimated to be number 5 based on schematic in fig 1
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Young_et_al_1967'}; % experiment label
    dat.group(idx) = {'group_5'}; % experiment group
    dat.test(idx) = {''}; % experiment test of this group        
    dat.notes(idx) = {'all test lanes open, apparatus 2'}; % notes about experiment group    
    dat.n(idx) = 9; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'albino'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:12}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[2 1 3 6 6 0 8 4 4 4 3 3]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all",'omitmissing').*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [6 7]; % which paths were adjacent to the training route
    dat.short(idx,:) = 5; % which path was the shortcut route
    dat.training(idx,:) = 6.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/12*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1967; % year of publication

    % Group 6
    % 5 squirrel monkeys (Saimiri sciureus)
    % all test lanes open
    % apparatus 2: training path had an extra left turn at the end
    % values taken from Fig 2, pp 590
    % shortcut path is estimated to be number 5 based on schematic in fig 1
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Young_et_al_1967'}; % experiment label
    dat.group(idx) = {'group_6'}; % experiment group
    dat.test(idx) = {''}; % experiment test of this group        
    dat.notes(idx) = {'all test lanes open, apparatus 2'}; % notes about experiment group    
    dat.n(idx) = 5; % total number of subjects
    dat.species(idx) = {'squirrel_monkey'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {NaN}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:12}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[6 4 4 1 5 6 9 5 2 3 2 3]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all",'omitmissing').*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [6 7]; % which paths were adjacent to the training route
    dat.short(idx,:) = 5; % which path was the shortcut route
    dat.training(idx,:) = 6.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/12*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1967; % year of publication

%%%%%%%%%%%%%%%% Harley (1979) 
    %% Acquisition group
    % Control rats
    % Sunburst test 1
    % 17 Male  Sprague-Dawley  rats  obtained  from  Canadian  Breeding  Laboratories  (Montreal,  Quebec).
    % values taken from Table 1, pp 286
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Harley_1979'}; % experiment label
    dat.group(idx) = {'control'}; % experiment group
    dat.test(idx) = {'test1'}; % experiment test of this group        
    dat.notes(idx) = {'Sunburst test 1, control/sham rats'}; % notes about experiment group    
    dat.n(idx) = 17; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'sprague-dawley'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[0 0 5 12 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 4; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [NaN NaN]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1979; % year of publication

    % Sunburst test 2
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'test2'}; % experiment test of this group
    dat.notes(idx) = {'Sunburst test 2, control/sham rats'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 9 8 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1979; % year of publication

    % Hippocampal rats
    % Sunburst test 1
    % 13 Male  Sprague-Dawley  rats  obtained  from  Canadian  Breeding  Laboratories  (Montreal,  Quebec).
    % values taken from Table 1, pp 286
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Harley_1979'}; % experiment label
    dat.group(idx) = {'hippocampal'}; % experiment group
    dat.test(idx) = {'test1'}; % experiment test of this group        
    dat.notes(idx) = {'Sunburst test 1, hippocampal lesion rats'}; % notes about experiment group    
    dat.n(idx) = 13; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'sprague-dawley'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[1 2 3 2 5 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 4; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [NaN NaN]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1979; % year of publication

    % Sunburst test 2
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'test2'}; % experiment test of this group
    dat.notes(idx) = {'Sunburst test 2, hippocampal lesion rats'}; % notes about experiment group    
    dat.choice(idx,:) = {[2 2 1 2 4 2]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1979; % year of publication

    % Cortical rats
    % Sunburst test 1
    % 13 Male  Sprague-Dawley  rats  obtained  from  Canadian  Breeding  Laboratories  (Montreal,  Quebec).
    % values taken from Table 1, pp 286
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Harley_1979'}; % experiment label
    dat.group(idx) = {'cortical'}; % experiment group
    dat.test(idx) = {'test1'}; % experiment test of this group        
    dat.notes(idx) = {'Sunburst test 1, cortical lesion rats'}; % notes about experiment group    
    dat.n(idx) = 13; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'sprague-dawley'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[0 1 4 8 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 4; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [NaN NaN]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1979; % year of publication

    % Sunburst test 2
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'test2'}; % experiment test of this group
    dat.notes(idx) = {'Sunburst test 2, cortical lesion rats'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 5 8 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1979; % year of publication

    %% Retention group
    % Control rats
    % Preop sunburst test
    % 13 Male  Sprague-Dawley  rats  obtained  from  Canadian  Breeding  Laboratories  (Montreal,  Quebec).
    % values taken from Table 3, pp 287
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Harley_1979'}; % experiment label
    dat.group(idx) = {'retention_control'}; % experiment group    
    dat.test(idx) = {'preop'}; % experiment test of this group
    dat.notes(idx) = {'preop sunburst test, control/sham rats'}; % notes about experiment group    
    dat.n(idx) = 13; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'sprague-dawley'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[0 0 5 6 1 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 4; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [NaN NaN]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1979; % year of publication

    % postop test 1
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'postop1'}; % experiment test of this group
    dat.notes(idx) = {'postop sunburst test 1, control/sham rats'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 5 6 1 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1979; % year of publication

    % postop test 2
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'postop2'}; % experiment test of this group
    dat.notes(idx) = {'postop sunburst test 2, control/sham rats'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 8 5 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1979; % year of publication

    % postop test 3
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'postop3'}; % experiment test of this group
    dat.notes(idx) = {'postop sunburst test 3, control/sham rats'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 7 4 1 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1979; % year of publication

    % Hippocampal rats
    % Preop sunburst test
    % 11 Male  Sprague-Dawley  rats  obtained  from  Canadian  Breeding  Laboratories  (Montreal,  Quebec).
    % values taken from Table 3, pp 287
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Harley_1979'}; % experiment label
    dat.group(idx) = {'retention_hippocampus'}; % experiment group    
    dat.test(idx) = {'preop'}; % experiment test of this group
    dat.notes(idx) = {'preop sunburst test, hippocampal lesion rats'}; % notes about experiment group    
    dat.n(idx) = 11; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'sprague-dawley'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[0 0 8 3 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 4; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [NaN NaN]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1979; % year of publication

    % postop test 1
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'postop1'}; % experiment test of this group
    dat.notes(idx) = {'postop sunburst test 1, hippocampal lesion rats'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 3 6 1 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1979; % year of publication

    % postop test 2
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'postop2'}; % experiment test of this group
    dat.notes(idx) = {'postop sunburst test 2, hippocampal lesion rats'}; % notes about experiment group    
    dat.choice(idx,:) = {[1 1 7 2 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all").*100}; % percentage choice of each path
    dat.year(idx,:) = 1979; % year of publication

    % postop test 3
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'postop3'}; % experiment test of this group
    dat.notes(idx) = {'postop sunburst test 3, hippocampal lesion rats'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 8 2 0 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1979; % year of publication

    % Cortical rats
    % Preop sunburst test
    % 11 Male  Sprague-Dawley  rats  obtained  from  Canadian  Breeding  Laboratories  (Montreal,  Quebec).
    % values taken from Table 3, pp 287
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Harley_1979'}; % experiment label
    dat.group(idx) = {'retention_cortical'}; % experiment group    
    dat.test(idx) = {'preop'}; % experiment test of this group
    dat.notes(idx) = {'preop sunburst test, cortical lesion rats'}; % notes about experiment group    
    dat.n(idx) = 11; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'sprague-dawley'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:6}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[0 0 6 6 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [3 4]; % which paths were adjacent to the training route
    dat.short(idx,:) = 4; % which path was the shortcut route
    dat.training(idx,:) = 3.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/6*100; % chance level for this experiment
    dat.outer(idx,:) = [NaN NaN]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1979; % year of publication

% postop test 1
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'postop1'}; % experiment test of this group
    dat.notes(idx) = {'postop sunburst test 1, cortical lesion rats'}; % notes about experiment group    
    dat.choice(idx,:) = {[1 0 6 2 2 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1979; % year of publication

% postop test 2
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'postop2'}; % experiment test of this group
    dat.notes(idx) = {'postop sunburst test 2, cortical lesion rats'}; % notes about experiment group    
    dat.choice(idx,:) = {[1 2 3 5 0 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1979; % year of publication

% postop test 3
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'postop3'}; % experiment test of this group
    dat.notes(idx) = {'postop sunburst test 3, cortical lesion rats'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 1 5 4 1 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1979; % year of publication

%%%%%%%%%%%%%%%% Birch and Korn (1958)
    % Experiment 1, light at right group
    % 12 rats, Female, Sherman strain albino rats
    % total entries
    % values from Fig 3, pp 30
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Birch_and_Korn_1958'}; % experiment label
    dat.group(idx) = {'light_right'}; % experiment group    
    dat.test(idx) = {'total_entries'}; % experiment test of this group
    dat.notes(idx) = {'light at right group, all entries, experiment 1'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = 0; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'sherman'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[3 1 1 1 1 0 1 3 2 11 7 3 0 2 3 1 1 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all") max(dat.paths{idx},[],"all")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 1; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1958; % year of publication

    % initial entries
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'initial_entries'}; % experiment test of this group
    dat.notes(idx) = {'light at right group, initial entries, experiment 1'}; % notes about experiment group    
    dat.choice(idx,:) = {[1 0 0 0 1 0 1 0 1 3 1 2 0 1 0 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1958; % year of publication

    % final choices
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'final_choices'}; % experiment test of this group
    dat.notes(idx) = {'light at right group, final choices, experiment 1'}; % notes about experiment group    
    dat.choice(idx,:) = {[1 0 0 0 0 0 0 0 0 2 2 1 0 0 1 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1958; % year of publication

    % Experiment 2: after 10 days additional training
    % values from Fig 4, pp 31
    % total entries
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'total_entries_2'}; % experiment test of this group
    dat.notes(idx) = {'light at right group, total entries, additional training, experiment 2'}; % notes about experiment group    
    dat.choice(idx,:) = {[5 1 3 2 4 1 3 0 6 10 2 1 2 1 3 2 1 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.year(idx,:) = 1958; % year of publication

    % initial entries
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'initial_entries_2'}; % experiment test of this group
    dat.notes(idx) = {'light at right group, initial entries, additional training, experiment 2'}; % notes about experiment group    
    dat.choice(idx,:) = {[1 0 0 0 1 0 1 0 1 4 1 0 1 0 1 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1958; % year of publication

    % final choices
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'final_choices_2'}; % experiment test of this group
    dat.notes(idx) = {'light at right group, final choices, additional training, experiment 2'}; % notes about experiment group    
    dat.choice(idx,:) = {[1 1 1 0 1 1 0 0 1 1 0 0 0 0 1 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1958; % year of publication

    % Experiment 1, light at left group
    % 12 rats, Female, Sherman strain albino rats
    % total entries
    % values from Fig 3, pp 30
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Birch_and_Korn_1958'}; % experiment label
    dat.group(idx) = {'light_left'}; % experiment group    
    dat.test(idx) = {'total_entries'}; % experiment test of this group
    dat.notes(idx) = {'light at left group, all entries, experiment 1'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = 0; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'sherman'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[3 1 2 1 1 3 1 5 8 9 2 0 1 2 1 3 1 2]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [14 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1958; % year of publication

    % initial entries
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'initial_entries'}; % experiment test of this group
    dat.notes(idx) = {'light at left group, initial entries, experiment 1'}; % notes about experiment group    
    dat.choice(idx,:) = {[2 0 0 0 0 1 0 0 3 3 0 0 0 1 0 0 1 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1958; % year of publication

    % final choices
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'final_choices'}; % experiment test of this group
    dat.notes(idx) = {'light at left group, final choices, experiment 1'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 0 0 1 1 0 1 0 0 0 0 1 0 0 1 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1958; % year of publication

    % Experiment 2: after 10 days additional training
    % values from Fig 4, pp 31
    % total entries
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'total_entries_2'}; % experiment test of this group
    dat.notes(idx) = {'light at right group, total entries, additional training, experiment 2'}; % notes about experiment group    
    dat.choice(idx,:) = {[1 3 1 1 3 1 1 2 7 9 1 2 1 1 0 1 1 9]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.year(idx,:) = 1958; % year of publication

    % initial entries
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'initial_entries_2'}; % experiment test of this group
    dat.notes(idx) = {'light at right group, initial entries, additional training, experiment 2'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 0 0 1 0 0 0 1 5 1 0 0 0 0 1 1 2]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1958; % year of publication

    % final choices
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'final_choices_2'}; % experiment test of this group
    dat.notes(idx) = {'light at right group, final choices, additional training, experiment 2'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 6]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1958; % year of publication

    % Experiment 1, light at both sides group
    % 12 rats, Female, Sherman strain albino rats
    % total entries
    % values from Fig 3, pp 30
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Birch_and_Korn_1958'}; % experiment label
    dat.group(idx) = {'light_both'}; % experiment group    
    dat.test(idx) = {'total_entries'}; % experiment test of this group
    dat.notes(idx) = {'light at both sides group, all entries, experiment 1'}; % notes about experiment group    
    dat.n(idx) = 12; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = 0; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'sherman'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[3 2 0 1 1 2 1 2 4 7 4 0 2 0 0 1 3 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 14]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1958; % year of publication

    % initial entries
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'initial_entries'}; % experiment test of this group
    dat.notes(idx) = {'light at both sides group, initial entries, experiment 1'}; % notes about experiment group    
    dat.choice(idx,:) = {[1 0 0 0 0 0 0 0 1 3 2 0 2 0 0 0 2 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1958; % year of publication

    % final choices
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'final_choices'}; % experiment test of this group
    dat.notes(idx) = {'light at both sides group, final choices, experiment 1'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 0 0 0 1 0 0 0 4 0 0 0 0 0 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1958; % year of publication

    % Experiment 2: after 10 days additional training
    % values from Fig 4, pp 31
    % total entries
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'total_entries_2'}; % experiment test of this group
    dat.notes(idx) = {'light at both sides group, total entries, additional training, experiment 2'}; % notes about experiment group    
    dat.choice(idx,:) = {[4 2 7 0 2 0 4 3 5 13 0 2 3 1 1 1 2 6]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.year(idx,:) = 1958; % year of publication

    % initial entries
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'initial_entries_2'}; % experiment test of this group
    dat.notes(idx) = {'light at both sides group, initial entries, additional training, experiment 2'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 0 0 1 0 0 0 2 7 0 0 0 1 0 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1958; % year of publication

    % final choices
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'final_choices_2'}; % experiment test of this group
    dat.notes(idx) = {'light at both sides group, final choices, additional training, experiment 2'}; % notes about experiment group    
    dat.choice(idx,:) = {[0 0 1 0 0 0 1 0 0 1 0 0 1 1 0 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1958; % year of publication

%%%%%%%%%%%%%%%% Ritchie (1948)
    % F1 or light at right group
    % 23 pigmented male rats approximately three months old
    % These rats were MxM's drawn from the Tryon stock in the rat colony of the University of California
    % values from Fig 6, pp 665
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Ritchie_1948'}; % experiment label
    dat.group(idx) = {'f1'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'light at right or F1 group, final choices'}; % notes about experiment group    
    dat.n(idx) = 23; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 1; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'tryon_mxm'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:10}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[3 0 1 0 2 0 0 2 2 9]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [5 6]; % which paths were adjacent to the training route
    dat.short(idx,:) = 8; % which path was the shortcut route
    dat.training(idx,:) = 5.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/10*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [8 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1948; % year of publication

    % all entries
    % values from Fig 9, pp 666
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'total_entries'}; % experiment test of this group
    dat.notes(idx) = {'light at right or F1 group, total choices'}; % notes about experiment group    
    dat.choice(idx,:) = {fliplr([29 26 22 25 34 38 31 26 27 37])}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1948; % year of publication

    % F2 or light at left group
    % 27 pigmented male rats approximately three months old
    % These rats were MxM's drawn from the Tryon stock in the rat colony of the University of California
    % values from Fig 7, pp 665
    % NOTE: these values are flipped so that the reward is always on the right as in Tolman et al. 1946    
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Ritchie_1948'}; % experiment label
    dat.group(idx) = {'f2'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'light at left or F2 group, final choices'}; % notes about experiment group    
    dat.n(idx) = 27; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = 1; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 1; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'tryon_mxm'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:10}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {fliplr([15 1 1 4 0 0 0 0 0 2])}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [5 6]; % which paths were adjacent to the training route
    dat.short(idx,:) = 8; % which path was the shortcut route
    dat.training(idx,:) = 5.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/10*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [3 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1948; % year of publication

    % all entries
    % values from Fig 10, pp 666
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.test(idx) = {'total_entries'}; % experiment test of this group
    dat.notes(idx) = {'light at left or F2 group, total choices'}; % notes about experiment group    
    dat.choice(idx,:) = {fliplr([20 20 14 16 28 19 17 10 8 16])}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.year(idx,:) = 1948; % year of publication

%%%%%%%%%%%%%%%% Gentry, Brown and Kaplan (1947)
    % H1 or light at right group (Group A)
    % 27 rats approximately 120 days old and had had  no previous maze experience
    % descendants of the Wistar strain reared in the Comparative Psychology  Laboratory at the University of Texas and albinos purchased from a local dealer.
    % values from Fig 3, pp 313
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Gentry_et_al_1947'}; % experiment label
    dat.group(idx) = {'h1'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'light at right or H1 group, Group A, experiment 1, final choices'}; % notes about experiment group    
    dat.n(idx) = 27; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar_albino'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[1 2 0 0 0 0 0 1 6 3 0 4 0 0 1 1 3 2]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 1; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % H2 or light at left group (Group C)
    % 22 rats approximately 120 days old and had had  no previous maze experience
    % descendants of the Wistar strain reared in the Comparative Psychology  Laboratory at the University of Texas and albinos purchased from a local dealer.
    % values from Fig 4, pp 313
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Gentry_et_al_1947'}; % experiment label
    dat.group(idx) = {'h2'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'light at left or H2 group, Group C, experiment 1, final choices'}; % notes about experiment group    
    dat.n(idx) = 22; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar_albino'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[2 2 0 2 0 0 3 2 6 4 1 2 0 0 0 1 1 5]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [14 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % 9 days of training group
    % 22 rats approximately 120 days old and had had  no previous maze experience
    % descendants of the Wistar strain reared in the Comparative Psychology  Laboratory at the University of Texas and albinos purchased from a local dealer.
    % values from Fig 6, pp 315
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Gentry_et_al_1947'}; % experiment label
    dat.group(idx) = {'more_training'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'additional training, experiment 2, final choices'}; % notes about experiment group    
    dat.n(idx) = 22; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar_albino'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[1 1 0 0 0 0 3 1 2 4 0 1 2 1 1 1 2 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % training alley CD removed during test
    % 27 rats approximately 120 days old and had had  no previous maze experience
    % descendants of the Wistar strain reared in the Comparative Psychology  Laboratory at the University of Texas and albinos purchased from a local dealer.
    % values from Fig 7, pp 316
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Gentry_et_al_1947'}; % experiment label
    dat.group(idx) = {'cd_removed'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'alley CD removed, experiment 3, final choices'}; % notes about experiment group    
    dat.n(idx) = 27; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar_albino'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[1 1 3 1 1 1 3 0 5 1 1 1 0 0 2 1 2 3]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % increase length of alley DE during training
    % 18 rats approximately 120 days old and had had  no previous maze experience
    % descendants of the Wistar strain reared in the Comparative Psychology  Laboratory at the University of Texas and albinos purchased from a local dealer.
    % one failed to make a choice within  six minutes on the test trial. 
    % values from Fig 8, pp 317
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Gentry_et_al_1947'}; % experiment label
    dat.group(idx) = {'de_longer'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'alley DE elongated, experiment 4, final choices'}; % notes about experiment group    
    dat.n(idx) = 27; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar_albino'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[1 1 0 1 0 0 1 3 3 3 0 2 1 0 0 0 1 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % experiment 5, no training, group A, alley CD in place during test
    % 60 rats approximately 120 days old and had had  no previous maze experience
    % descendants of the Wistar strain reared in the Comparative Psychology  Laboratory at the University of Texas and albinos purchased from a local dealer.
    % Fifty animals made  a choice within six minutes.
    % values from Fig 9, pp 318
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Gentry_et_al_1947'}; % experiment label
    dat.group(idx) = {'no_training_cd_present'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'untrained rats, alley CD in place, experiment 5, final choices'}; % notes about experiment group    
    dat.n(idx) = 60; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar_albino'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[2 1 4 0 0 0 0 0 22 8 0 0 0 2 3 1 3 4]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

    % experiment 5, no training, group B, alley CD removed during test
    % 43 rats approximately 120 days old and had had  no previous maze experience
    % descendants of the Wistar strain reared in the Comparative Psychology  Laboratory at the University of Texas and albinos purchased from a local dealer.
    % Forty animals made a choice within six minutes.
    % values from Fig 10, pp 319
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Gentry_et_al_1947'}; % experiment label
    dat.group(idx) = {'no_training_cd_removed'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'untrained rats, alley CD removed, experiment 5, final choices'}; % notes about experiment group    
    dat.n(idx) = 43; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 0; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar_albino'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[6 4 2 0 0 2 0 3 3 1 1 1 1 1 4 3 4 4]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1947; % year of publication

%%%%%%%%%%%%%%%% Gentry, Brown and Lee (1948)
    % 80 animals were used in the present study
    % the group was composed both  of animals purchased from the Wistar Institute and albinos and hooded 
    % animals reared  in the Comparative Psychology Laboratory at The University
    % of Texas. They were be-tween 100 and 150 days old at the beginning of the experiment. They had had no previous  
    % maze experience
    % values from Fig 4, pp 316
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Gentry_et_al_1948'}; % experiment label
    dat.group(idx) = {'main'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'light opposite training route, final choices'}; % notes about experiment group    
    dat.n(idx) = 80; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'wistar_hooded'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:10}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[4 25 17 7 3 5 7 4 4 4]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [2 3]; % which paths were adjacent to the training route
    dat.short(idx,:) = 8; % which path was the shortcut route
    dat.training(idx,:) = 2.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/10*100; % chance level for this experiment
    dat.outer(idx,:) = [NaN NaN]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [8 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 1948; % year of publication

%%%%%%%%%%%%%%%% Wilson and Wilson (2018)
    % light-light group, stable light during testing and training
    % 20 humans (ten males and ten females in each condition)
    % mean age of 20.33 ± 0.97 years  (mean ± standard deviation).
    % values from Fig 4, pp 316
    % shortcut estimated based on schematic in Fig 1
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'wilson_2018'}; % experiment label
    dat.group(idx) = {'stable_light'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'light-light group, light stable above rewared throughout, final choices'}; % notes about experiment group    
    dat.n(idx) = 20; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[3 0 1 0 2 4 1 3 1 2 1 1 0 1 0 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all") max(dat.paths{idx},[],"all")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 1; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2018; % year of publication

    % ambient-light group, no directional light during testing and training
    % 20 humans (ten males and ten females in each condition)
    % mean age of 20.33 ± 0.97 years  (mean ± standard deviation).
    % values from Fig 4, pp 316
    % shortcut estimated based on schematic in Fig 1
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'wilson_2018'}; % experiment label
    dat.group(idx) = {'ambient_light'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'ambient group, ambient light throughout, final choices'}; % notes about experiment group    
    dat.n(idx) = 20; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[1 0 0 0 0 1 3 1 6 1 0 1 1 0 0 0 0 5]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2018; % year of publication

    % shifted-light group, light moved 90 degrees between testing and training
    % 20 humans (ten males and ten females in each condition)
    % mean age of 20.33 ± 0.97 years  (mean ± standard deviation).
    % values from Fig 4, pp 316
    % shortcut estimated based on schematic in Fig 1
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'wilson_2018'}; % experiment label
    dat.group(idx) = {'shifted_light'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'light-shifted group, light moved to opposite side between testing and training, final choices'}; % notes about experiment group    
    dat.n(idx) = 20; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[1 1 0 1 0 0 0 3 5 3 0 1 0 3 0 0 0 2]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [14 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2018; % year of publication

%%%%%%%%%%%%%%%% Doner, Zheng, McAvan, Starrett, Campbell, Sanders and Ekstrom (2023)
    %% Experiment 1
    % visible light, stable group, stable light during testing and training
    % 53  Participants
    % values from Fig 3, pp 245 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % T = readtable("aMAZEingData.xlsx",'Sheet','Experiment1Data');
    % d = histcounts(T.HallChoice(T.NumericCondition==1),0.5:18.5)
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'stable_light'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 1, light-light group, light stable above rewared throughout, final choices'}; % notes about experiment group    
    dat.n(idx) = 53; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[3 0 0 0 10 7 2 4 7 7 4 1 1 0 1 0 0 6]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 1; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    % ambient light group, ambient light during testing and training
    % 43  Participants
    % values from Fig 3, pp 245 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % d = histcounts(T.HallChoice(T.NumericCondition==2),0.5:18.5)
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'ambient_light'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 1, ambient-light group, ambient light throughout, final choices'}; % notes about experiment group    
    dat.n(idx) = 43; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[3 1 1 0 2 4 3 4 4 12 2 3 0 0 1 1 0 2]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    % visible light big move group, light moved to opposite side for the test
    % 38  Participants
    % (24  female,  12  male,  1  androgyn,  1  genderqueer/gender  nonconforming)
    % values from Fig 3, pp 245 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % d = histcounts(T.HallChoice(T.NumericCondition==3),0.5:18.5)
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'light_+90move'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 1, big move light group, light moved opposite side in test, final choices'}; % notes about experiment group    
    dat.n(idx) = 38; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[2 2 0 0 0 4 1 3 9 5 0 1 1 7 0 1 1 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [14 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    % visible light small move CW, light moved 10 degrees to the right or CW for the test
    % 40  Participants
    % (30  female,  10  male)
    % values from Fig 3, pp 245 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % d = histcounts(T.HallChoice(T.NumericCondition==4),0.5:18.5)
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'light_-10move'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 1, small move light group, light moved 10 degrees right or CW in test, final choices'}; % notes about experiment group    
    dat.n(idx) = 40; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[1 0 1 9 0 14 0 2 4 7 1 0 0 0 0 1 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [4 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    % visible light small move CW, light moved 10 degrees to the right or CW for the test
    % 40  Participants
    % (28  female,  12  male)
    % values from Fig 3, pp 245 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % d = histcounts(T.HallChoice(T.NumericCondition==4),0.5:18.5)
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'light_+10move'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 1, small move light group, light moved 10 degrees left or CCW in test, final choices'}; % notes about experiment group    
    dat.n(idx) = 40; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[1 1 1 1 2 6 4 3 7 9 1 1 0 0 1 0 1 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [6 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    %% Experiment 2
    % visible light big move group, distal cues, light moved 90 degrees for the test
    % 43 participants
    % (24  female,  18  male,  1  not  recorded)
    % values from Fig 5, pp 250 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % T = readtable("aMAZEingData.xlsx",'Sheet','Experiment2Data');
    % d = mat2str(histcounts(T.HallChoice(ismember(T.Condition,'BigMove')),0.5:18.5))
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'light_+90move_distal'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 2, big move light group, light moved opposite side in test, distal cues, final choices'}; % notes about experiment group    
    dat.n(idx) = 43; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[0 0 1 2 4 2 5 2 5 7 1 0 0 7 1 2 1 3]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [14 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    % visible light, stable group, distal cues, stable light during testing and training
    % 43 participants
    % (31  female,  9  male,  1  androgyn,  and  2  genderqueer/gender  nonconforming)
    % values from Fig 5, pp 250 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % T = readtable("aMAZEingData.xlsx",'Sheet','Experiment2Data');
    % d = mat2str(histcounts(T.HallChoice(ismember(T.Condition,'Control')),0.5:18.5))
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'stable_light_distal'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 2, stable light group, light stable above rewared throughout, distal cues, final choices'}; % notes about experiment group    
    dat.n(idx) = 43; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[2 0 0 0 13 6 3 2 4 7 0 0 0 0 1 3 2 1]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    % ambient light group, ambient light during testing and training
    % 40 participants
    % (27  females,  9  males,  1  transmale,  3  gender  not  recorded)
    % values from Fig 5, pp 250 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % T = readtable("aMAZEingData.xlsx",'Sheet','Experiment2Data');
    % d = mat2str(histcounts(T.HallChoice(ismember(T.Condition,'Ambient')),0.5:18.5))
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'ambient_light_distal'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 2, ambient-light group, ambient light throughout, distal cues, final choices'}; % notes about experiment group    
    dat.n(idx) = 40; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[4 1 2 3 2 2 2 5 4 7 0 1 0 0 0 4 0 3]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    % visible light small move CW, light moved 10 degrees to the right or CW for the test
    % 45 participants
    %  (32  female,  13  male) 
    % values from Fig 5, pp 250 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % T = readtable("aMAZEingData.xlsx",'Sheet','Experiment2Data');
    % d = mat2str(histcounts(T.HallChoice(ismember(T.Condition,'SmMoveR')),0.5:18.5))
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'light_+10move_distal'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 2, small move light group, light moved 10 degrees left or CCW in test, distal cues, final choices'}; % notes about experiment group    
    dat.n(idx) = 45; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[2 0 2 1 2 8 6 2 7 7 0 0 1 1 1 0 1 5]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [4 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    %% Experiment 3
    % visible light, stable group, treadmill VR, stable light during testing and training
    % 18  participants 
    % (10  female,  8  male)
    % values from Fig 7, pp 256 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % T = readtable("aMAZEingData.xlsx",'Sheet','Experiment3Data');
    % d = mat2str(histcounts(T.HallChoice(ismember(T.Condition,'Control')),0.5:18.5))
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'stable_light_vr'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 3, stable light group, light stable above reward throughout, treadmill VR, final choices'}; % notes about experiment group    
    dat.n(idx) = 18; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[1 0 0 0 3 5 1 2 2 0 1 0 0 0 0 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [5 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    % ambient light group, ambient light during testing and training
    % 18  participants 
    % (10  female,  8  male)
    % values from Fig 7, pp 256 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % T = readtable("aMAZEingData.xlsx",'Sheet','Experiment3Data');
    % d = mat2str(histcounts(T.HallChoice(ismember(T.Condition,'Ambient')),0.5:18.5))
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'ambient_light_vr'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 3, ambient-light group, ambient light throughout, treadmill VR, final choices'}; % notes about experiment group    
    dat.n(idx) = 18; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[0 0 0 0 1 2 3 4 4 0 0 1 0 0 0 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    % visible light big move group, distal cues, light moved 90 degrees for the test
    % 18  participants 
    % (10  female,  8  male)
    % values from Fig 7, pp 256 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % T = readtable("aMAZEingData.xlsx",'Sheet','Experiment2Data');
    % d = mat2str(histcounts(T.HallChoice(ismember(T.Condition,'BigMove')),0.5:18.5))
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'light_+90move_vr'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 3, big move light group, light moved 90 degrees CCW in test, treadmill VR, final choices'}; % notes about experiment group    
    dat.n(idx) = 18; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[0 0 0 0 1 0 4 4 3 1 0 0 0 2 0 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [14 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    % visible light small move CW, light moved 10 degrees to the right or CW for the test
    % 18  participants 
    % (10  female,  8  male)
    % values from Fig 7, pp 256 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % T = readtable("aMAZEingData.xlsx",'Sheet','Experiment2Data');
    % d = mat2str(histcounts(T.HallChoice(ismember(T.Condition,'SmMoveR')),0.5:18.5))
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'light_+10move_vr'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 3, small move light group, light moved 10 degrees left or CCW in test, treadmill VR, final choices'}; % notes about experiment group    
    dat.n(idx) = 18; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[0 0 0 2 2 0 1 5 4 1 0 0 0 0 0 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [6 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

    % visible light small move CCW, light moved 10 degrees to the left or CCW for the test
    % 18  participants 
    % (10  female,  8  male)
    % values from Fig 7, pp 256 and online data spreadsheet:
    % http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/
    % T = readtable("aMAZEingData.xlsx",'Sheet','Experiment2Data');
    % d = mat2str(histcounts(T.HallChoice(ismember(T.Condition,'SmMoveL')),0.5:18.5))
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'doner_et_al_2023'}; % experiment label
    dat.group(idx) = {'light_-10move_vr'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'experiment 3, small move light group, light moved 10 degrees right or CW in test, treadmill VR, final choices'}; % notes about experiment group    
    dat.n(idx) = 18; % total number of subjects
    dat.species(idx) = {'human'}; % species of subjects
    dat.sex(idx) = NaN; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = NaN; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {''}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {1:18}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[0 0 0 0 1 5 3 3 3 0 0 0 0 0 0 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [9 10]; % which paths were adjacent to the training route
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.training(idx,:) = 9.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/18*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [4 NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2023; % year of publication

%%%%%%%%%%%%%%%% Muir and Taube
    % Email from Gary Muir 29/04/2025
    % I'm not sure why I (confusingly) chose to use letters in the figures and numbers in the table for the different maze configurations, 
    % but you're correct that A (Table) = 1 (Fig); B = 2; and C = 3 (I've attached a slide from a talk I gave about these results around the 
    % same time confirming that's exactly what I did).

    % Email from Gary Muir 09/05/2025
    % Sorry for the delay but I finally found an old printed spreadsheet that I think answers your question regarding the first arm choice number system. 
    % The sunburst numbering system did have 9 arms, as shown in a couple of places where the arm choice is #9 in the spreadsheet, so that would make the 
    % rightmost arm #9. In the top left of the page, I made a note that I did that so that while the first entry into the blocked arm was not counted as 
    % an arm error, I could count any subsequent re-entries into the blocked arm as an error in arm #5.

    %% Experiment 1
    % Four female long-evans rats
    % values from Table 1, pp 250
    % Maze configuration A or 1 or I
    idx = size(dat,1)+1;
    dat.experiment(idx) = {'Muir_and_Taube_2004'}; % experiment label
    dat.group(idx) = {'maze_I'}; % experiment group    
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'test maze configuration 1 or I or A'}; % notes about experiment group    
    dat.n(idx) = 7; % total number of subjects
    dat.species(idx) = {'rat'}; % species of subjects
    dat.sex(idx) = 0; % sex of subjects, 0 = female, 1 = male, otherwise = NaN
    dat.pigment(idx) = 1; % pigmented rats = 1, albino = 0, otherwise = NaN
    dat.strain(idx) = {'long-evans'}; % strain of rats, otherwise = NaN    
    dat.paths(idx,:) = {[1:8]}; % the paths as they are numbered in the paper
    dat.choice(idx,:) = {[2 1 1 0 1 0 2 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.adjacent(idx,:) = [4 5]; % which paths were adjacent to the training route
    dat.short(idx,:) = 4; % which path was the shortcut route
    dat.training(idx,:) = 4.5; % which path corresponds to the training route (likely between two values)    
    dat.chance(idx,:) = 1/8*100; % chance level for this experiment
    dat.outer(idx,:) = [min(dat.paths{idx},[],"all","omitmissing") max(dat.paths{idx},[],"all","omitmissing")]; % which path corresponds to the outermost paths   
    dat.replication(idx,:) = 0; % direct/close replication = 1, otherwise = 0
    dat.light(idx,:) = [NaN NaN]; % which path headed most closely towards the light (NaN if no light)
    dat.year(idx,:) = 2004; % year of publication

    % Maze configuration B or 2 or II
    % values from Table 1, pp 250
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.group(idx) = {'maze_II'}; % experiment group        
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'test maze configuration 2 or II or B'}; % notes about experiment group    
    dat.choice(idx,:) = {[1 0 0 2 3 0 0 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.short(idx,:) = 6; % which path was the shortcut route
    dat.year(idx,:) = 2004; % year of publication

    % Maze configuration C or 3 or III
    % values from Table 1, pp 250
    idx = size(dat,1)+1;
    dat(idx,:) = dat(idx-1,:);
    dat.group(idx) = {'maze_III'}; % experiment group        
    dat.test(idx) = {'final_choice'}; % experiment test of this group
    dat.notes(idx) = {'test maze configuration 3 or III or C'}; % notes about experiment group    
    dat.choice(idx,:) = {[1 0 0 0 0 0 2 0]}; % frequency choice of each path
    dat.nchoices(idx) = sum(dat.choice{idx}); % total number of choices (i.e. subjects not excluded)
    dat.pchoice(idx,:) = {dat.choice{idx}./sum(dat.choice{idx},"all","omitmissing").*100}; % percentage choice of each path
    dat.short(idx,:) = 1; % which path was the shortcut route
    dat.year(idx,:) = 2004; % year of publication

%% add display name column
    dat.display_experiment = dat.experiment;
    dat.display_experiment( ismember(dat.experiment,'Birch_and_Korn_1958') ) = {'Birch and Korn (1958)'};
    dat.display_experiment( ismember(dat.experiment,'Gentry_et_al_1947') ) = {'Gentry et al. (1947)'};
    dat.display_experiment( ismember(dat.experiment,'Gentry_et_al_1948') ) = {'Gentry et al. (1948)'};
    dat.display_experiment( ismember(dat.experiment,'Kendler_and_Gasser_1947') ) = {'Kendler and Gasser (1947)'};
    dat.display_experiment( ismember(dat.experiment,'Kendler_and_Menchen_1948') ) = {'Kendler and Menchen (1948)'};
    dat.display_experiment( ismember(dat.experiment,'Ritchie_1948') ) = {'Ritchie (1948)'};
    dat.display_experiment( ismember(dat.experiment,'Tolman_et_al_1946') ) = {'Tolman et al. (1946)'};
    dat.display_experiment( ismember(dat.experiment,'Young_et_al_1967') ) = {'Young et al. (1967)'};
    dat.display_experiment( ismember(dat.experiment,'doner_et_al_2023') ) = {'Doner et al. (2023)'};
    dat.display_experiment( ismember(dat.experiment,'wilson_2018') ) = {'Wilson and Wilson (2018)'};
    dat.display_experiment( ismember(dat.experiment,'Harley_1979') ) = {'Harley (1979)'};
    dat.display_experiment( ismember(dat.experiment,'Chamberlain_1947') ) = {'Chamberlain (1947)'};
    dat.display_experiment( ismember(dat.experiment,'Muir_and_Taube_2004') ) = {'Muir and Taube (2004)'};

%% add chance shuffle info
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

%% end
    warning('on','MATLAB:table:RowsAddedExistingVars');



























