function [ strain ] = ogden( alpha, O )
%OGDEN Modele de deformations d'ogden. 
%   O est le vecteur de parametres am et um. Sur la forme O = [a1, a2; u1, u2]
    a1 = O(1,1); a2 = O(1,2);
    u1 = O(2,1); u2 = O(2,2);
    strain = u1 * (alpha.^a1 - alpha.^(-a1/2)) ...
           + u2 * (alpha.^a2 - alpha.^(-a2/2));

end

