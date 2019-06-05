{-
Definí la función diferencia que recibe dos listas y devuelve los elementos 
de la primera que no están en la segunda.

Ejemplo:
Main > diferencia [1, 2, 3, 9] [1, 3]
[2, 9]
-}

diferencia :: [Int] -> [Int] -> [Int]
diferencia listaA listaB =
  [a|a<-listaA, not $ elem a listaB]
