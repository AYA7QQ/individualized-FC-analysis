%% 1. Input Data
% Please replace this section with your own data.

% Group 1 
r1 = 0.12;  % Correlation coefficient for Group 1
n1 = 22;    % Sample size for Group 1

% Group 2 
r2 = 0.44;  % Correlation coefficient for Group 2
n2 = 23;    % Sample size for Group 2

%% 2. Perform Fisher's r-to-z Transformation
% The atanh() function in MATLAB is the hyperbolic arctangent, which is
% mathematically equivalent to Fisher's transformation: 0.5*log((1+r)/(1-r)).

z1 = atanh(r1);
z2 = atanh(r2);

% Manually
% z1 = 0.5 * log((1 + r1) / (1 - r1));
% z2 = 0.5 * log((1 + r2) / (1 - r2));


%% 3. Calculate the Z-score for Comparing the Two z-values (Test Statistic)
% Calculate the Z-score based on the standard formula.

denominator = sqrt(1/(n1 - 3) + 1/(n2 - 3));
z_score = (z1 - z2) / denominator;


%% 4. Calculate the p-value for a two-tailed test
% The Z-score follows a standard normal distribution. The p-value represents
% the probability of observing the current difference or a more extreme one.
% - normcdf(abs(z_score)) calculates the cumulative probability from negative infinity to |Z|.
% - 1 - normcdf(abs(z_score)) calculates the probability of one tail.
% - We multiply by 2 to get the p-value for a two-tailed test.

p_value = 2 * (1 - normcdf(abs(z_score)));


%% 5. Display the Results
% Use the fprintf() function to clearly output the results.

fprintf('--- Fisher r-to-z Correlation Comparison Test ---\n');
fprintf('Group 1: r = %.4f, n = %d\n', r1, n1);
fprintf('Group 2: r = %.4f, n = %d\n', r2, n2);
fprintf('\n');
fprintf('Test Statistic Z-score: %.4f\n', z_score);
fprintf('Two-tailed P-value: %.4f\n', p_value);
fprintf('-------------------------------------------\n');

% Interpret the result based on the p-value
alpha = 0.05; % Significance level
if p_value < alpha
    fprintf('The difference between the two correlation coefficients is statistically significant at the alpha = %.2f level.\n', alpha);
else
    fprintf('The difference between the two correlation coefficients is not statistically significant at the alpha = %.2f level.\n', alpha);
end