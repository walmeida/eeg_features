%****************************************************************
% lowpassfilter.m
% Esta fun��o implementa e aplica Buttrworth lowpassfilter
% Data: 01/04/2019
% Autor: Wallace Almeida
%****************************************************************

%****************************************************************
% Par�metros:
% X: sinal - vetor coluna
% n: ordem do filtro
% fc: frequ�ncia de corte
% fs: frequ�ncia de amostragem
%****************************************************************
% https://www.mathworks.com/help/signal/ref/butter.html

function [Y] = lowpassfilter(X, n, fc, fs)
    Wn = fc/(fs/2);
    [B, A] = butter(n, Wn, 'low');
    Y = filter(B,A,X);
end