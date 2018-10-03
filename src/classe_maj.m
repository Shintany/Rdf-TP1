function classe = classe_maj(pp)


%
%function classe = classe_maj(pp)
%
% IN  --> pp      : classe des plus proches voisins

%
% OUT --> classe : classe majoritaire si elle existe, -1 sinon


max_classe=max(pp);
vote=zeros(1,max_classe);
for i=1:max_classe
   vote(i) = sum(pp == ###); 
end
[nbVote, classe] = ###;
if (length(find(vote==nbVote)) ~= ###)
    classe = ###;
end
