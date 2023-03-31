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

partir :: [a] -> ([a], [a])
partir l = [(take i l, drop i l) | i <- [1..(length l)]]