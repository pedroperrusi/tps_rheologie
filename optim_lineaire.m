function erreur = optm_lineaire(yexp, x, experimental_set )
%MIN_CARRES Summary of this function goes here
%   referance cest une matrice avec les valeurs experimentaux dans la
%   premiere collumne et les valeurs estimes dans la deuxieme
  
    p1 = experimental_set(1);
    p2 = experimental_set(2);
 
    estimee = p1*x + p2;
    
    erreur = sum((yexp - estimee).^2);
end

