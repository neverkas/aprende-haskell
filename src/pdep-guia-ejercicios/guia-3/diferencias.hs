{-
Definir la función diferencias recursivamente, que recibe una lista 
de números devuelve la diferencia, en valor absoluto, de cada uno con 
el siguiente, excepto el último que no tiene siguiente.

P.ej. se espera que
Main> diferencias [5,8,3,1,9]
[3,5,2,8].
-}
diferencias :: [Int] -> [Int]
-- 1. caso base
-- 1.1 si queda una lista de un solo elemento devolver una lista vacía
diferencias [x] = []
-- 2. caso recursivo
-- 2.1 parto la lista en cabeza(x):cola(xs)
-- 2.2 al primer 
{-
diferencias (x:xs) =
    abs(x - (head xs)) : diferencias xs
-}
diferencias (x:y:xs) =
    abs(x - y) : diferencias (y:xs)
