
% Author: Leandro L. Minku (L.L.Minku@cs.bham.ac.uk) 
%
%
%Computes the a12 effect size proposed in the following paper:
% A Critique and Improvement of the "CL" Common Language Effect Size Statistics of McGraw and WongAuthor
% András Vargha and Harold D. Delaney
% Journal of Educational and Behavioral Statistics, Vol. 25, No. 2 (Summer, 2000), pp.101-132
%
% and explained in
% A Practical Guide for Using Statistical Tests to Assess Randomized
% Algorithms in Software Engineering
% Andrea Arcuri and Lionel Briand
% 
% As explained by the latter, a12 measures the probability tht running
% algorithm x yields higher values of the measurement taken than running
% another algorithm y.
% For example, A12 = 0.7 entails we would obtain higher results 70% of the
% time with algorithm x.
%
% Here, if x is larger than y, return the usual a12(x,y).
% Otherwise, return -1 * a12(y,x).

% According to Vargha and Delaney, a small, medium, large difference between two populations:
%  + Big is A12 >= 0.71
%  + Medium is A12 >=0.64
%  + Small is A12 >= 0.56



function a = a12(x, y)

[p,h,s] = ranksum(x,y);

[m,tmp] = size(x);
[n,tmp] = size(y);

a = (s.ranksum/m - (m+1)/2)/n;

if a < 0.50,
    [p,h,s] = ranksum(y,x);
    a = (s.ranksum/m - (m+1)/2)/n;
    a = -1 * a;
end
    
