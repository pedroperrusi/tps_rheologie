function [ erreur ] = optm_neo_hookean( strain, alpha, G )
%OPTM_NEO_HOOKEAN Summary of this function goes here
%   Detailed explanation goes here

    estimee = G * (alpha.^2 - alpha.^(-1));
    
    erreur = sum((strain - estimee).^2);

end

