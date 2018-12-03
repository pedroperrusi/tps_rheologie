function [ strain ] = mooney_rivelin( alpha, C )
%MOONEY_RIVELIN Summary of this function goes here
%   Detailed explanation goes here
    strain = 2*C(1)*(alpha.^2 - alpha.^(-1)) + 2*C(2)*(alpha - alpha.^(-2));

end

