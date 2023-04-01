-- Ejercicio 4

pitagoricas :: [(Integer, Integer, Integer)]
pitagoricas = [(a, b, c) |
                 c <- [1 .. ],
                 b <- [1 .. c ^ 2],
                 a <- [(floor.sqrt.fromIntegral) (c ^ 2 - b ^ 2)],
                 c^2 - b^2 == (a^2)]

cribaPorP :: Integral a => a -> [a] -> [a]
cribaPorP p = filter (\x -> x `mod` p /= 0)

nPrimos n = take n (aux [2..])
    where
        aux (x:xs) = x : cribaPorP x (aux xs)

nPrimosNice n = take n (cribar [2..])
    where cribar (x:xs) = x : filter (\y -> y `mod` x /= 0) (cribar xs)

-- Ejercicio 6

partir :: [a] -> [([a], [a])]
partir l = [(take i l, drop i l) | i <- [1..(length l)]]
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
mySum = foldr (+) 0

myElem :: Eq a => a -> [a] -> Bool
myElem e = foldr (\x rec -> x == e || rec) False

-- le digo join a ++
myJoin1 :: [a] -> [a] -> [a]
myJoin1 = flip (foldr (:)) 

{- Supongamos que no quiero recibir el caso base como parametro, quiero que sea [] -}

myJoin :: [a] -> [a] -> [a]
myJoin = foldr (\x:xs) (const [])
    where f 

{-
-- (a -> b -> b) -> b -> t a -> b
 quiero devolver una funcion ([a] -> [a]) este es mi b 
 (a -> ([a] -> [a]) -> ([a] -> [a])) -> ([a] -> [a]) -> t a -> ([a] -> [a])
 -}