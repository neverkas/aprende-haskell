{-
Ejercicio 2:  esBisiesto

Definí la función esBisiesto, que indica si un año es bisiesto.

Un año es bisiesto si:
 -es divisible por 400, o bien
 -es divisible por 4 pero no es divisible por 100

# Nota:
Resolvelo reutilizando la función esMultiploDe, que dice si el primer argumento 
es multiplo del segundo. Asumir que esta función existe.
Además, utilizá composición y aplicación parcial
-}

condicionUno :: Int -> Bool
condicionUno numero = esMultiploDe numero 400

condicionDos :: Int -> Bool
condicionDos numero = 
  esMultiploDe numero 4 && not(esMultiploDe numero 100)

condicionesUnoDos :: Int -> Bool
condicionesUnoDos numero = 
  condicionUno numero || condicionDos numero

seCumplenCondiciones :: Bool -> Bool
seCumplenCondiciones = (== True)

esBisiesto :: Int -> Bool
esBisiesto = seCumplenCondiciones . condicionesUnoDos