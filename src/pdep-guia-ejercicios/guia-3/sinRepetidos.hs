{-
Definir la función sinRepetidos, que me devuelve exactamente eso. P.ej. se espera que
Main> sinRepetidos [1,2,1,3,1,4,2,5,3]
[1,2,3,4,5]
Nota: No importa en qué orden los devuelva.

-}

sinRepetidos :: [Int] -> [Int]
-- si al recorrer la lista queda solo un elemento lo devuelvo
sinRepetidos [] = []
-- si la lista tiene al menos 2 o más elementos la parto en cabeza(x):cola(xs)
sinRepetidos (x:xs)  
-- si el primer elemento ya se encuentra en la cola sigo buscando otros
  | elem x xs = sinRepetidos xs
-- si el elemento no se encuentra en la cola lo devuelvo en una nueva lista
  | otherwise = x : sinRepetidos xs

--sinRepetidos' :: [Int] -> [Int]
sinRepetidos' (x:xs) = foldl (not . elem) x lista