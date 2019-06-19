{-
Definir una función sinRepetidos usando la función foldr 
de modo que al recibir una lista por parámetro, le quite los repetidos.

Ej.
Main>sinRepetidos [1, 3, 4, 5, 67, 3, 89, 1021, 5]
[1, 4, 67, 3, 89, 1021, 5]
Main>sinRepetidos "hola"
"hola"
Main>sinRepetidos "pdep"
"dep"
Main>sinRepetidos []
[]
-}
seRepite :: Eq a => a -> [a] -> [a]
seRepite elemento semilla
  | elem elemento semilla = semilla
  | otherwise = elemento : semilla
{-
*Esta es la función auxiliar que usará el Foldr
1. Al ser Foldr recibe como 1er argumento un elemento de la lista, 
y como 2do argumento la semilla
2. Si el elemento se encuentra en la lista, entonces sólo devuelve la lista
3. Mientras que sino está en la lista, lo agrega a la nueva lista que devuelve.

*Posibles problemas al plantear la solución:
1. En la guarda que se evalua si el elemento se encuentra en la lista,
si se cumple y se devuelve una lista vacía en vez de la semilla, se perderán 
elementos. 
Al devolver la "semilla" al cumplirse, se mantienen los elementos acumulados.
2. En la guarda que se evalua si el elemento "NO" se encuentra en la lista,
si se cumple al devolver elemento:semilla se está agregando a la nueva lista,
un nuevo elemento. Es decir, aquellos que no estén en la lista, por lo tanto
aquellos que no se repiten.
-}

sinRepetidos :: Eq a => [a] -> [a]
sinRepetidos = foldr (seRepite) [] 
{-
1. Utilizamos aplicación parcial, al no pasar la lista (se pasan menos argumentos de los que se necesitan)
2. Se pasa una función auxiliar en el fold que recibirá dos argumentos,
uno es la semilla y el otro un elemento de la lista
3. Como semilla del Foldl es una lista vacía, por lo tanto la salida del Fold será una lista,
recordemos que una función Fold devuelve algo del mismo tipo que la semilla.
-}