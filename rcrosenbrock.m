clear; clc;
%Script para la funcion Rosenbrock de dimension 2
%Tomamos el punto inicial x=(2,3)^T
%Checaremos la norma del gradiente en la última aproximación xk,
%el numero de iteraciones k del metodo, y la aproximación xk

%punto inicial
x0 = [2, 3]';

%Region de Confianza
[x, k] = regionconf('rosenbrock', x0);
%Cálculo del gradiente en el punto de aproximacion x
[gfx] = gradiente('rosenbrock', x);
%Salida de Resultados
fprintf("Norma del gradiente: %1.9f\nNúmero de iteraciones: %3.0f\n", ...
    norm(gfx), k);
disp("Coordenadas de la aproximación del mínimo local")
fprintf("%f\n", x);