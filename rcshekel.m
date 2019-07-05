clear; clc;
%Script de la función Shekel
%Tomamos el punto inicial x=(3,3,3,3)^T
%Checaremos la norma del gradiente en la última aproximación xk,
%el numero de iteraciones k del metodo, y la aproximación xk

%punto inicial
x0 = [3,3,3,3]';

%region de confianza
[x, k] = regionconf('shekel', x0);
%Cálculo del gradiente en el punto de aproximacion x
[gfx] = gradiente('shekel',x);
%Salida de Resultados
fprintf("Norma del gradiente: %1.9f\nNúmero de iteraciones: %3.0f\n", ...
    norm(gfx), k);
disp("Coordenadas de la aproximación del mínimo local")
fprintf("%f\n", x);