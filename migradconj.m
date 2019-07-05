function [x,k, PM] = migradconj(A,b)
% IN:
% A es la matriz nxn simetrica y positiva definida
% b vector nx1
%
% OUT:
% x vector nx1 tal que Ax=b
% k (<= n) es el numero de iteraciones que toma el metodo
% El vector inicial x0 debe ser propuesto dentro del algoritmo
% ---------------------------------------------------------------
PM = [];
[~,n]= size(A);
xk = zeros(n,1);

rk = A*xk - b;
pk = -rk;
k = 0;
PM = [PM, pk];
itermax = 10*n;

while (norm(rk) > 1.e-08 && k < itermax)
    residual = rk'*rk;
    ak = residual/(pk'*A*pk);
    xk = xk + ak*pk;
    rk = A*xk - b;
    bk = rk'*rk / (residual);
    pk = -rk + bk*pk;
    PM = [PM, pk];
    k = k+1;
end
x = xk;
end