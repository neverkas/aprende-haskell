{-
Definí la función aparearCon (nuestra versión del zipWith), que aparea 
2 listas segun una función.

aparearCon (+) [1,2,3] [4,5,6]
[5,7,9]
 aparearCon (++) ["Hola", "Chau"] ["Homero", "Bart"]
["HolaHomero", "ChauBart"]
-}

aparearCon :: (a->a->a) -> [a] -> [a] -> [a]
aparearCon _ [] _ = []
aparearCon _ _ [] = []
aparearCon funcion (x:xs) (y:ys) = 
  funcion x y : aparearCon funcion xs ys
