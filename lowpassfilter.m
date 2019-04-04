% simplpm1.m - matlab main program implementing
%              the simplest lowpass filter:
%
%                    y(n) = x(n)+x(n-1)}
% https://www.dsprelated.com/freebooks/filters/Matlab_Analysis_Simplest_Lowpass.html
function [Y] = lowpassfilter(X)

    %N=length(X);       % length of test
    %x = 1:N;    % test input signal (integer ramp)
    B = [1,1];  % transfer function numerator
    A = 1;      % transfer function denominator

    Y = filter(B,A,X);
butter
end