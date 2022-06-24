function xopt=Optimiseur (foncobj,x0, Tol,methode)

% foncjob: pointeur sur la "fontion objectif" (ou critère, ou fonction cout)  à minimiser
% x0 : point de Rn, départ pour la suite des itérés
% Tol : valeur du critère de convergence
% methode: chaine de caractères décrivant la méthode
 
global nb_pas_opt temps_calcul % comptage du nombre de pas de la méthode
global nb_appel  % comptage du nombre d'appel à la fonction (pour les besoins de la méthode proprement dite, pas pour les dessins)

x=x0;  % x est le point courant
%val0=foncobj(x0);
%Rechlin=@Goldstein;
Rechlin=@Armijo;
ecart=1e10; % pour entrer dans la boucle while une première fois
nb_pas_opt=0;  % on compte les pas de la méthode d'optim , passage de x_n à x_(n+1)

tic  % démarrage mesure temps CPU
%----------------------------------------------------------------------------------
if  strcmp(methode,'Nelder Matlab') % Nelder et Mead  de Matlab (Simplexe)
    options=optimset('TolX',Tol);
    xopt=fminsearch(foncobj,x0, options)
%----------------------------------------------------------------------------------
elseif strcmp(methode,'Newton Matlab')  % Quasi-Newton de Matlab
    
    options=optimset('TolX',Tol,'LargeScale','off');
    xopt= fminunc(foncobj,x0, options)
%----------------------------------------------------------------------------------    
elseif  strcmp(methode,'Pas Constant') % gradient à pas constant à programmer par les élèves
    rho=0.2; % valeur du "pas", réglage...à faire
    xk=x0;
    gjx=Calgrad(foncobj,xk)
    xkp=xk-rho*gjx;
    while  norm(xkp-xk)>Tol %condition d'arrêt2: (norm(gjx)>Tol)
        xk=xkp;
        gjx=Calgrad(foncobj,xkp);
        xkp=xkp-rho*gjx;
        nb_pas_opt=nb_pas_opt+1; % comptage du nb de pas d'optim
    end
    xopt=xk;
 

%----------------------------------------------------------------------------------
elseif strcmp(methode,'Grad') % gradient avec recherche linéaire à programmer par les élèves
    xk=x0;
    gjx=Calgrad(foncobj,xk);
    xkp=Armijo(foncobj,xk,foncobj(xk),-gjx,gjx)
    while norm(xkp-xk)>Tol %condition d'arrêt2: (norm(gjx)>eps)
        xk=xkp
        gjx=Calgrad(foncobj,xkp);
        xkp=Armijo(foncobj,xkp,foncobj(xkp),-gjx,gjx)
        nb_pas_opt=nb_pas_opt+1; % comptage du nb de pas d'optim
    end
    xopt=xkp;
    
    
%----------------------------------------------------------------------------------
elseif strcmp(methode,'Grad Conj') % gradient conjugué Flechter Reeves (ou Polack- Ribière) avec recherche linéaire
                                                    % à programmer par les élèves si le temps le permet
  

%----------------------------------------------------------------------------------
elseif strcmp(methode,'Newton') % Newton simple, 
                                              


else % la méthode n'est pas programmée ou erreur dans son nom
    fprintf(' Erreur Nom Méthode incorrect')
    xopt=[];
end

temps_calcul=toc;


