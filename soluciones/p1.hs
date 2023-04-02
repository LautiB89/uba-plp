import Data.IntMap.Merge.Lazy (merge)
--- funcion d mierda
recr :: b -> (a -> [a] -> b -> b) -> [a] -> b
recr z _ [] = z
recr z f (x:xs) = f x xs (recr z f xs)
--- alerta!!!!!!!

-- Ejercicio 4

pitagoricas :: [(Integer, Integer, Integer)]
pitagoricas = [(a, b, c) |
                 c <- [1 .. ],
                 b <- [1 .. c ^ 2],
                 a <- [(floor.sqrt.fromIntegral) (c ^ 2 - b ^ 2)],
                 c^2 - b^2 == a^2]

cribaPorP :: Integral a => a -> [a] -> [a]
cribaPorP p = filter (\x -> x `mod` p /= 0)

nPrimos n = take n (aux [2..])
    where
        aux (x:xs) = x : cribaPorP x (aux xs)

nPrimosNice n = take n (cribar [2..])
    where cribar (x:xs) = x : filter (\y -> y `mod` x /= 0) (cribar xs)

-- Ejercicio 6

partir :: [a] -> [([a], [a])]
partir l = [splitAt i l | i <- [1..(length l)]]
-- podemos usar una funcion que se llama splitUp que hace lo mismo
-- splitAt i l = (take i l, drop i l)

-- Ejercicio 7

listasQueSuman :: Int -> [[Int]]
listasQueSuman 0 = [[]]
listasQueSuman n = [ i:lista | i <- [1..n], lista <- listasQueSuman (n-i)]

-- Ejercicio 8

listasPositivasConSuman = [ l | n <- [1..], l <- listasQueSuman n]

partesDe :: Int -> [[Int]]
partesDe 0 = [[]]
partesDe n = partesDe (n-1) ++ map (++[n]) (partesDe (n-1))

-- Ejercicio 9

mySum :: [Int] -> Int
mySum = sum

myElem :: Eq a => a -> [a] -> Bool
myElem e = foldr (\x rec -> x == e || rec) False

-- le digo join a ++
myJoin1 :: [a] -> [a] -> [a]
myJoin1 = flip (foldr (:))

{- Supongamos que no quiero recibir el caso base como parametro, quiero que sea [] -}

myJoin :: [a] -> [a] -> [a]
myJoin = foldr (\ x rec ys -> x : rec ys) id
-- rec es una funcion :: ([a] -> [a])

{-
myJoin deberia hacer esto
arranca en una lista vacia, le agrega todos lo elementos de ys, despus los de xs
foldr recibe una sola lista, en princpio sería xs
usando foldr y xs devolveriamos una funcion que recibe ys
myJoin [] [2] = id [2] = [2]
myJoin 1:[] [2]
1 : rec [2] = 1 : [2]

-- (a -> b -> b) -> b -> t a -> b
 quiero devolver una funcion ([a] -> [a]) este es mi b 
 (a -> ([a] -> [a]) -> ([a] -> [a])) -> ([a] -> [a]) -> t a -> ([a] -> [a])
 -}

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p = foldr (\x rec -> if p x then x:rec else rec) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:).f) []

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun esMejor = foldr1 (\x rec -> if x `esMejor` rec then x else rec)

sumasParciales1 :: Num a => [a] -> [a]
sumasParciales1 = foldl f []
    where
        f [] x = [x]
        f rec x =  rec ++ [last rec + x]

sumasParciales2 :: Num a => [a] -> [a]
sumasParciales2 = reverse.fst.foldr (\x (rec1, rec2) -> ((x + rec2) : rec1, x + rec2)) ([], 0).reverse

sumasParciales :: Num a => [a] -> [a]
sumasParciales = fst.foldl (\(rec1, rec2) x-> ((x + rec2) : rec1, x + rec2)) ([], 0).reverse

-- ((:).(+).head.flip)

sumaAlt :: Num a => [a] -> a
sumaAlt = foldr (-) 0

sumaAltInverso :: Num a => [a] -> a
sumaAltInverso = foldl (flip (-)) 0
-- es lo mismo que (\rec x -> x - rec)

permutaciones :: [a] -> [[a]]
permutaciones [] = [[]]
permutaciones (x:xs) = concatMap (\perm -> [take i perm ++ (x : drop i perm) | i <- [0.. length xs]]) (permutaciones xs)

-- agarro a todas las permutaciones anteriores y por cada una, 
--  creo una lista que tiene el resultado de agregar al head en cada espacio posible
--    concateno todas las listas (por eso concatMap y no map)


-- Ejercicio 10

partes :: [a] -> [[a]]
partes = foldr (\x rec -> rec ++ map (x:) rec) [[]]

prefijos :: [a] -> [[a]]
prefijos = foldl (\rec x -> rec ++ [last rec ++ [x]]) [[]]
-- [take i l | l <- [entrada], i <- [0.. length l]]

sublistasHorrible :: [a] -> [[a]]
sublistasHorrible xs = []:[drop j (take i xs) | i <- [1..length xs], j <- [0..i-1]]

sublistas :: [a] -> [[a]]
sublistas [] = [[]]
sublistas (x:xs) = sublistas xs ++ [take i (x:xs) | i <- [1..length (x:xs)]]

sublistasRecr :: [a] -> [[a]]
sublistasRecr = recr [[]] (\x xs rec -> rec ++ [take i (x:xs) | i <- [1..length (x:xs)]])

-- otra forma es con recr (podemos ver la long de la cola)
-- rec1 es el resultado final
-- rec2 es la sublista que acabo de generar, (todas las consecutivas que pegado a x)

-- Ejercicio 11

entrelazar :: [a] -> [a] -> [a]
entrelazar [] = id
entrelazar (x:xs) = \ys -> if null ys then x:entrelazar xs [] else x : (head ys:entrelazar xs (tail ys))

entreFoldr :: [a] -> [a] -> [a]
entreFoldr = foldr (\x rec ys -> if null ys then x:rec [] else x: (head ys:rec (tail ys))) id

-- Ejercicio 12
sacarUna :: Eq a => a -> [a] -> [a]
sacarUna e = recr [] (\x xs rec -> if x == e then xs else x:rec)

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e = recr [e] (\x xs rec -> if e <= x then e : (x : xs) else x:rec)

{- 
Todavia no se que poner, estaba tratanto de recrearlo usando recursion primitiva
la idea es que a cada numero i en [1..n) le aplico listasQueSuman
y le agrego (n-i) al ppio de cada lista, para despues concatenar todas
...
AHI ESTA
es exactamente lo que dije, no solo estoy queriendo acceder a listasQueSuman (n-1) (el paso recursivo)
Sino que estoy queriendo acceder a todos los pasos recursivos (recursion global) para listasQueSuman (1..n)
 -}

-- Ejercicio 13

type DivideConquer a b = (a -> Bool) -- determina si es o no el caso trivial
                    -> (a -> b)      -- resuelve el caso trivial
                    -> (a -> [a])    -- parte el problema en sub-problemas
                    -> ([b] -> b)    -- combina resultados
                    -> a             -- estructura de entrada
                    -> b             -- resultado

dc :: DivideConquer a b
dc trivial solve split combine x
        | trivial x = solve x
        | otherwise = combine (map dcRec (split x))
            where dcRec = dc trivial solve split combine

mergeSort :: Ord a => [a] -> [a]
mergeSort = dc trivial solve split combine
    where
        trivial l = length l == 1
        solve = id
        split l = (\(x, y) -> [x,y]) $ splitAt (length l `div` 2) l
        combine [x:xs,y:ys] = if x < y then x : combine [xs,y:ys] else y : combine [x:xs,ys]
        combine l = concat l
dcMap :: (a -> b) -> [a] -> [b]
dcMap f = dc ((1==).length) ((:[]).f.head) (\l -> [take (length l `div` 2) l, drop (length l `div` 2) l]) concat

dcMapLindo :: (a -> b) -> [a] -> [b]
dcMapLindo f = dc trivial solve split combine
    where
        trivial l = length l == 1
        solve [x] = [f x]
        split l = (\(x, y) -> [x,y]) $ splitAt (length l `div` 2) l
        combine = concat

