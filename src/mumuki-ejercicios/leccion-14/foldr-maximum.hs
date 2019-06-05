{-
Usando la funcion foldr :: (b -> a -> a) -> a -> [b] -> a,
definir la función mejoresNotas, que dada la información de un curso,
devuelve la lista con la mejor nota de cada alumno.
Ejemplo:
Main> mejoresNotas [[8,6,2,4],[7,9,4,5],[6,2,4,2],[9,6,7,10]]
[8,9,6,10]
-}

mejoresNotas :: 
 [[Int]] -> [Int]
 
mejoresNotas =
 foldr (\sublista x-> maximum sublista:x) []