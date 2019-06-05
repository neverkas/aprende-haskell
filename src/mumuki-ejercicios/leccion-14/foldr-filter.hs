{-
Usando la función foldr, definir la función filtrar 
que dada una condición y  una lista devuelve la una nueva 
lista sólo con los elementos que cumplen dicha condición.

Main>fitrar even [1,2,3,4,5]
[2,4]
Main>fitrar (>=3) [1,2,3,4,5]
[3,4,5]
-}

cumpleCondicion :: (a->Bool) -> a -> [a] -> [a]
cumpleCondicion f x s
  | f x = x:s
  | otherwise = s
{-
    Recibe como argumentos:
    1. una funcion que recibe 1 argumento y devuelve un booleano
    2. un elemento 'a' que se lo pasaré como argumento al 1er argumento
    3. una lista de elementos 'a' del mismo tipo el el 2do argumento
    
    Tiene como condiciones:
    1. Si se cumple la funcion booleana, si devuelve True devuelve una lista,
    junta un elemento de la lista con la semilla (una lista vacía) []
    2. Sino se cumple solo devuelve la semilla que es una lista vacía []
    
    Actúa como la función recursiva en el foldr
-}

filtrar :: (a->Bool) -> [a] -> [a]
filtrar f = foldr (cumpleCondicion f) []
{-
    1. No es necesario usar lambda en este caso, a la funcion cumpleCondicion
     le estoy pasando por parametro: funcion semilla elemento
    2. Si la funcion se cumple va a devolver una lista, sino solo la semilla,
    es decir una lista vacía que es lo que especifiqué como argumento del foldr
-}