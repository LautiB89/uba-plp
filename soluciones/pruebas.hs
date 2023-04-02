comp :: (b -> c) -> (a -> b) -> a -> c
comp f g x = f (g x)

flip :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
flip f x y = f y x

aplicar :: (a -> b) -> a -> b
aplicar f = f

esta :: Eq a => a -> [a] -> Bool
esta n = foldr (\x rec -> x == n || rec) False
-- Es important que sea en este orden, para que haya 'cortocircuito'
--   Si no, se meteria siempre en rec primero (colgandose siempre)

sumaAlt :: Num a => [a] -> a
sumaAlt = foldr (-) 0

zipear :: [a] -> [b] -> [(a,b)]
zipear = foldr f (const [])
    where f x rec ys = if null ys then [] else (x, head ys) : rec (tail ys)

zipa :: [a] -> [b] -> [(a,b)]
zipa [] = const []
zipa (x:xs) = \ys -> if null ys then [] else (x, head ys) : zipa xs (tail ys)

-- Recrear take n lista, que da los primeros n elementos con foldr
-- Podemos hacer la recursion sobre la lista o hacerlo sobre n


data Polinomio a = X
    | Cte a
    | Suma (Polinomio a) (Polinomio a)
    | Prod (Polinomio a) (Polinomio a)

evaluar :: Num a => a -> Polinomio a -> a
evaluar y (Cte n) = n
evaluar y X = y
evaluar y (Suma p1 p2) = evaluar y p1 + evaluar y p2
evaluar y (Prod p1 p2) = evaluar y p1 * evaluar y p2

foldPoli :: b -> (a -> b) -> (b -> b -> b) -> (b -> b -> b) -> Polinomio a -> b
foldPoli casoX casoCte casoSuma casoProd pol = case pol of
    X -> casoX
    Cte c -> casoCte c
    Suma p1 p2 -> casoSuma (rec p1) (rec p2)
    Prod p1 p2 -> casoProd (rec p1) (rec p2)
    where rec = foldPoli casoX casoCte casoSuma casoProd

data Rosetree a = Rose a [Rosetree a]

foldRT :: (a -> [b] -> b) -> Rosetree a -> b
foldRT f (Rose r l) = f r (map (foldRT f) l)
-- foldRT f (Rose r l) = f r [foldRT f h | h <- l]
-- foldRT f (Rose r l) = f r (foldr ((:).foldRT f) [] l)

hojas :: Rosetree a -> [a]
hojas = foldRT (\x recs -> if null recs then [x] else concat recs)

ramas :: Rosetree a -> [[a]]
ramas = foldRT (\x recs -> if null recs then [[x]] else map (x:) (concat recs))
-- ver que la funcion tiene tipado (a -> [b] -> b)
-- con b = [[a]] (queremos que devuelva eso, no nos queda otra)
-- entonces recibe a y [[[b]]]
-- son los caminos a las hojas de los demas subarboles

type Conj a = (a->Bool)
vacio :: Conj a
vacio = const False

agregar :: Eq a => a -> Conj a -> Conj a
agregar e c y = c y || (y == e)

interseccion :: Conj a -> Conj a -> Conj a
interseccion c d y = c y && d y

union :: Conj a -> Conj a -> Conj a
union c1 c2 y = c1 y || c2 y

-- No podemos definir un map a menos que:
-- para map f,  sea inversible: map f C x = C (f⁻¹ x)
-- o bien el conjunto sea finito (conocido)

recr :: b -> (a -> [a] -> b -> b) -> [a] -> b
recr z _ [] = z
recr z f (x:xs) = f x xs (recr z f xs)

soloPuntosFijosEnN :: Int -> [Int -> Int] -> [Int -> Int]
soloPuntosFijosEnN n = filter ((n==).($ n))
-- es la misma condicion que (\f -> n == f n)