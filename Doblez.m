function [ps] = Doblez(B, g, d)
% Método del Doblez para solucionar el problema:
% min: p'*B_k*p/2 + g_k'*p + f_k (_mc(p))
% s.a: norm(p) < delta
% donde B_k = Hessiana(x_k), g_k = gradiente(x_k) != 0 y f_k = f(x_k). 
% delta > 0 constante.
%
% In:
%   B.- matriz nxn positiva definida.
%   g.- vector columna de dimensión n.
%   d.- constante positiva.
%
% Out:
%   ps.- vector columna de dimensión n que aproxima la solución del
%   subproblema cuadrático.
%--------------------------------------------------------------------------

pn = -migradconj(B,g);
if norm(pn)<=d
    ps = pn;
else
    pc = -(g'*g/(g'*B*g))*g;
    normapc = norm(pc);
    if normapc>=d
        ps = -d*g/norm(g);
    else
        v = pn-pc;
        a = norm(v)^2;
        b = 2 * pc'*v;
        c = pc'*pc - d^2;
        disc = sqrt(b^2 - 4*a*c);
        s1 = (-b + disc) / (2*a);
        s2 = (-b - disc) / (2*a);
        if((0 <= s1) && (s1 <= 1))
            ps = pc + s1*v;
        else
            ps = pc + s2*v;
        end
    end
end