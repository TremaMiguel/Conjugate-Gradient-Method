function [H] = hessiana(fname,x)
% Aproximación a la matriz hessiana por diferecencias
% hacia adelante.

%In
% fname .- cadena con el nombre de la funcion.
% x .- vector columna en R^n donde se aproxima la hessiana.
% Out
% H .- matriz simétrica de orden n.
%-----------------------------------------------------

n = length(x);         % dimensión del problema
fx = feval(fname,x);   % función evaluada en x
h = 1.e-06;            % tamaño de paso para las diferencias hacia adelante
H = zeros(n);          % espacio para la matriz hessiana
a = x;                 % copia del vector x
b = x;                 % copia del vector x
%-----------------------------------------------------------
for i = 1:n
     a(i) = a(i) + h;
     fa = feval(fname,a);         % punto y evaluación en dirección i
    for j = 1:i
          b(j) = b(j) + h;
          fb = feval(fname,b);   % punto y evaluación en dirección j
          b(i) = b(i) + h;
          fbb = feval(fname,b); % punto y evaluación en dirección i+j
          H(i,j) = ( -fa + fbb - fb +fx)/ ( h^2); % matriz hessiana.
          H(j,i) = H(i,j);       % simetría
          b(j) = x(j);  b(i) = x(i); %regreso a la copia de x en b
    end
     a(i) = x(i);                % regreso a la copia de x en a.
 end
 
 
 