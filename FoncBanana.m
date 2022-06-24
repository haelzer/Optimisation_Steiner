function val=FoncJ2(x)
% Fonction de Rosenbrock:

global nb_appel
global dessinpoint

nb_appel=nb_appel+1;

p=100;
a=0.1;

val= (a*x(1)-1)^2 +  p*((a*x(1))^2-(a*x(2)))^2;

if dessinpoint  % on ne dessine pas les points quand on utilise cette fonction pour les lignes de niveau
plot(x(1),x(2),'or','markersize',14)
hold on
pause(0.1) % pour ralentir un peu
end