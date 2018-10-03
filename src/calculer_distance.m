function [voisin] = calculer_distance(ex, base_ref, label)
%CALCULER_DISTANCE Summary of this function goes here
%   Detailed explanation goes here
    voisin = [];
    tmp = zeros([1 size(base_ref, 2)]);
    last_column = size(base_ref,2);
    for i = 1 : length(base_ref)
        for j = 1 : last_column
            tmp(j) = (ex(j) - base_ref(i ,j)).^2;
        end
%         voisin(1) = sum(tmp);
%         voisin(2) = label(i);
        voisin = [voisin ; sum(tmp) label(i)];
    end
end

