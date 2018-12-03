function erreur = optim_mooney_rivelin( strain, alpha, C )
%estim_mooney_rivelin Summary of this function goes here
%   Detailed explanation goes here
    estimee = mooney_rivelin(alpha, C);
    
    erreur = sum((strain - estimee).^2);

end

