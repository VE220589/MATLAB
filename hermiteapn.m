syms x

format long

disp('Método de Hermite')



X = input('Ingrese los valores de x: ');

Y = input('Ingrese los valores de y: ');

D = input('Ingrese los valores de la derivada de y: ');



%f = input('Ingrese la función: ');

%Y = double(subs(f, X));

%D = double(subs(diff(f), X));

aprox = input('Ingrese el valor a aproximar: ');

n = length(X); % Obteniendo el tamaño del vector



% Duplicación de nodos

for i = 0:n-1

Z(2*i+1) = X(i+1);

Z(2*i+2) = X(i+1);

W(2*i+1) = Y(i+1);

W(2*i+2) = Y(i+1);

end



F = zeros(2*n);



% Llenado de la primera columna con valores de f(x)

for i = 1:2*n

F(i, 1) = W(i);

end



% Sustitución de las derivadas en las primeras diferencias divididas

for i = 1:n

F(2*i, 2) = D(i);

end



% Cálculo del resto de las primeras diferencias divididas

for i = 1:n-1

F(2*i+1, 2) = (F(2*i+1, 1) - F(2*i, 1)) / (Z(2*i+1) - Z(2*i));

end



% Cálculo de las diferencias divididas de orden superior

for j = 3:2*n

for i = j:2*n

F(i, j) = (F(i, j-1) - F(i-1, j-1)) / (Z(i) - Z(i-j+1));

end

end



% Mostrar la matriz de diferencias divididas

vpa(F, 9)



% Construcción del polinomio

pol = F(1, 1);

for i = 2:2*n

producto = 1;

for j = 1:i-1

producto = producto * (x - Z(j));

end

pol = pol + F(i, i) * producto;

end



% Resultados

fprintf('Polinomio de Hermite resultante: \n');

pretty(vpa(pol, 9));



valoraprox = subs(pol, aprox);

%valorexacto = subs(f, aprox);

%error = abs(valoraprox - valorexacto);



fprintf('El valor aproximado de la función es: %.15f \n\n', double(valoraprox));

%fprintf('El valor exacto de la función es: %.15f \n\n', double(valorexacto));

%fprintf('Error: %e \n\n', double(error));