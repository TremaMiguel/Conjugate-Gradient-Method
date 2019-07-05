clear; clc;
%Script para la funcion Rosenbrock de dimension 100
%Tomamos el punto inicial x=3*ones(100,1)
%Checaremos la norma del gradiente en la última aproximación xk,
%el numero de iteraciones k del metodo, y la aproximación xk

%punto inicial
x0 = 3*ones(100, 1);

%Region de Confianza
[x, k] = regionconf('rosenbrock100', x0);
%Cálculo del gradiente en el punto de aproximacion x
[gfx] = gradiente('rosenbrock100', x);
%Salida de Resultados
fprintf("Norma del gradiente: %1.9f\nNúmero de iteraciones: %3.0f\n", ...
    norm(gfx), k);
disp("Coordenadas de la aproximación del mínimo local")
fprintf("%f\n", x);