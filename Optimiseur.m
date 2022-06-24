function xopt=Optimiseur (foncobj,x0, Tol,methode)

% foncjob: pointeur sur la "fontion objectif" (ou crit�re, ou fonction cout)  � minimiser
% x0 : point de Rn, d�part pour la suite des it�r�s
% Tol : valeur du crit�re de convergence
% methode: chaine de caract�res d�crivant la m�thode
 
global nb_pas_opt temps_calcul % comptage du nombre de pas de la m�thode
global nb_appel  % comptage du nombre d'appel � la fonction (pour les besoins de la m�thode proprement dite, pas pour les dessins)

x=x0;  % x est le point courant
%val0=foncobj(x0);
%Rechlin=@Goldstein;
Rechlin=@Armijo;
ecart=1e10; % pour entrer dans la boucle while une premi�re fois
nb_pas_opt=0;  % on compte les pas de la m�thode d'optim , passage de x_n � x_(n+1)

tic  % d�marrage mesure temps CPU
%----------------------------------------------------------------------------------
if  strcmp(methode,'Nelder Matlab') % Nelder et Mead  de Matlab (Simplexe)
    options=optimset('TolX',Tol);
    xopt=fminsearch(foncobj,x0, options)
%----------------------------------------------------------------------------------
elseif strcmp(methode,'Newton Matlab')  % Quasi-Newton de Matlab
    
    options=optimset('TolX',Tol,'LargeScale','off');
    xopt= fminunc(foncobj,x0, options)
%----------------------------------------------------------------------------------    
elseif  strcmp(methode,'Pas Constant') % gradient � pas constant � programmer par les �l�ves
    rho=0.2; % valeur du "pas", r�glage...� faire
    xk=x0;
    gjx=Calgrad(foncobj,xk)
    xkp=xk-rho*gjx;
    while  norm(xkp-xk)>Tol %condition d'arr�t2: (norm(gjx)>Tol)
        xk=xkp;
        gjx=Calgrad(foncobj,xkp);
        xkp=xkp-rho*gjx;
        nb_pas_opt=nb_pas_opt+1; % comptage du nb de pas d'optim
    end
    xopt=xk;
 

%----------------------------------------------------------------------------------
elseif strcmp(methode,'Grad') % gradient avec recherche lin�aire � programmer par les �l�ves
    xk=x0;
    gjx=Calgrad(foncobj,xk);
    xkp=Armijo(foncobj,xk,foncobj(xk),-gjx,gjx)
    while norm(xkp-xk)>Tol %condition d'arr�t2: (norm(gjx)>eps)
        xk=xkp
        gjx=Calgrad(foncobj,xkp);
        xkp=Armijo(foncobj,xkp,foncobj(xkp),-gjx,gjx)
        nb_pas_opt=nb_pas_opt+1; % comptage du nb de pas d'optim
    end
    xopt=xkp;
    
    
%----------------------------------------------------------------------------------
elseif strcmp(methode,'Grad Conj') % gradient conjugu� Flechter Reeves (ou Polack- Ribi�re) avec recherche lin�aire
                                                    % � programmer par les �l�ves si le temps le permet
  

%----------------------------------------------------------------------------------
elseif strcmp(methode,'Newton') % Newton simple, 
                                              


else % la m�thode n'est pas programm�e ou erreur dans son nom
    fprintf(' Erreur Nom M�thode incorrect')
    xopt=[];
end

temps_calcul=toc;


