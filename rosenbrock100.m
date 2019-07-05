function fx = rosenbrockd(x)
% funci�n de Rosenbrock de dimesi�n 100
% funci�n de Rosenbrock: f: R^100 --> R
% cuyo m�nimo local es muy dif�cil de alcanzar por medio
% de los m�todos de optimizaci�n.
%In
% x.- vector de longitud 100
%
%Out:
% fx.- n�mero real con el valor de la funci�n.
% Octubre de 2018
%---------------------------------------------

d = length(x);
sum = 0;
for ii = 1:(d-1)
	xi = x(ii);
	xnext = x(ii+1);
	new = 100*(xnext-xi^2)^2 + (xi-1)^2;
	sum = sum + new;
end
fx = sum;
end
