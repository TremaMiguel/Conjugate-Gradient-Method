function fx = rosenbrock(x)
% función de Rosenbrock de dimesión 2
% función de Rosenbrock: f: R^2 --> R
% cuyo mínimo local es muy difícil de alcanzar por medio
% de los métodos de optimización.
%In:
% x.- vector de longitud 2
%
%Out:
% fx.- número real con el valor de la función.
%  21 de agosto de 2018
%---------------------------------------------

fx = 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
end