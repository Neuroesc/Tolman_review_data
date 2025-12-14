function result = compute2propXtest(N1, p1, N2, p2, alpha, print_result)
%compute2propXtest Compare two independent proportions using the
% N-1 Chi-squared test (Campbell 2007; Richardson 2011).
% Also computes CI for the difference in proportions (Altman et al. 2000).
%
% Usage:
%   result = compareProportions(N1, p1, N2, p2)
%   result = compareProportions(N1, p1, N2, p2, alpha)
%
% Inputs:
%   N1, N2 : sample sizes of groups 1 and 2
%   p1, p2 : observed percentage (0–100) in groups 1 and 2
%   alpha  : significance level (default 0.05)
%   print_result: display text result or not (default false)
%
% Outputs (struct):
%   .chi2       : Chi-squared statistic (N-1 test)
%   .p          : p-value
%   .diff       : difference in proportions (p1 - p2)
%   .ci         : confidence interval for difference
%   .prop1, .prop2, .N1, .N2 : echoes inputs

    if ~exist('alpha','var') || all(isnan(alpha)) || isempty(alpha)
        alpha = 0.05;
    end
    if ~exist('print_result','var') || all(isnan(print_result)) || isempty(print_result)
        print_result = false;
    end

    % convert percentages to proportions
    p1 = p1 / 100;
    p2 = p2 / 100;

    % Counts
    x1 = round(p1 * N1);
    x2 = round(p2 * N2);
    
    % Observed proportions
    p1hat = x1 / N1;
    p2hat = x2 / N2;
    diff  = p1hat - p2hat;
    
    % Pooled proportion
    p = (x1 + x2) / (N1 + N2);
    
    % N-1 Chi-squared test statistic (Campbell & Richardson)
    chi2 = ( (N1+N2-1) * ( (abs(p1hat - p2hat))^2 ) ) / ...
           ( ( (x1+x2) * (1 - (x1+x2)/(N1+N2)) ) * ( (1/N1) + (1/N2) ) );
    
    % p-value (chi-square with 1 d.f.)
    pval = 1 - chi2cdf(chi2,1);
    
    % Confidence interval (Altman et al., 2000)
    % Standard error for difference in proportions
    se = sqrt( (p1hat*(1-p1hat))/N1 + (p2hat*(1-p2hat))/N2 );
    z = norminv(1 - alpha/2);
    ci = [diff - z*se, diff + z*se];
    
    % Return results
    result = struct('chi2',chi2, ...
                    'p',pval, ...
                    'diff',diff, ...
                    'ci',ci, ...
                    'prop1',p1hat, ...
                    'prop2',p2hat, ...
                    'N1',N1, ...
                    'N2',N2, ...
                    'text_result',sprintf('X{^2} = %.1f, {\\itp} = %s',chi2,strrep(num2str(pval,2),'0.','.')));

    if print_result
        fprintf('Difference in proportions: %.3f\n', result.diff);
        fprintf('95%% CI: [%.3f, %.3f]\n', result.ci(1), result.ci(2));
        fprintf('Chi2 (N-1): %.3f, p=%.4f\n', result.chi2, result.p);
    end
end
