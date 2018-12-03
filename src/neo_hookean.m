function [ strain ] = neo_hookean( alpha, G )
%NEO_HOOKEAN Summary of this function goes here
%   Detailed explanation goes here
    strain = G * (alpha.^2 - alpha.^(-1));

end

