function [ strain ] = langevin( alpha, L )
%LANGEVIN Modele de deformations d'Langevin.
%   Input est le vecteur de deformations alpha et L est une vecteur de
%   parametres. L = [G N n]
    G = L(1); 
    N = L(2);
    n = L(3);
    
    strain = G * (alpha.^2 - alpha.^(-1)) ...
           + G*N/(5*n) * (alpha.^4 - 2./alpha.^2 + alpha);

end

