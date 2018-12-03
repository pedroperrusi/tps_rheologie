function [ erreur ] = optim_langevin( strain, alpha, L )
%OPTIM_LANGEVIN Summary of this function goes here
%   Detailed explanation goes here
    estimee = langevin(alpha, L);
    
    erreur = sum((strain - estimee).^2);
    
    % Les parametres ne peut pas etre negatifs, alors on augmente beaucoup
    % le erreur
    if(L(1) < 0 || L(2) < 0 || L(3) < 0)
       erreur = 1e25; 
    end

end

