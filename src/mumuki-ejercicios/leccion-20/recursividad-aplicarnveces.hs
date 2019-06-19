{-
Definir y explicitar el tipo de una función aplicarNVeces que dado un número entero,
una función y un valor, retorne el resultado de aplicar esa función tantas veces
como se indique sobre el valor indicado.
Definir esta función usando recursividad. No hace falta considerar qué sucedería 
con los números negativos.

Ej.
Main>aplicarNVeces 4 (*2) 2
32

Main>aplicarNVeces 3 not True
False

Main>aplicarNVeces 0 (*2) 2
2
-}
aplicarNVeces :: Int -> (a->a) -> a -> a
aplicarNVeces 0 f x = x
aplicarNVeces n f x = 
 aplicarNVeces (n-1) f (f x)
{-
# Posibles problemas al plantear la solución:
1. En el caso recursivo pasar como 3er argumento "x", cuando en realidad deberia ser "(f x)" ya que es aplicar la función "f" al valor "x"
2. En el caso base asignarle "f x" aplicando la función una vez extra, sabiendo que por cada llamado recursivo ya se está aplicando. Por lo tanto se debería asignar "x" al caso base.
3. En el caso recursivo el 1er argumento pasarle "n" en vez de "n-1". Recorda que debe haber algun control/punto de corte, en este caso la cantidad de veces que se ejecuta. (Ej. En la funciones con listas se evalua si la lista está vacía)
-}