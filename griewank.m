function fx = griewank(x)
% funci�n de Griewank de dimensi�n 2
% funci�n de Griewank f: R^2 --> R
%
%In:
% x.- vector de longitud 2
%
%Out:
% fx.- n�mero real con el valor de la funci�n.
% Octubre de 2018
%---------------------------------------------

dim = length(x);
suma = 0;
producto = 1;
for i=1:dim
    xi = x(i);
    suma = suma + (xi^2)/4000;
    producto = producto*cos(xi/sqrt(i));
end
fx = suma - producto + 1;
end
