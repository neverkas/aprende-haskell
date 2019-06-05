{-
Escribí la función máximoSegun que dada una función y una lista devuelve 
el elemento de la lista que hace máxima la función.
    >Main maximoSegun id [1,2,3,4,5]
    5
    >Main maximoSegun negate [1,2,3,4,5]
    1
 maximoSegun length ["hola","paradigmas", "como","estas"]
"paradigmas"

Hacelo empleando recursividad
-}
maximoSegun :: (Ord a, Ord b) => (a->b) -> [a] -> a
maximoSegun _ [x] = x
maximoSegun funcion (x:y:xs) 
  | (funcion x) > (funcion y) = x
  | otherwise = maximoSegun funcion xs
  