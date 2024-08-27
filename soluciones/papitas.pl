% Devolver los elementos que mas aparecen en una lista
% tiene que instanciar todas las soluciones en cualq orden

cantAps([], _, 0).
cantAps([X | LS], X, Cant) :- cantAps(LS, X, Cant2), Cant is Cant2 + 1.  
cantAps([Y | LS], X, Cant) :- Y \= X, cantAps(LS, X, Cant).

existeUnoMasVeces(L, X) :- member(Y, L), cantAps(L, X, CantX), cantAps(L, Y, CantY), CantX < CantY.
maxCantAps(L, X) :- member(X, L), not(existeUnoMasVeces(L, X)).

desde(X,X).
desde(X,Y) :- Z is X+1, desde(Z,Y). 

coprimos(X, Y) :- desde(1, X), between(1, X, Y), gcd(X, Y) =:= 1.

permutacion([], []).
permutacion([X | XS], L2) :- permutacion(XS, L3), append(A, B, L3), append(A, [X | B], L2). 

partes([], []).
partes([X | XS], [X | L]) :- partes(XS, L).
partes([_ | XS], L) :- partes(XS, L).

partesQueSuman(L, S, P) :- partes(L, P), sum_list(P, S).