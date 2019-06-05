{-
    La funcion "!!" agarra el elemento n
    Ej.:
    >[2,3,5] !! 2
     5

-}

-- voy a hacer la funcion "!!" con otro nombre, para probar recursividad

-- PASO BASE: mientras no llegues a la posición
tomarN (x:_) 0 = x
tomarN (_:xs) n = tomarN xs (n-1)

{-

    >tomarN [2,3,4] 2 -- [2,3,4] !! 2
     4

     [2,3,4], n=2, xs=[3,4]
     (2:[3,4]), n=1, xs=[4]
     (2:(3:(4:[0]))), n=0, x=4, xs=[]

    1. Pasa por "tomarN (x:_) 0 = x"
        -como el 2do argumento es 2 y no cero, salteo la condición
    2.  Pasa por "tomarN (_:xs) n = tomarN xs (n-1)"
    2.1.Agarra dos argumentos
        el 1er argumento, la cola de [2,3,4] que es [3,4]
        el 2do argumento 2, que es la posición que necesito
    2.2 la función se llama a si misma (recursividad)
        se pasa como 1er argumento la cola [3,4]
        como 2do argumento (2-1) osea 1
    3. Pasa por "tomarN (x:_) 0 = x",
        -Como el segundo parametro es 1 y no 0, saltea la condición
    4.  Pasa por "tomarN (_:xs) n = tomarN xs (n-1)"
    4.1.Agarra dos argumentos
        el 1er argumento es la cola de [3,4] que es [4]
        el 2do argumento es (1-1) osea 0
    5. Pasa por "tomarN (x:_) 0 = x"
        como el 2do argumento es 0, se detiene en esta condicion
        agarra del 1er argumento la cabeza de [4] que es 4, la cola es 0
        porque [4] es lo mismo que (4:[])
        *devuelve la cabeza, el numero 4




-}
