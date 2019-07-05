function fx = shekel(x)
% función de Shekel de dimensión 4
% función de Shekel f: R^4 --> R
%
%In:
% x.- vector de longitud 4
%
%Out:
% fx.- número real con el valor de la función.
% Octubre de 2018
%---------------------------------------------

m = 10;
c1 = [4 1 8 6];
c2 = [3 2 5 8 6 7];
c3 = [7 9 3 1 2 3.6];
a = [c1, c2;c1, c3;c1, c2;c1, c3]; 
c = 0.1*[1 2 2 4 4 6 3 7 5 5]';

s = 0;
for i = 1:m
   p = sum((x - a(:,i)).^2);
   s = s + 1/(p + c(i));
end
fx = -s;
end
