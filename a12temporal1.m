
% Author: Leandro L. Minku (L.L.Minku@cs.bham.ac.uk) 
%
% Computes the effect size considering that x and y are composed of
% performances computed at each time step.
%
% At each time step, computes the effect size considering all time steps so
% far.
%
% Arguments:
% + x and y are the vectors containing the observations for which A12
%   should be computed.
% + begin is which time step to start the computation of effect sizes.

function a = a12temporal1(x, y,begin)

[m,tmp] = size(x);
[n,tmp] = size(y);

if n ~= m,
    fprintf('Samples should be of the same size\n');
    return;
end

a = [];
for i=begin:m,
    %[p,h,s] = ranksum(x(1:i),y(1:i));
    %a = [a;(s.ranksum/i - (i+1)/2)/i];
    a = [a;a12(x(1:i),y(1:i))];
end
