% programme principal pour détermination de la position des points de
% Steiner
clear all
close all

global xvil lvil lstein
global nappel
global nb_pas_opt  temps_calcul % nombre de pas de la méthode

nappel=0;

% construction de la structure du réseau en fonction du "cas"
% le point de départ est déterminé dans le "cas"
type_graphe='4villes';
[xvil lvil lstein X0]=Graphe(type_graphe);
% dessin
plot(xvil(1,:),xvil(2,:),'*','linewidth',3)
hold on
% les méthodes:
Xtol=1e-2;
%nom_methode='Nelder Matlab';
%nom_methode='Newton Matlab';
%nom_methode='Pas Constant';
nom_methode='Grad';
%nom_methode='Grad Conj';
%nom_methode='Newton';


X=Optimiseur (@Objectif,X0,Xtol,nom_methode);

 
%  X(1)/X(2)
%  tan(pi/3)

plot(xvil(1,:),xvil(2,:),'*','linewidth',3)
hold on
plot(X([1:2:length(X)]),X([2:2:length(X)]),'or','linewidth',3)
title( 'Points de Steiner', 'fontsize',18)
grid
axis equal

fprintf ('méthode utilisée:  %s \n', nom_methode)
fprintf('nombre de pas d''optim : %u \n', nb_pas_opt)
fprintf('nombre d''appels à la fonction objectif: %u \n', nappel) 
fprintf('temps calcul CPU: %f  secondes \n',temps_calcul)
fprintf('longueur minimale obtenue: %f \n',Objectif(X))
fprintf('coordonnées des points solution:')
grid
X