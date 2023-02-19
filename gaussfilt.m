% stollen/modified from James Conder's [gaussfilt]

function [ Filtered ] = gaussfilt(T,Z,Sigma,varargin)

if ~isempty(varargin)
    Causal = true;
else
    Causal = false;
end

A = 1/(sqrt(2*pi)*Sigma);
Sigma2 = Sigma*Sigma;


if Causal
    Filter = A*exp(-0.5*((T - mean(T)).^2)/(Sigma2));
    I = Filter < A*1.e-6;
    Filter(I) = [];
    Filter(1:(length(Filter)./2)) = 0;
    
    Filter = Filter.* 2;
    Filtered = conv(Z,Filter,'same');
    Filtered = Filtered./conv(ones(size(Z)),Filter,'same');
    
else
    
    Filter = A*exp(-0.5*((T - mean(T)).^2)/(Sigma2));
    I = Filter < A*1.e-6;
    Filter(I) = [];
    Filtered = nanconv(Z,Filter,'same');
    
    Filtered = Filtered./nanconv(ones(size(Z)),Filter,'same');
    
    
end