-- Ejercicio 2

valorAbsoluto :: Float -> Float
valorAbsoluto x | x > 0     = x
                | otherwise = -x

bisiesto :: Int -> Bool
bisiesto n = (mod n 4) == 0

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

esPrimo :: Int -> Bool
esPrimo = esPrimoAux 2
    where 
        esPrimoAux :: Int -> Int -> Bool
        esPrimoAux d n 
                    | d == n    = True
                    | otherwise = mod n d /= 0 && esPrimoAux (d+1) n  

cantDivisoresPrimos2 :: Int -> Int
cantDivisoresPrimos2 1 = 0
cantDivisoresPrimos2 n = length (filter (\x -> esPrimo x && mod n x == 0) [2..n])


cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos 1 = 0
cantDivisoresPrimos n
                | esPrimo n = 1
                | otherwise = 1 + (cantDivisoresPrimos (div n (proxDivPrimo n 2)))
                where proxDivPrimo :: Int -> Int -> Int
                      proxDivPrimo n i
                                | esPrimo i && (mod n i == 0) = i
                                | otherwise                   = proxDivPrimo n (i+1)

-- Ejercicio 3

inverso :: Float -> Maybe Float
inverso 0 = Nothing
inverso x = Just (1 / x)

aEntero :: Either Int Bool -> Int
aEntero (Left a)  = a
aEntero (Right a) | a     = 1
                  | not a = 0


-- Ejercicio 4

limpiar :: String -> String -> String
limpiar _ [] = []
limpiar l (x:xs) | elem x l  = limpiar l xs
                 | otherwise = x : limpiar l xs

difPromedio :: [Float] -> [Float]
difPromedio [] = []
difPromedio l = map (\x -> x - (promedio l)) l

promedio :: [Float] -> Float
promedio l = (sum l) / ((fromIntegral.length) l)

todosIguales :: [Int] -> Bool
todosIguales []     = True
todosIguales (x:xs) | null xs   = True
                    | otherwise = x == (head xs) && todosIguales(xs)

todosIguales2 :: [Int] -> Bool
todosIguales2 [] = True
todosIguales2 (x:xs) = and (map (\y -> x == y) xs)

-- Ejercicio 5

-- a es un tipo parametrico
data AB a = Nil | Bin (AB a) a (AB a)

vacioAB :: AB a -> Bool
vacioAB Nil = True
vacioAB _ = False

negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Bin iz ra de) = Bin (negacionAB iz) (not ra) (negacionAB de)

productoAB :: AB Int -> Int
productoAB Nil = 1
productoAB (Bin iz ra de) = (productoAB iz) * (ra) * (productoAB de)
