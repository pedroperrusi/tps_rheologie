function [ erreur ] = optim_ogden( strain, alpha, O )
%OPTIM_OGDEN Summary of this function goes here
%   Detailed explanation goes here
    estimee = ogden(alpha, O);
    
    erreur = sum((strain - estimee).^2);

end

