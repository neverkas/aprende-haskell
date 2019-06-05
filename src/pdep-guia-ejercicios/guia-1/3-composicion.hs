{-
3.1. Resolver la función del ejercicio 1.2 de esta guía esMultiploDe, utilizando
aplicación parcial y composición.
El ejercicio 1.2. decía  "Definir la función esMultiploDe, que devuelve True si 
el segundo es múltiplo del primero"
-}

--esMultiploDe a b = (==0) (mod b a)
--esMultiploDe a = (==0) . (flip mod a) -- una manera bien corta
elResto = flip mod
esCero = (==0)
esMultiploDe a = esCero . (elResto a)

{-
3.2. Resolver la función del ejercicio 1.5 de esta guía esBisiesto, utilizando aplicación
parcial y composición
El ejercicio 1.5. decía "Definir la función esBisiesto, indica si un año es bisiesto.
(Un año es bisiesto si es divisible por 400 o es divisible por 4 pero no es divisible por 100)
Nota: Resolverlo reutilizando la función esMultiploDe"
-}

esRestoCero = (==0)
esDivisiblePor numero = esRestoCero . (flip mod numero)
noEsDivisiblePor numero anio = not (esDivisiblePor numero anio)
esBisiesto anio = (esDivisiblePor 400 anio) || (esDivisiblePor 4 anio && noEsDivisiblePor 100 anio)

{-
3.3. Resolver la función inversaRaizCuadrada, que da un número n devolver la
inversa su raíz cuadrada.
Main> inversaRaizCuadrada 4
0.5
Nota: Resolverlo utilizando la función inversa Ej. 2.3, sqrt y composición.
El ejercicio 2.3 decía "Definir una función inversa, que invocando a la función con un número cualquiera me
devuelva su inversa."
-}


{-
** No es incrementa un valor n al cuadrado de m?
3.4. Definir una función incrementMCuadradoN, que invocándola con 2 números m y n,
incrementa un valor m al cuadrado de n por Ej:
Main> incrementMCuadradoN 3 2
11
Incrementa 2 al cuadrado de 3, da como resultado 11.
Nota: Resolverlo utilizando aplicación parcial y composición.

### Analisis propio de la solución
    como (+n) y (^2) esperan un argumento son funciones y no valores, entonces se pueden componer
    1.hago la composición ( (a) . (b) )
    2.eso ya es una función y le paso un argumento, en este caso "m"
    3. entonces "m" pasa por (^2) que esperaba un argumento (m), y el resultado se lo pasa a (+n) que también esperaba otro argumento

-}

incrementMCuadradoN m n = ((+n) . (^2)) m


{-
3.5. Definir una función esResultadoPar/2, que invocándola con número n y otro m,
devuelve true si el resultado de elevar n a m es par.
Main> esResultadoPar 2 5
True
Main> esResultadoPar 3 2
False
Nota: Resolverlo utilizando aplicación parcial y composición.
-}
esResultadoPar n = ((even) . (n^))