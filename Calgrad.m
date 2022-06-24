function Grad=Calgrad(J,x)
% calcul le gradient numérique de la fonction J
% J contient un pointeur sur la fonction dont on cherche le gradient
% x est le point où on veut le gradient
% renvoie un vecteur Grad colonne

eps=1e-5;
n=length(x);
Grad=zeros(n,1);
for i=1:n
    xd=x;
    xd(i)=x(i)+eps;
    Grad(i)=((J(xd)-J(x))/eps);
end
end