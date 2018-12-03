function [ erreur ] = optim_neo_hookean( strain, alpha, G )
%OPTM_NEO_HOOKEAN Summary of this function goes here
%   Detailed explanation goes here

    estimee = neo_hookean(alpha, G);
    
    erreur = sum((strain - estimee).^2);

end

