
% Author: Leandro L. Minku (L.L.Minku@cs.bham.ac.uk) 
%
% Computes the A12 effect size considering that x and y are composed of
% performances computed at each time step.
%
% At every "slide" time steps, computes the effect size considering a sliding window
% of size windowsize starting at this time step. 
%
% Arguments:
% + x and y are the vectors containing the observations for which A12
%   should be computed.
% + windowsize is the size of the window to calculate the effect sizes.
%   (in the last time steps, the effect size will be calculated based on
%   windows smaller than this value, as there won't be enough examples)
% + slide is how many time steps the window should slide. Examples are using
%   1 or slide = windowsize

function a = a12temporal2(x, y, windowsize, slide)

[m,tmp] = size(x);
[n,tmp] = size(y);

if n ~= m,
    fprintf('Samples should be of the same size\n');
    return;
end

a = [];
for i=1:slide:m,
    if i+windowsize-1 > m,
        windowsize = m-i+1; % use this is if you want to keep calculating the
        %effect size using smaller windows as we approach the end of the
        %stream.
        %return; use this is if you don't want that
    end
    %[p,h,s] = ranksum(x(i:i+window-1),y(i:i+window-1));
    %a = [a;(s.ranksum/(window) - (window+1)/2)/(window)];
    a = [a;a12(x(i:i+windowsize-1),y(i:i+windowsize-1))];
end
