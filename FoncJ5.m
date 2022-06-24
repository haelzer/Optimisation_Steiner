function val=FoncJ5(x)
% Construction d'une fonction non quadratique:

global nb_appel
global dessinpoint


val=sin(x(1)/3)*cos(x(2)/5) + x(1)/10;

if dessinpoint  % on ne dessine pas les points quand on utilise cette fonction pour les lignes de niveau  
    nb_appel=nb_appel+1; % on compte le nombre d'appel à la fonction objectif
   plot(x(1),x(2),'or','markersize',14) % dessin du point
   hold on
   pause(0.1) % pour ralentir un peu, et qu'on voit bien l'évolution de la suite de points
end