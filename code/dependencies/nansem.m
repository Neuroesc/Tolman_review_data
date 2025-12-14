function y = nansem(X,dim)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ################################################################# %% DESCRIPTION
%FUNCTION  short desc.
%
% USAGE:
%           out = template(in) process with default settings
%
%           out = template(in,optional1) process using optional argument 1
%
%           out = template(___,Name,Value,...) process with Name-Value pairs used to control aspects 
%           of the process
%
%           Parameters include:
%
%           'param1'          -   Scalar value, parameter to do something
%
%           'param2'          -   Scalar value, parameter to do something
%
% EXAMPLES:
%
%           % run function using default values
%           out = template(in,varargin)
%
% See also: FUNCTION2 FUNCTION3

% HISTORY:
% version 1.0.0, Release 00/00/00 Initial release
%
% Author: Roddy Grieves
% UCL, 26 Bedford Way
% eMail: r.grieves@ucl.ac.uk
% Copyright 2019 Roddy Grieves

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ################################################################# %% INPUT ARGUMENTS CHECK
%% Parse inputs
    if nargin==1
        dim = 1;
    end
    
%% ##################################### Heading 2
%% #################### Heading 3
%% Heading 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ################################################################# %% FUNCTION BODY
    y = nanstd(X,[],dim) ./ sqrt(sum(~isnan(X),dim));




































