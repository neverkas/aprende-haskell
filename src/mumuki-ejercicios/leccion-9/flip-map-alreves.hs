-- ($) even 2 es lo mismo que even $ 2
--map :: (a->b) -> [a] -> [b]
--map (even) [1,2,3,4]
--map (*2) [1,2,3,4]

pam :: [(a->b)] -> a -> [b]
pam listaFunciones valor = flip map listaFunciones ($ valor)
{-
@tipado
1. La salida va a ser una lista ej. [b]
2. Recibe dos argumentos una lista de funciones, y un valor
3. La entrada de la función del 1er argumento será el mismo que el tipo del segundo argumento (porque es lo que pide el enunciado).
4. La salida de la función del 1er argumento, será el mismo tipo que la función "pam". La función "pam" devolverá esa salida pero en una lista. 

@definicion
1. Recibe dos argumentos, una lista de funciones y un valor
2. Utilizo "map" para recorrer la lista de funciones, y le asigno un argumento con la función ($).
Observación 1: Por defecto "map" recibe como 1er argumento la función y luego la lista donde se aplicará. En este caso uso la función "flip" para que sea al reves el orden de los argumentos.
Observación 2: La función ($) me permite pasarle un argumento a una función (aunque nose que diferencia hay de pasarlo)
-}