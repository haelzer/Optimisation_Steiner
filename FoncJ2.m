function val=FoncJ2(x)
% Construction d'une fonction non quadratique:

global nb_appel
global dessinpoint

nb_appel=nb_appel+1; % on compte le nombre d'appel à la fonction objectif

A=[ 3 0.5; 0.5  1];
c1=[5;5];
c2=[-10;5];
val= 0.1*x'*A*x - 80*exp(-0.05*norm(x-c1)^2)- 50*exp(-0.08*norm(x-c2)^2);

if dessinpoint  % on ne dessine pas les points quand on utilise cette fonction pour les lignes de niveau                  
   plot(x(1),x(2),'or','markersize',14) % dessin du point
   hold on
   pause(0.1) % pour ralentir un peu, et qu'on voit bien l'évolution de la suite de points
end