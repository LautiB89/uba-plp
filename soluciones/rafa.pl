camino(bin(nil,R,nil),[R]).
camino(bin(I, R, _), [R|C]) :- camino(I, C).
camino(bin(_, R, D), [R|C]) :- camino(D, C).
