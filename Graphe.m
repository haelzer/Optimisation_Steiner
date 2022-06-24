function [xvil lvil lstein X0]=Graphe(type_graphe)

% construction de la structure du r�seau en fonction du cas
% '3villes', '4villes', '5villes'....
% Voir dans l'�nonc� le principe de la structure choisie
% Vu en TD �galement...

if strcmp(type_graphe,'3villes') % cas du triangle �quilateral
xvil =[ 0 0 ; 1 0; 0.5 0.5*3^0.5]'; % coordonn�es des villes
% liaisons 
lvil=[1 1 1];  %Toutes les villes li�es au point 1
lstein = [0]; % liaisons des points de Steiner entre eux
% position initiale des points 
X0=[0.8;0.8 ]; 

elseif strcmp(type_graphe,'4villes') % cas du carr�
xvil =[ 0 0 ; 1 0; 0. 1; 1  1]';
% liaisons 
lvil=[1 1 2 2];
lstein = [2 0];
% position initiale des points 
X0=[0.1;0.3 ; 0.8; 0.8];  

elseif strcmp(type_graphe,'5villesbis')
% coordonn�es des villes villes en colonnes
xvil =[ 0 0 ; 1 0; 0 1 ; 1 1 ; 0.5 2]';
% liaisons 
lvil=[1 1 2 2 2  ];
lstein = [2  0];
% position initiale des points 
X0=[0.2;0.2;0.3;0.3 ]; 

elseif strcmp(type_graphe,'5villes')
% coordonn�es des villes villes en colonnes
xvil =[ 0 1 ; 0 2; 1 0 ; 1 2 ; 3 1]';
% liaisons 
lvil=[2 1 3 1 3  ];
lstein = [2 3 0];
% position initiale des points 
X0=[0.3;0.3;0.2;0.2; 0.1; 0.1 ]; 

elseif strcmp(type_graphe,'6villes')
% coordonn�es des villes villes en colonnes
xvil =[ 0 0 ; 1 0; 0.4 1 ; 0.8 0.8 ; 0.2 1.5; 0.8 1.5]';
% liaisons 
lvil=[1 1 2 2 3 3 ];
lstein = [2 3 0];
% position initiale des points 
X0=[0.5;0.5;0.6;0.6; 0.7; 0.7 ]; 

elseif strcmp(type_graphe,'8villes')
% coordonn�es des villes villes en colonnes
xvil =[ 0 0 ; 1 0; 0.4 1 ; 0.8 0.8 ; 0. 2.3; 0.8 1.5;0 3; 1 3 ]';
% liaisons 
lvil=[1 1 2 2 4 3 4 4];
lstein = [2 3 4 0];
% position initiale des points 
X0=[0.5;0.5;0.6;0.6; 0.7; 0.7 ; 0.8; 0.8];  
end