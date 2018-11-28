%% TP Rheologie des Milleux Continus

% Pedro Henrique Suruagy Perrusi

clear all;
close all;

question = 2;

%% Question 1 (Fit des donnees)
if question == 1
    % Ajouter bruit ?
    add_bruit = true;
    snr = 0; %dB
    % Generation des donnees
    x = 1 : 10;
    donnes_exp = 2*x + 5;
    if (add_bruit)
        donnes_exp = awgn(donnes_exp, snr);
    end
    % affichage initialle
    plot(x , donnes_exp, 'o'); hold on;

    % Methode 1:  partir d'outil basic fitting..
    % au cliauer en tools -> basic fitting -> lineaire
    % on obtient y = p1*x + p2;
    %   p1 = 2; p2 = 5; norm_residus = 7.9441e-15
    disp('Parametres estimees par figure outils')
    disp('p1 = 2; p2 = 5')

    % Methode 2: a partir de polyfit
    degree = 1; 
    p = polyfit(x, donnes_exp, degree);
    % donc, on peut estimer
    donnes_estimees2 = p(1) * x + p(2);
    % plot estimes
    plot(x, donnes_estimees2);
    disp('Parametres estimees par polyfit')
    disp(p)

    % Methode 3: a partir de fminsearch
    % generate le vecteur entre de fminsearch
    init_set = [1 1]; % initial values for p1 and p2
    estim_neohook = fminsearch(@(experimental_set) optim_lineaire(donnes_exp,x,experimental_set), init_set);
    disp('Parametres estimees par fminsearch')
    disp(estim_neohook)
end
%% Question 2 (Tritement des resultats du capteur)
if question == 2
    % caracteristiques
    epaisseur_i = 0.007; %m
    diametre = 0.010; %m
    % la machine nous fourni des donnees de deplacement, en mm , et force, en
    % mN
    deplacement = [0 0.35 0.7 1.05 1.4 1.75 2.1 2.45 2.8]./1000;
    force = [0 38 85 126 180 252 349 503 895]./1000;
    % on calcule la deformation alpha1
    alpha = (epaisseur_i + deplacement)/epaisseur_i;
    disp('Strain alpha 1:')
    disp(alpha)
    % on calcule le stress
    t1 = force./(pi*diametre^2/4);
    % note que pour une deformation uniaxiale la contrainte vrai est
    sigma = t1 .* alpha;
    disp('Engineering stress')
    disp(t1)
    disp('Real stress')
    disp(sigma)
    
    % plot les donnees
    figure
    plot(alpha, t1, '+', 'LineWidth', 2);hold on;
    plot(alpha, sigma, 'o', 'LineWidth', 2);hold off;
    legend('Engineering stress', 'Real stress');
    xlabel('Alpha (Lambda)')
    xlabel('Stress (Pa)')
    title('Resultat Experimental')
    
    %% Question 3 (Fit par des modeles de deformation)
    % modele neo hookean
    % 1/2*G(alpha1^2 + alpha2^2 + alpha3^2 -3) = G*(alpha.^2 - 1/alpha)
    % 
    G_i = 1; % initial values for G
    estim_neohook = fminsearch(@(G) optim_neo_hookean(sigma,alpha,G), G_i);
    disp('Neo Hook : Parametres estimees pour G (Pa)')
    disp(estim_neohook)
    
    % modele Mooney-Rivelin
    C_i = [1 1];
    estim_mooney = fminsearch(@(C) optim_mooney_rivelin(sigma,alpha,C), C_i);
    disp('Mooney: Parametres estimees pour C (Pa)')
    disp(estim_mooney)
end



