% Test de la fonction Optimiseur

clear all
close all
global nb_pas_opt temps_calcul 
global nb_appel    % nombre d'appels � la fonction objectif
global dessinpoint

%  nom des m�thodes � copier coller 
%  'Nelder Matlab' 'Newton Matlab'  'Pas Constant'  'Grad'  'Grad Conj'  'Newton'

FoncCout=@FoncJ1;   % fonction � optimiser (2D)
nom_methode='Grad';

dessinpoint= false % dit � la fonction FoncObj qu'elle ne doit ni tracer les it�r�s, ni compter ses appels
DessinTest(FoncCout) % tracage des lignes de niveau
x0=(ginput (1))';
plot(x0(1),x0(2),'ok','linewidth',2','markersize',14)
hold on 
dessinpoint= true ;  % � pr�sent, la fonction FoncObj , appel��e dans optimiseur, va tracer et compter (cf les fonctions Ojj)
nb_appel=0;
Tol=1e-2;   %Seuil de convergence
xopt=Optimiseur(FoncCout,x0,Tol,   nom_methode  ) %appel � l'optimiseur

if length(xopt)==2 % si on se trompe dans le nom de m�thode, Optimiseur renvoie xopt=[]
    plot(xopt(1),xopt(2),'Xk','linewidth',2','markersize',14) % une croix sur le point final

  % quelques indications sur la performance
  Grad=Calgrad(FoncCout,xopt);
  fprintf ('m�thode utilis�e:  %s \n', nom_methode)
  fprintf('nombre de pas d''optim si disponible: %u \n', nb_pas_opt)
  fprintf('nombre d''appels � la fonction objectif: %u \n', nb_appel) 
  fprintf('temps calcul CPU: %f  secondes \n',temps_calcul)
  fprintf('Gradient J : %f \n')
  Grad
  fprintf('J(xoptimal) : %f \n',FoncCout(xopt))
  fprintf('coordonn�es de x optimal')
  xopt

end



