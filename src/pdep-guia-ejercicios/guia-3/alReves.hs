{-
Definir la función alVesre, que recibe una lista y devuelve otra con 
los mismos elementos pero en el orden inverso. P.ej. se espera que
-}

alReves :: [a] -> [a]
-- si la lista está vacía entonces devuelvo una vacía
alReves [] = []
-- si la lista tiene al menos 2 o más elementos, partimos la lista en cabeza(x) y cola(xs)
-- como tenemos que devolver la lista al reves, el último elemento será la cabeza
-- recorremos toda la lista 
alReves (x:xs) = alReves xs ++ [x]
