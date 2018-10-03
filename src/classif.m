clear all;
close all

load tab
%% Classification avec les kppv 
taille=size(tab,2)-1;
nb_ref=150;

%Création des 3 bases
Nb_classe = 10;
base_ref=zeros(nb_ref*Nb_classe,taille);
etiq_ref=zeros(nb_ref*Nb_classe,1);
base_val=zeros(50*Nb_classe,taille);
etiq_val=zeros(50*Nb_classe,1);
base_test=zeros(50*Nb_classe,taille);
etiq_test=zeros(50*Nb_classe,1);

for lettre =1:Nb_classe;
    Pix=find(tab(:,end)==lettre);
    %base de reference
    base_ref(nb_ref*(lettre-1)+1 : nb_ref*lettre, 1 : taille) = tab(Pix(1:nb_ref), 1 : taille) ;
    etiq_ref(nb_ref*(lettre-1)+1 : nb_ref*lettre) = tab(Pix(1:nb_ref),end) ;
    
    % base de validation
    base_val(50*(lettre-1)+1 : 50*lettre, 1 : taille) =tab(Pix(151:200), 1 : taille) ;
    etiq_val(50*(lettre-1)+1 : 50*lettre) = tab(Pix(151:200), end) ;
  
     % base de test
    base_test(50*(lettre-1)+1 : 50*lettre, 1 : taille) =tab(Pix(201:250), 1 : taille) ;
    etiq_test(50*(lettre-1)+1 : 50*lettre) = tab(Pix(201:250), end) ;
end;

% %1PPV
% tic;
% liste_class=zeros(1,size(base_val,1));
% for num_ex=1:size(base_val,1)
%     ex=###;
%     [label_classif] = test_ppv(###);
%     liste_class(num_ex) = ###;
% end
% time=toc;
% %Calcul de la matrice de confusion et du taux de reco
% [Conf, TauxRejet,TauxReco] = calc_res(###,###)

index_test = 256;
total = size(base_test, 1);
score = 0;

k = 5;
for num_ex = 1 : size(base_test,1)
    ex = base_test(num_ex, 1:144);
    vrai_label = etiq_test(num_ex);
    label_classif = test_ppv(base_ref, etiq_ref, ex, k);
    
    %Vote
    vote = mode(label_classif(:));
    if (vote == vrai_label)
        score = score + 1;
    end
end

prct = (score * 100 / total)