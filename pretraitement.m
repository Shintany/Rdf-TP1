close all
clear all
name=['B'; 'C'; 'D'; 'E'; 'F'; 'G';'H';'I';'J';'K'];

tab=[];
for lettre=1:10
    for i=1:250
        name1=['data/' name(lettre,:) num2str(i) '.bmp'];
        disp(name1);
        I=imread(name1);
        
        % Couple de coordonn�es dont le pixel est blanc
        [y,x]=find(I);
        
        %% Determination de la taille de la fen�tre
        % Trouver les coordonn�es de la fen�tre sous forme de quatre p�les
        % Et y ajouter ou soustraire 5 pixels pour obtenir une fen�tre
        % conforme selon l'�nonc�
        coord_ouest = min(x) - 5;
        coord_est   = max(x) + 5;
        coord_nord  = min(y) - 5;
        coord_sud   = max(y) + 5;
    
        %% Fen�trage de l'image aux coordonn�es limite
        I = I(coord_nord:coord_sud, coord_ouest:coord_est);
        % imshow(I); 
        
        % Redimmensionnent en 12x12
        I = imresize(I, [12 12]);
        % imshow(I);
        % Conversion de la matrice 12x12 en un seul vecteur ligne
        I=I(:)';
        tab=[tab ; I lettre];
    end
end
save tab tab;
   
