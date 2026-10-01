function [fun, res]=NewtonDifDiv(x, fx, a)
% x y fx son vectores de numeros
% a es el punto del cual quiero conocer su valor

% Crear la tabla de diferencias divididas
A=zeros(length(x), length(x)+1);

% Llenar la Matriz/Tabla de diferencias
for i=1:length(x)
    A(i,1)=x(i);
    A(i,2)=fx(i);
end

for i=3:length(x)+1
    for j=1:length(x)-i+2
        A(j,i)=(A(j+1,i-1)-A(j,i-1))/(A(j+i-2,1)-A(j,1));
    end
end

A

% Creamos una variable simbolica
syms t;

fun=A(1,2);

for i=1:length(x)-1
    mul=1;
    for j=1:i
        mul=mul*(t-A(j,1));
    end
    fun=fun+mul*A(1,i+2);
end

res=double(subs(fun,t,a));

fun=expand(fun);

end

