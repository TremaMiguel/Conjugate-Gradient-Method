function fx = rosenbrockd(x)
% función de Rosenbrock de dimesión 100
% función de Rosenbrock: f: R^100 --> R
% cuyo mínimo local es muy difícil de alcanzar por medio
% de los métodos de optimización.
%In
% x.- vector de longitud 100
%
%Out:
% fx.- número real con el valor de la función.
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
