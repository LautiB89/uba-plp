%long(+L, -N)
long([], 0).
long([_|XS], Z) :- long(XS, N), Z is N+1.