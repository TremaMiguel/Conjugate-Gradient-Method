clear; clc;
%Script de la funci�n Griewank
%Tomamos el punto inicial x=(1,1)^T
%Checaremos la norma del gradiente en la �ltima aproximaci�n xk,
%el numero de iteraciones k del metodo, y la aproximaci�n xk

%punto inicial
x0 = [1, 1]';

%region de confianza
[x, k] = regionconf('griewank', x0);
%C�lculo del gradiente en el punto de aproximacion x
[gfx] = gradiente('griewank',x);
%Salida de Resultados
fprintf("Norma del gradiente: %1.9f\nN�mero de iteraciones: %3.0f\n", ...
    norm(gfx), k);
disp("Coordenadas de la aproximaci�n del m�nimo local")
fprintf("%f\n", x);