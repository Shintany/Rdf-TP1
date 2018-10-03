function [label_classif] = test_ppv(base_ref, label_ref, ex, k)
% Le but de cette fonction est de réaliser une classification des exemples
% de la base de référence
   
% ------------ Définition des vars ------------

% ------------ INPUT ------------
% base_ref  => Tableau des images de références
% label_ref => Indique la lettre traitée (B = 1 par exemple)
% ex        => L'exemple à traiter
% k         => Indique le nombre de voisins à traiter

% ------------ OUTPUT ------------
% label_classif => labels des k-ppv de l'exemple
  
    label_classif = zeros([1 k]);
    % Liste des distances entre tous les voisis et l'exemple
    dist_voisin = calculer_distance(ex, base_ref, label_ref);
    
    for i = 1 : k
        [min_value index] = min(dist_voisin(:,1));        
        label_classif(1, i) = dist_voisin(index, 2);
        dist_voisin(index, :) = [];
    end
    
    
end