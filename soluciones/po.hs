
mySum :: [Int] -> Int
mySum = foldr (\x rec -> x + rec) 0

myElem :: Eq a => a -> [a] -> Bool
myElem e = foldr (\x rec -> x == e || rec) False

-- le digo join a ++
myJoin1 :: [a] -> [a] -> [a]
myJoin1 = flip (foldr (:))

{- Supongamos que no quiero recibir el caso base como parametro, quiero que sea [] -}

miConcat xs ys = (foldr (\x rec -> x : rec) ys) xs

myJoin :: [a] -> [a] -> [a]
myJoin = foldr (\ x rec -> \ys -> x : rec ys) id

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p = foldr (\x rec -> if p x then x:rec else rec) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:).f) []
