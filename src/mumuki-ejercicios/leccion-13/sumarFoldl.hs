{-
Definir la función totalKilosProductos, que dada una lista como la anterior, 
devuelve la cantidad total de kilos de productos.

Ejemplo:
Main>let productos = [("manzana", 50), ("banana", 30), ("naranja", 40), ("papa", 40), ("tomate", 25)]
Main> totalKilosProductos productos
185

# OBSERVACION DE FOLDL  Y FUNCIONES LAMBDAS

Foldl:
    - Recibe como 1er argumento una función, que le aplica
    a la semilla y al 1er elemento de la lista
    - Recibe como 2do argumento la semilla, que es uno de los
    dos argumentos que usa foldl para aplicar una función (primer argumento),
    OBSERVACION: "Foldl" devuelve un tipo del mismo que el de la semilla,
    si la semilla es Int, devolverá Int, si es una Tupla, devolverá una tupla.
    - Recibe como 3er argumento una lista, que serán sus elementos
    el otro argumento que usará el foldl para aplicar una función (1er argumento)

Lambdas:
    - Los argumentos que se reciben se separan por espacio, igual que con las funciones
    Ej.
    (\argumento1 argumento2 -> funcion argumento1 argumento2)
    - Cuando se usa con el Foldl los argumentos que recibe son
    (\semilla primerElementoDeLaLista -> unaFuncion semilla primerElementoDeLaLista)
    El primer argumento es la semilla (que será el tipo que devolverá el foldl)
    El segundo argumento seran todos los elementos de la lista,
    aunque primero recibirá el primer elemento de la lista
    Entonces hace  
        funcion semilla primerElementoDeLaLista
        (el resultado de eso lo llamaremos resultado1)
        funcion resultado1 segundoElementoDeLaLista
        (el resultado de eso lo llamaremos resultado2)
        funcion resultado2 tercerElementoDeLaLista
        ... y asi hasta el ultimo elemento de la lista
    Por lo tanto el primer ciclo de recursividad a la función le pasa como argumentos,
    la semilla y el primer elemento de la lista, que devuelve un resultado.
    El segundo ciclo de recursividad le pasa a la función como argumentos,
    el resultado anterior y el segundo elemento de la lista.
    Y asi hasta que la lista no tenga mas elementos
    

-}
totalKilosProductos ::
  [(String, Int)] -> Int
  
totalKilosProductos = 
  foldl (\n (_,kilos) -> n + kilos) 0

