{-
interseccion [1,2,6] [2] == [2]
interseccion [2,8,9] [9,2,42] == [2,9]
-}

interseccion :: Eq a => [a] -> [a] -> [a]
interseccion [] _ = []
interseccion (x:xs) lista 
    | elem x lista = x : interseccion xs lista
    | otherwise = interseccion xs lista
