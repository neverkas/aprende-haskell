{-
Queremos saber si dada una lista de criterios, un valor y una cantidad a la
cual denominaremos n, al menos n de esos criterios se satisfacen 
para el valor indicado.

Definir y explicitar el tipo de la función alMenosNSeCumplen de modo que 
se comporte de la forma indicada, siendo n el primer parámetro de la función.

Ej.
Main>alMenosNSeCumplen 3 8 [(> 4), even, odd, (< 0), (== 8), (\valor -> valor > 5 && valor < 10)] 
True

Main>alMenosNSeCumplen 5 8 [(> 4), even, odd, (< 0), (== 8), (\valor -> valor > 5 && valor < 10)] 
False

Main>alMenosNSeCumplen 2 "hola" [(== 'h').head, (>2).length, elem 'x'] 
True
-}

alMenosNSeCumplen :: 
 Int -> a-> [(a->Bool)]-> Bool
{-
1. EL 1er argumento es la cantidad mínima de funciones que deben cumplirse
2. El 2do argumento es el valor que se evaluará en la lista de funciones
3. EL 3er argumento es la lista de funciones, en la que cada función de la lista 
se le aplicará al 2do argumento y devolverá un valor Booleano (True/False) si se cumple,
ya que son funciones booleanas. Además reciben solo un argumento, que es el 2do argumento de
la función principal previamente mencionado.
4. La salida de la función principal será un booleano
-}

alMenosNSeCumplen veces valor =
 (>=veces).length.filter (\funcion -> funcion valor)
{-
1. Realizamos aplicación parcial, evitando pasar como argumento la lista de funciones
2. Utilizamos la función lambda/anónima para aplicar cada función de la lista de funciones,
al 2do argumento de la función principal, si se cumple se agregará a una nueva lista de
aquellas funciones que devolvieron True.
3. Por último sólo evaluamos al cantidad de condiciones que se cumplieron
-} 