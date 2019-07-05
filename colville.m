function fx = colville(x)
% funci�n de Colville de dimensi�n 4
% funci�n de Colville f: R^4 --> R
%
%In
% x.- vector de longitud 4
%
%Out:
% fx.- n�mero real con el valor de la funci�n.
% Octubre de 2018
%---------------------------------------------

x1 = x(1);x2=x(2);x3=x(3);x4=x(4);
fx = 100*(x1^2-x2)^2 + (x1-1)^2+(x3-1)^2 + 90*(x3^2-x4)^2 ...
+ 10.1*((x2-1)^2 + (x4-1)^2) + 19.8*(x2-1)*(x4-1);
end