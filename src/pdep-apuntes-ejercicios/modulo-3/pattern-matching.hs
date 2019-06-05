{-
    Pattern Matchin en listas

    (x:xs)
        -x es la cabeza
        -xs es la cola

    Observaciones:
        -La cabeza de una lista es el primer elemento, la cola los que le siguen.
        -La cola puede tener también cabeza, y cola, y asi..
        **Si la lista tiene 1 elemento, la cabeza será ese, y la cola estará vacia

    -La lista: [1,2,3,4] se puede escribir de dif maneras:
    a) (1:[2,3,4])
        la cabeza es 1, la cola [2,3,4]

    b) (1:(2:[3,4]))
        [1,2,3,4]
        1. la cabeza de [1,2,3,4] es 1
        2. la cola es [2,3,4]

        3. la cabeza de [2,3,4] es 2 
        4. la cola es [3,4]

    c) (1:(2:(3:[4])))
        1. la cabeza de [1,2,3,4] es 1
        2. la cola es [2,3,4]

        3. la cabeza de [2,3,4] es 2
        4. la cola es [3,4] 

    d) (1:(2:(3:(4:[]))))
        1. la cabeza de [1,2,3,4] es 1
        2. la cola es [2,3,4]

        3. la cabeza de [2,3,4] es 2
        4. la cola es [3,4]

        5. la cabeza de [3,4] es 3
        6. la cola es 4

        7. la cabeza de [4] es 4
        8. la cola es [] osea vacío


-}

numeros = [[1,1,1,1], [2,2,2], [3,3,3]]

listaCabeza (x:xs) = x -- devuelve el primer elemento
listaCabezaB (x:_) = x

listaCola (x:xs) = xs 
listaColaB (_:xs) = xs -- se puede usar el guión bajo si no importa ese parámetro

lista (x) = x -- devuelve toda la lista



main = do 
    print(listaCabeza numeros)
    print(listaCola numeros)
    print(lista numeros)
