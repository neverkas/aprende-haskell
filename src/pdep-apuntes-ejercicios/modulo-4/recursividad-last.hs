{-
    La función "last",
    -Devuelve el último elemento de una lista
-}

ultimo [x] = x
ultimo (x:xs) = ultimo xs
{-
    ultimo [x] = x
     -Si tiene un elemento lo devuelve

    ultimo (x:xs) = ultimo xs
    - el formato (x:xs) es el patron (cabeza:cola)
    1. recibe una lista que tenga cabeza, cola
    2. la función se llama a si misma (recursividad) y se pasa como parametro la cola
    3. la cola pasa por "ultimo [x] " y devuelve x

    Ej.:
    > ultimo [1,2,3]

    1.  Pasa por "ultimo [x] = x" pero como tiene más de un elemento, pasa el siguiente
    2.  Pasa por "ultimo (x:xs) = ultimo xs"
    2.1 La función se llama a si misma (función recursiva) y se pasa como argumento la cola [2,3]
    3.  Pasa de nuevo por "ultimo [x] = x", pero la lista tiene cabeza y cola, lo saltea
    4.  Pasa por "ultimo (x:xs) = ultimo xs"
    4.1 Separa la cola de la lista [2,3], que es 3
    4.2 La función se llama si misma (funcion recursiva) y pasa como argumento la cola el número 3
    5.  Pasa por "ultimo [x] = x"
    5.1 como la lista sólo tiene un elemento, es decir el ńumero 3, ahora si lo devuelve

-}
