function xok=Armijo(FoncObj,x0,Jx0,d0,Grad)
% recherche monodim par une méthode d'Armijo avec rebroussement
% x0 point d'où part la recherche
% Jx0: valeur de J en x0
% d0: direction de recherche, qui n'est pas -Grad dans le cas du gradient
% conjugué
% Grad: Gradient de J en x0, deja calculé et coute cher, donc on le fait passer 

% xok: retourne le point choisi comme ayant réalisé une descente sufisante
% ici on diminue le premier pas et la pente quand on s'approche de la solution*
%( multiplication par norm(Grad))

% 3 parametres reglables

epsi=0.5;    % parametre de réglage de la pente (pourcentage d la pente)
alpha0=0.2;   % Taille du premier pas 
beta=1.5;      % parametre  iterations sur la droite de descente

%d0=d0/norm(d0);% vecteur unitaire de la droite de descente
pente=epsi*Grad'*d0; % pente avec def vecteur unitaire d0
stop=0;
ncoups=0;
ncoupsmax=10;  % un garde fou
isens=1;
 while and(stop==0,ncoups<ncoupsmax)
     ncoups=ncoups+1;
     puissance=isens*(ncoups-1);% positif ou negatif suivant le sens du déplacement après le premier coup
     alpha=alpha0*(beta^puissance);
     x(:,ncoups)=x0+alpha*d0; % 
     dessous=FoncObj(x(:,ncoups))-(Jx0+alpha*pente);% si dessous <0 , J est sous la droite, on est dans la bonne zone
   if and(ncoups==1, dessous>0)
     isens=-1;
   end
   if and (isens==1, dessous>0)
       stop=1;
       xok=x(:,ncoups-1);
   elseif and(isens==-1 , dessous<0)
          stop=1;
          xok=x(:,ncoups);
   end
%    ncoups
%    pause
 end
 if ncoups==ncoupsmax  % si on a touché le garde fou
     xok=x(:,ncoups);       % on prend le dernier calculé
 end
 