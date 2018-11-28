function erreur = optim_mooney_rivelin( strain, alpha, C )
%estim_mooney_rivelin Summary of this function goes here
%   Detailed explanation goes here
    estimee = 2*C(1)*(alpha.^2 - alpha.^(-1)) + 2*C(2)*(alpha - alpha.^(-2));
    
    erreur = sum((strain - estimee).^2);

end

