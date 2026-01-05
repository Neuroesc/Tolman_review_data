<img width="303" height="102" alt="neuroesc_long" src="https://github.com/user-attachments/assets/e185a933-e27d-4436-ab1f-52a4fe389e38" />

# Tolman_review_data
Data and analysis code for:  
>[Duvelle and Grieves (2026) Tolman’s Sunburst Maze 80 years on: A meta-analysis reveals poor replicability and little evidence for shortcutting](https://doi.org/10.1111/ejn.70365)

>Abstract  
The Sunburst maze, first described 80 years ago by Tolman, Ritchie, and Kalish (1946) and popularized by Tolman (1948), is widely regarded as a classic demonstration of cognitive map use in rats. In this task, animals trained on a circuitous path to a reward were presented with new paths, including a shortcut, after the original route was blocked. A substantial proportion of rats selected the shortcut, which Tolman et al. (1946; 1948) interpreted as evidence that animals have an internal spatial representation, or ‘cognitive map’. Despite the influence of this study, attempts to replicate it have been largely unsuccessful. This review critically examines a dozen replications involving rats, squirrel monkeys, and humans, highlighting a range of alternative strategies, with only a fraction of experiments demonstrating shortcutting (17%). Instead, most studies found that animals either favoured paths adjacent to the original training route (32%), did not have a preference (26%), chose unremarkable paths (13%), or selected options consistent with previously rewarded responses (6%), suggesting a reliance on procedural or associative learning rather than demonstrating flexible spatial inference. Although the original experiment has been widely criticized for including a visual cue above the reward location, subsequent studies rarely found that this feature guided path choices (6%). Neurophysiological data from hippocampal lesion and head-direction cell studies further question the claim that shortcutting in the Sunburst maze depends on cognitive maps. We argue that this study, though historically significant, is a poor standalone demonstration of map-based navigation.

## Code
All code is in Matlab format and was prepared using Matlab 2025a.
- TOL_main: main analysis code, see this for comments and explanation of the below codes
- TOL_plotter: code for generating the histogram plots used throughout the article based on the main data table
  
- TOL_fig_tolman1946: Fig 1, shortcutting, Tolman et al.'s (1946) procedure and results, citations
> [!NOTE]
> Fig 2 was generated in Inkscape and the .svg file for this is also provided  
- TOL_fig_stats1: Fig 3, different possible responses, comparisons across all replications
- TOL_fig_stats2: Fig 4, many results suggest that subjects do not use a map to solve the task

- TOL_fig_tryon1929: Fig S1 Tolman, Tryon and Jeffress (1929)
- TOL_fig_gentry1947: Fig S2 Gentry et al. (1947) & Birch and Korn (1958)
- TOL_fig_harley1979: Fig S3 Harley (1979)
- TOL_fig_wilson2018: Fig S4 Wilson and Wilson (2018) & Doner et al. (2023)
- TOL_fig_young1967: Fig S5 Young et al. (1967)
- TOL_fig_ritchie1948: Fig S6 Ritchie (1948)
- TOL_fig_kendler1947: Fig S7 Kendler et al. (1947; 1948)
- TOL_fig_gentry1948: Fig S8 Gentry et al. (1948)
- TOL_fig_muir2004: Fig S9 Muir and Taube (2004)
- TOL_fig_dawson1972: Fig S10 Dawson (1972)
- TOL_fig_ga: Graphical Abstract

## Dependencies
Dependencies are included alongside the code and include:
- [cmocean perceptually-uniform colormaps](https://uk.mathworks.com/matlabcentral/fileexchange/57773-cmocean-perceptually-uniform-colormaps?s_tid=srchtitle)
- [legendflex.m: a more flexible, customizable legend](https://uk.mathworks.com/matlabcentral/fileexchange/31092-legendflex-m-a-more-flexible-customizable-legend?s_tid=srchtitle)
- [hatchfill2](https://uk.mathworks.com/matlabcentral/fileexchange/53593-hatchfill2?s_tid=srchtitle)
- [RGB triple of color name, version 2](https://uk.mathworks.com/matlabcentral/fileexchange/24497-rgb-triple-of-color-name-version-2?s_tid=srchtitle)
- [Perceptually uniform colormaps](https://uk.mathworks.com/matlabcentral/fileexchange/51986-perceptually-uniform-colormaps/)

## Data
Data files.
- TOL_data.m, this matlab script will output the main data table in matlab table format (recommended)
- summary_data.xlsx contains the main data table in excel format (not recommended)
- doner_et_al_2023_data.xlsx contains the data from Doner et al. (2023) downloaded from their [lab website](http://humanspatialcognitionlab.org/open-source-data-supplemental-materials/).
- wilson_wilson_2018_data.xlsx, contains the data from Wilson and Wilson (2018) downloaded from the [link](https://doi.org/10.1371/journal.pone.0208794.s001) in the publication.

## Main figures
The main figures, in .png format.
> [!NOTE]
> These files are provided free to use, feel free to modify or reproduce them in accordance with the license associated with this repository.

## Papers
A copy of each replication experiment cited in the main text can be found in this repo, as well as in [this Zotero group library](https://www.zotero.org/groups/6348142/tolmanrevisited_duvellegrieves2025), along with a number of other publications which may not be easy to acquire.
> [!IMPORTANT]
> These files are provided for reference only.

## Schematics
Scaled vector graphics (.svg) schematics of the different apparatus. These are exported and used to generate the main text figures.
> [!NOTE]
> These files are provided free to use, feel free to modify or reproduce them in accordance with the license associated with this repository.
