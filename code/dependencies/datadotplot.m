function [eh,ph,ds,gs] = datadotplot(ax,dat,varargin)
% name short description
% longer description
%
% USAGE
%
% out = name(in) process with default settings
%
% out = name(in,optional) process using optional argument 1
%
% out = rate_mapper(__,name,value) process with Name-Value pairs 
%
% INPUT
%
% 'in' - Scalar, positive integer that specifies X
%       units are in Y.
%       Default value is Z.
%
% OUTPUT
%
% 'out' - Scalar, positive integer that specifies X
%       units are in Y.
%       Default value is Z.
%
% NOTES
% 1. 
%
% 2. 
%
% EXAMPLE
% 
% SEE ALSO NAME, NAME

% HISTORY
%
% version 1.0.0, Release 00/00/25 Initial release
%
% AUTHOR 
% Roddy Grieves
% University of Glasgow, Sir James Black Building
% Neuroethology and Spatial Cognition Lab
% eMail: roddy.grieves@glasgow.ac.uk
% Copyright 2025 Roddy Grieves

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% INPUTS
%%%%%%%%%%%%%%%% ARGUMENT CHECK
    def_marker = {'o'};
    def_msize = 3;
    def_ecolor = 'none';
    def_color = [0 0 0];
    def_jitter = 0.35;

    % Parse inputs
    p = inputParser;
    addRequired(p,'ax');  
    addRequired(p,'dat',@(x) isnumeric(x));  
    addParameter(p,'means',true,@(x) isscalar(x));  
    addParameter(p,'lines',false,@(x) isscalar(x));      
    addParameter(p,'error',true,@(x) isscalar(x));   
    addParameter(p,'boxes',true,@(x) isscalar(x));   
    addParameter(p,'dots',true,@(x) isscalar(x));  
    addParameter(p,'gcolors',def_color,@(x) isnumeric(x)); 
    addParameter(p,'ecolors',def_ecolor);     
    addParameter(p,'gmarkers',def_marker,@(x) iscell(x));  
    addParameter(p,'msize',def_msize,@(x) isscalar(x));      
    addParameter(p,'jitter',def_jitter,@(x) isscalar(x) && isnumeric(x));   
    addParameter(p,'etype',1,@(x) isscalar(x) && isnumeric(x));   

    parse(p,ax,dat,varargin{:});
    config = p.Results;

    if isempty(config.ax) || ~ishandle(config.ax)
        config.ax = gca;
    end
    hold(ax,'on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION BODY
    % prepare the data
    if iscell(dat)
        s = cell2mat(cellfun(@numel,dat,'uniformoutput',0));
        dat2 = NaN(max(s,[],"all",'omitmissing'),length(s));
        for kk = 1:length(dat)
            dat2(1:s(kk),kk) = dat{kk};
        end
        dat = dat2;
    end
    [g,~] = meshgrid(1:size(dat,2),1:size(dat,1));
    ngroups = size(dat,2);
    ds = dat(:);
    gs = g(:);

    % means and stdv
    m = mean(dat,1,'omitmissing');
    if ~config.error
        e = NaN(size(m));
    else
        if config.etype==1
            s = std(dat,[],1,'omitmissing');
            e = s ./ sqrt(sum(~isnan(dat),1));
        elseif config.etype==2
            e = std(dat,[],1,'omitmissing');
        end
    end

%%%%%%%%%%%%%%%% plot the data
    % dots
    % make sure marker colors are correct
    if size(config.gcolors,1) ~= ngroups
        if size(config.gcolors,1)==1
            config.gcolors = repmat(config.gcolors,ngroups,1);
        else
            config.gcolors = repmat(def_color,ngroups,1);
        end
    end

    % make sure marker edge colors are correct
    if size(config.ecolors,1) ~= ngroups
        if size(config.ecolors,1)==1
            config.ecolors = repmat(config.ecolors,ngroups,1);
        else
            config.ecolors = repmat(def_ecolor,ngroups,1);
        end
    end    

    % make sure markers are correct
    if size(config.gmarkers,1) ~= ngroups
        if isscalar(config.gmarkers)
            config.gmarkers = repmat(config.gmarkers(1),ngroups,1);
        else
            config.gmarkers = repmat(def_marker,ngroups,1);
        end
    end

    % make sure marker sizes are correct
    if size(config.msize,1) ~= ngroups
        if isscalar(config.msize)
            config.msize = repmat(config.msize(1),ngroups,1);
        else
            config.msize = repmat(def_msize,ngroups,1);
        end
    end

    % plot dots
    ph = {};
    if config.dots
        for gg = 1:ngroups
            yg = dat(:,gg);
            % xg = ( ones(size(yg)).*gg ) + normrnd(0,config.jitter,size(yg));
            a = gg-config.jitter;
            b = gg+config.jitter;
            xg = a + (b-a).*rand(size(yg));
            ph{gg} = plot(ax,xg,yg,'Marker',config.gmarkers{gg},'MarkerSize',config.msize(gg),'MarkerFaceColor',config.ecolors(gg,:),'MarkerEdgeColor',config.gcolors(gg,:),'LineStyle','none');
        end
    end

    % means & errors
    x = 1:ngroups;
    if config.error
        if config.lines
            lstyle = '-';
            lcolor = 'k';
        else
            lstyle = 'none';
            lcolor = 'none';
        end
        if config.means
            mstyle = 'o';
            mcolor = 'k';
        else
            mstyle = 'none';
            mcolor = 'none';
        end
        eh = errorbar(ax,x,m,e,e,'ko','Marker',mstyle,'MarkerFaceColor',mcolor,'LineStyle',lstyle);
    end






