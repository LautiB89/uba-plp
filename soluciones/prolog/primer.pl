% Ejercicio 1
padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).

abuelo(X, Y) :- padre(X, Z), padre(Z, Y).
hijo(X, Y) :- padre(Y, X).

% Necesito poner el \= después xq primero busco los que son hijos del mismo padre
% después digo que son hermanos sii son distintos (ahi quiero cortar la rama).
% Si pongo primero el \= da siempre false xq necesita algun universo para usar ???
hermano(X, Y) :- hijo(X, Z), hijo(Y, Z), X \= Y.

descendiente(X, Y) :- hijo(X, Y).
descendiente(X, Y) :- hijo(X, Z), descendiente(Z, Y).

% No entiendo CONSULTAR
ancestro(X, X).
ancestro(X, Y) :- padre(X, Z), ancestro(Z, Y).

% Ejercicio 2





















% Ejercicio 6
% aplanar(+Xs, -Ys)
aplanar([], []).
aplanar([X | XS], [X | YS]) :- X \= [], X \= [_|_], aplanar(XS, YS).
aplanar([X | XS], Y)        :- aplanar(X, A), aplanar(XS, B), append(A, B, Y).

% Ejercicio 8
%interseccion(+L1, +L2, -L3)
interseccion([], _, []).
interseccion([X | XS], Y, [X | ZS]) :- member(X, Y), interseccion(XS, Y, ZS).
interseccion([X | XS], Y, ZS) :- not(member(X, Y)), interseccion(XS, Y, ZS).
