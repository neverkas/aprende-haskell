{-
utilizando expresiones lambda, definí la función intersectar , 
que dada 2 listas de elemento devuelve los elementos comunes a las 2 listas.

Ej.:
Main> intersectar [1, 2, 3, 9] [4, 1, 3, 6]
[1, 3]
-}
intersectar :: Eq a => [a] -> [a] -> [a]
intersectar listaA listaB =
  filter (\a -> elem a listaB) listaA
