function val=FoncJ4(x)
% Construction d'une fonction non quadratique:

global nb_appel
global dessinpoint

c=[1;1];
A=[ 10 0 ;0 1];
val=0.5e-1*(x(1)^3-x(2)*x(1)+3*x(2)^2)    -  50* exp(-0.005*(x-c)'*A*(x-c));

if dessinpoint  % on ne dessine pas les points quand on utilise cette fonction pour les lignes de niveau  
    nb_appel=nb_appel+1; % on compte le nombre d'appel à la fonction objectif
   plot(x(1),x(2),'or','markersize',14) % dessin du point
   hold on
   pause(0.1) % pour ralentir un peu, et qu'on voit bien l'évolution de la suite de points
end