function [x, k] = regionconf(fname, x0)
% M�todo de regi�n de confiaza.
%
% Utiliza la tecnica del Doblez para aproximar la soluci�n del subproblema:
% min: p'*B_k*p/2 + g_k'*p + f_k (_mc(p))
% s.a: norm(p) < delta
% donde B_k = Hessiana(x_k) + mu*I (I la matriz identidad), 
% g_k = gradiente(x_k) != 0 y f_k = f(x_k). mu se escoge para que B_k sea
% positiva definida. delta > 0 constante.
%
% Se utiliza una funci�n (ajusteMc) para modificar la matriz B para hacerla
% positiva definida en caso de no serlo. Adem�s se utiliza la funci�n
% Doblez programada en clase y las funciones Hessiana y grandiente
% provistas por el profesor.
%
% In:
%   fname.- cadena de caracteres de la funci�n f.
%   x0.- vector columna de dimensi�n n tal que el gradiente(x0) != 0.
%
% Out:
%   x.- vector columna de dimensi�n n con la aproximaci�n del m�nimo.
%   k.- n�mero de iteraciones del m�todo.
%
%--------------------------------------------------------------------------
% Definici�n e inicializaci�n de variables

delta = 1;
k = 0;
maxiter = 100;
tol = 1.e-05;
g = gradiente(fname, x0);
B = hessiana(fname, x0);
pk = Doblez(B, g, delta); %Aproximaci�n del subproblema
x = x0;

%--------------------------------------------------------------------------
% Parte iterativa

while(norm(g) > tol && k < maxiter && norm(pk) > tol)
    B = ajusteMc(hessiana(fname, x));%C�lculo de la Hessiana
    f = feval(fname, x);%C�lculo de la funci�n en el x actual
    pk = Doblez(B, g, delta); %Aproximaci�n del subproblema
    fpk = feval(fname, x + pk); %f evaluada en x + pk.
    mc = pk'*B*pk/2 + g'*pk + f; %Definici�n del modelo cuadr�tico en pk
    r = (f - fpk)/(f - mc);
    if r < 1/4
        delta  = max(norm(pk)/4, 1.e-04);
    else
        x = x + pk;
        if r > 3/4 && norm(pk) == delta
            delta = min(2*delta, 10);
        end
    end
    k = k + 1;
    g = gradiente(fname, x); %C�lculo del gradiente
end
end

function f = ajusteMc(B)
% Funci�n que modifica la matriz B_k para que sea positiva definida en caso
% de no serlo.
%
% In:
%   B.- Matriz de nxn.
%   
% Out:
%   f.- Matriz de nxn positiva definida obtenida a partir de B.
%
%--------------------------------------------------------------------------

lmin = eig(B); llmin = min(lmin);
if (llmin <= 0)
   f = B + (-llmin + 1)*eye(length(lmin));
else
    f = B;
end
end