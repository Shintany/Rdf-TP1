clear
close all
clear all
addpath src
name=['B'; 'C'; 'D'; 'E'; 'F'; 'G';'H';'I';'J';'K'];

REFERENCE_LIM = 150;
VALIDATION_LIM = 50;
TEST_LIM = 50;

x_redim = 12;
y_redim = 12;

tab=[];
for lettre=1:10
    for i=1:250
        name1=['data/' name(lettre,:) num2str(i) '.bmp'];
        % disp(name1);
        I=imread(name1);
        
        % Couple de coordonnées dont le pixel est blanc
        [y,x]=find(I);
        
        %% Determination de la fenetre
        coord_nord  = min(y) - 5;
        coord_sud   = max(y) + 5;
        coord_ouest = min(x) - 5;
        coord_est   = max(x) + 5;
        
        %% Fenêtrage de l'image aux coordonnées limite
        I = I(coord_nord:coord_sud, coord_ouest:coord_est);
        
        % Redimmensionnent en 12x12
        I = imresize(I, [x_redim y_redim]);
        % imshow(I);
        % Conversion de la matrice 12x12 en un seul vecteur ligne
        I=I(:)';
        tab=[tab ; I lettre];
    end
end
save tab tab;

% %% Création de la base de référence
% base_ref = [];
% start_ref_index = 0;
% for lettre = 1 : 10
%     for cpt = 1 : REFERENCE_LIM
%         I = tab(start_ref_index + cpt, :);
%         base_ref = [base_ref ; I];
%     end
%     start_ref_index = start_ref_index + 250;
% end
% 
% %% Création de la base de validation
% base_val = [];
% start_ref_index = 150;
% for lettre = 1 : 10
%     for cpt = 1 : VALIDATION_LIM
%         I = tab(start_ref_index + cpt, :);
%         base_val = [base_val ; I];
%     end
%     start_ref_index = start_ref_index + 200;
% end
% 
% %% Création de la base de test
% base_test = [];
% start_ref_index = 200;
% for lettre = 1 : 10
%     for cpt = 1 : TEST_LIM
%         I = tab(start_ref_index + cpt, :);
%         base_test = [base_test ; I];
%     end
%     start_ref_index = start_ref_index + 200;
% end
% 
% %% TEST DE CLASSIFICATION
% k = 3;
% label = base_ref(:, 145);
% 
% total = length(base_test);
% score = 0;
% for i = 1 : total
%     ex = base_test(i, 1:144);
%     vrai_label = base_test(i, 145);
%     label_classif = test_ppv(base_ref(:, 1:144), label, ex, k);
%     if(label_classif == vrai_label)
%         score = score + 1;
%         fprintf('Exemple : %d a bien été trouvé') 
%     end
% end
% 
% score