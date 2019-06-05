{-
Listas - Patrones / Pattern Matching
    -Conceptos de "Pattern Matching" (patrones) en "Listas"

    []
        significa que la lista está vacía
        Ej.: funcion [] = "vacia"
    [x]
        significa que solo tiene un elemento la lista
        Ej.
        funcionA [x] = x -- va a devolver x
        funcionB (x:xs) = xs
    (x:xs)
        x: se refiere a la cabeza, primer elemento de la lista
        xs: se refiere a la cola, los elementos que le siguen a la cabeza
        Ej.:
        funcionA (x:xs) = x -- devuelve la cabeza / primer elemento de la lista
        funcionB (x:xs) = xs -- devuelve la cola (elementos que le sigan a la cabeza)
        funcionC (x:xs) = funcionC


    Creare una funcion "longitud" que cumplira lo mismo que "length",
    para probar como funciona la recursividad
-}
longitud [] = 0 -- si la lista está vacía retorná cero
longitud (x:xs) = 1 + longitud xs -- recursividad

suma [] = 0  -- si la lista está vacía retorná cero
suma (x:xs) = x + suma xs -- funcion recursiva, se llama a si misma

--main = do 
    --print()