function [val,Grad,H]=FoncJ1(x)
% exemple de fonction quadratique simple pour tester  l'optimiseur

global dessinpoint
global nb_appel

A=[ 0.5  0.3 ; 0.3, 6];
b= [5;0];
val=(x)'*A*(x) +b'*x;
Grad=2*A*x+b;
H=2*A;
if dessinpoint  % on ne dessine pas les points quand on utilise cette fonction pour les lignes de niveau
    nb_appel=nb_appel+1;
    plot(x(1),x(2),'or','markersize',14)
    hold on
   pause(0.1) % pour ralentir un peu
end