{-
    la función "take" devuelve los primeros "n" elementos
    Ej.
    > take 2 [3,4,5,6] -- una lista simple
     [3,4]
    
     > take 3 [[1,1], [3,3], [5,5], [7,7]] -- lista de listas
     [[1,1], [3,3], [5,5]] -- devuelve las primeras 3 listas de la lista

    > take 2 "hola" -- los String son una lista de caracteres
    "ho"
-}
-- creo una función recursiva que hace lo mismo que "take"
listaA = [3,4,5]

-- PASO BASE (las dos primeras)
    --se detiene cuando n <= 0
    -- o cuando la lista está vacía
-- FUNCION RECURSIVA (la última)
    --devuelve la cabeza de la lista (primer elemento), y se llama a si misma
    --se llama a si misma mientras n > 0
primerosN n _ | n <=0  = [] -- 1. si la cantidad de elementos es menor o igual a cero, devuelvo una lista vacía
primerosN _ []         = [] -- 2. si la lista está vacía, devuelvo una lista vacía
primerosN n (x:xs)     =  x : primerosN (n -1) xs --  3 .si la lista tiene n > 0, y tiene cabeza y cola

{-
    > primerosN 2 [1,2,3]
    1. evalua las dos primeras condiciones, pero no cumplen y va a la 3ra condición
    2. la 3ra condicion devuelve la cabeza de [1,2,3], que es 1, y se llama a si misma, pasando por parametro "1 [2,3]"
    ** n quedó en 1 y [2,3] es la cola de [1,2,3]
    3. evalua de nuevo las dos primeras condiciones, pero no cumplen y va a la tercera de nuevo
    4. la 3ra condicion devuelve la cabeza de [2,3] que es 2, se llama a si misma pasando como argumentos "0 [3]"
    ** n quedó en cero, y quedó solo el 3 como único elemento, 
    5. evalua la primera condición y termina ahí

    la lista es [3,4,5]
    > take 2 [3,4,5]
     [3,4]

    1. Pasa por "primerosN n _ | n <= 0 = []"
        1. el argumento 'n' es mayor a 0, entonces lo salteo
    2. Pasa por "primerosN _ [] = []"
        1. el argumento de la lista no está vacía, entonces lo salteo
    3. Pasa por "primerosN n (x:xs) =  x : take (n -1) xs"
        1. el argumento 'n' es mayor a cero, y la lista tiene formato (x:xs) cabeza:cola
        2. la función se llama a si misma (función recursiva),
            pasa como 1er argumento: n-1 (decrementa 'n')
            pasa como 2do argumento: xs, que es la cola
            
            1. 

         
        3. 
-}
