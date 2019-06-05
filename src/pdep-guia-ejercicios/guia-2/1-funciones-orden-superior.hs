-- Funciones de Orden Superior 

{-
1.1. Definir la función existsAny, que dadas una función booleana y una tupla de tres
elementos devuelve True si existe algún elemento de la tupla que haga verdadera la función.
Main> existsAny even (1,3,5)
False

Main> existsAny even (1,4,7)
True
porque even 4 da True
Main> existsAny (0>) (1,-3,7)
True
porque even -3 es negativo 
-}
existsAny :: (Int->Bool) -> (Int, Int, Int) -> Bool
existsAny funcion (a, b, c) = funcion a || funcion b || funcion c

{-
1.2. Definir la función mejor, que recibe dos funciones y un número,
y devuelve el resultado de la función que dé un valor más alto. P.ej.
Main> mejor cuadrado triple 1
3
(pues triple 1 = 3 > 1 = cuadrado 1)
Main> mejor cuadrado triple 5
25
(pues cuadrado 5 = 25 > 15 = triple 5)
Nota: No olvidar la función max. 
-}
mejor :: (Int->Int) -> (Int->Int) -> Int -> Int
mejor funcionA funcionB numero = max (funcionA numero) (funcionB numero)

{-
1.3. Definir la función aplicarPar, que recibe una función y un par, y devuelve el par que
resulta de aplicar la función a los elementos del par. P.ej.
Main> aplicarPar doble (3,12)
(6,24)
Main> aplicarPar even (3,12)
(False, True)

Main> aplicarPar (even . doble) (3,12)
(True, True) 
-}

aplicarPar :: (Int->a) -> (Int,Int) -> (a, a)
aplicarPar funcion (a,b) = (funcion a, funcion b)

{-
1.4. Definir la función parDeFns, que recibe dos funciones y un valor, y devuelve un par
ordenado que es el resultado de aplicar las dos funciones al valor. P.ej.
Main> parDeFns even doble 12
(True, 24) 
-}

parDeFns :: (Int->a) -> (Int->b) -> Int -> (a,b)
parDeFns funcionA funcionB numero = (funcionA numero, funcionB numero)