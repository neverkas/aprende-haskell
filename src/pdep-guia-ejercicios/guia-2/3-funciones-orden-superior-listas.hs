{-
3.1. Definir la función esMultiploDeAlguno, que recibe un número y una lista y devuelve True
si el número es múltiplo de alguno de los números de la lista. P.ej.
Main> esMultiploDeAlguno 15 [2,3,4]
True,
porque 15 es múltiplo de 3
Main> esMultiploDeAlguno 34 [3,4,5]
False
porque 34 no es múltiplo de ninguno de los 3
Nota: Utilizar la función any.
-}

esMultiploDe :: Int -> Int -> Bool
esMultiploDe n = (==0) . (mod n)

esMultiploDeAlguno :: Int -> [Int] -> Bool
esMultiploDeAlguno n = any (esMultiploDe n)

{-
3.2. Armar una función promedios, que dada una lista de listas me devuelve la lista de los
promedios de cada lista-elemento. P.ej.
Main> promedios [[8,6],[7,9,4],[6,2,4],[9,6]]
[7,6.67,4,7.5]
Nota: Implementar una solución utilizando map. 
-}
promedio :: [Float] -> Float
promedio numeros = (sum numeros) / fromInteger(toInteger(length numeros))

promedios :: [[Float]] -> [Float]
promedios = map promedio

{-
3.3. Armar una función promediosSinAplazos que dada una lista de listas
me devuelve la lista de los promedios de cada lista-elemento, excluyendo
los que sean menores a 4 que no se cuentan.
P.ej.
Main> promediosSinAplazos [[8,6],[6,2,4]]
[7,5]
Nota: Implementar una solución utilizando map
-}

menoresA4 :: [Float] -> [Float]
menoresA4 = filter (>=4) 

promediosSinAplazos :: [[Float]] -> [Float]
promediosSinAplazos = map (promedio . menoresA4)

{-
3.4. Definir la función mejoresNotas, que dada la información 
de un curso devuelve la lista con la mejor nota de cada alumno.
P.ej.
Main> mejoresNotas [[8,6,2,4],[7,9,4,5],[6,2,4,2],[9,6,7,10]]
[8,9,6,10].
Ayuda: Utilizar la función predefinida maximum. 
-}
mejorNota :: [Int] -> Int
mejorNota = maximum

mejoresNotas :: [[Int]] -> [Int]
mejoresNotas = map mejorNota 

{-
3.5. Definir la función aprobó, que dada la lista de las notas
de un alumno devuelve True si el alumno aprobó. Se dice que un 
alumno aprobó si todas sus notas son 4 o más.
P.ej.
Main> aprobo [8,6,2,4]
False
Main> aprobo [7,9,4,5]
True
Ayuda: Utilizar la función predefinida minimum
-}  
aprobo :: [Int] -> Bool 
aprobo = (>=4) . minimum 

{-
3.6. Definir la función aprobaron, que dada la información de un curso
devuelve la información de los alumnos que aprobaron.
P.ej.
Main> aprobaron [[8,6,2,4],[7,9,4,5],[6,2,4,2],[9,6,7,10]]
[[7,9,4,5],[9,6,7,10]]
Ayuda: usar la función aprobó 
-}
aprobaron :: [[Int]] -> [[Int]]
aprobaron = filter aprobo

{-
3.7. Definir la función divisores, que recibe un número y 
devuelve la lista de divisores.
P.ej.
Main> divisores 60
 [1,2,3,4,5,6,10,12,15,20,30,60]
Ayuda: para calcular divisores n alcanza con revisar los números entre 1 y n. 
-}
divideA :: Int -> Int -> Bool
divideA n = (==0) . mod n

divisores :: Int -> [Int]
divisores n = filter (divideA n) [1..n]

{-
3.8. Definir la función exists, que dadas una función booleana y una
lista devuelve True si la función da True para algún elemento de la lista.
P.ej.
Main> exists even [1,3,5]
False

Main> exists even [1,4,7]
True
porque even 4 da True 
-}

algunoCumpleCriterio :: [Int] -> Bool
algunoCumpleCriterio = (>=1) . length

exists :: (Int->Bool) -> [Int] -> Bool
exists funcion = algunoCumpleCriterio . filter funcion

{-
3.9. Definir la función hayAlgunNegativo, que dada una lista de números y un (…algo…)
devuelve True si hay algún nro. negativo.

Main> hayAlgunNegativo [2,-3,9] (…algo…)
True 
-}
hayAlgunNegativo :: [Int] -> a -> Bool
hayAlgunNegativo lista algo = (algunoCumpleCriterio . filter (<0)) lista
-- FUNCIONA PERO ESTÁ OK (?)

{-
3.10. Definir la función aplicarFunciones, que dadas una lista de funciones y un valor
cualquiera, devuelve la lista del resultado de aplicar las funciones al valor.
P.ej.
Main> aplicarFunciones[(*4),(+3),abs] (-8)
[-32,-5,8]
Si pongo
Main> aplicarFunciones[(*4),even,abs] 8
da error. ¿Por qué? 
-}
aplicarFuncion :: a -> (a->b) -> b
aplicarFuncion valor funcion = funcion valor

aplicarFunciones :: [(a->b)] -> a -> [b]
aplicarFunciones funciones valor = map (aplicarFuncion valor) funciones
-- Mi respuesta a la pregunta del enunciado:
-- La función aplicarFunciones tiene como salida una lista de tipos b, 
-- y "even" está devolviendo un tipo diferente a (*4) y abs, 
-- ya que "even" devuelve un tipo booleano, mientras que los otros dos devuelven un número

{-
3.11. Definir la función sumaF, que dadas una lista de funciones y un número, devuelve la
suma del resultado de aplicar las funciones al número.
P.ej.
Main> sumaF[(*4),(+3),abs] (-8)
-29 
-}
sumaF :: [(Int->Int)] -> Int -> Int
sumaF funciones valor = sum $ map (aplicarFuncion valor) funciones
-- observación: si no hubiera agregado el signo $ luego de sum
-- deberia haber puesto entre parentesis toda la función map junto con su argumento
-- ya que $ evita hacer eso

{-
3.12. Un programador Haskell está haciendo las cuentas para un juego 
de fútbol virtual (como el Hattrick o el ManagerZone). En un momento le 
llega la información sobre la habilidad de cada jugador de un equipo, 
que es un número entre 0 y 12, y la orden de subir la forma de todos los
jugadores en un número entero; p.ej., subirle 2 la forma a cada jugador.
Ahora, ningún jugador puede tener más de 12 de habilidad; si un jugador 
tiene 11 y la orden es subir 2, pasa a 12, no a 13; si estaba en 12 se queda en 12.
Escribir una función subirHabilidad que reciba un número (que se supone 
positivo sin validar) y una lista de números, y le suba la habilidad a cada 
jugador cuidando que ninguno se pase de 12.

P.ej.
Main> subirHabilidad 2 [3,6,9,10,11,12]
[5,8,11,12,12,12]
-}

sumarSegunCriterioMaximo12 :: Int -> Int -> Int
sumarSegunCriterioMaximo12 n = (min 12) . (+n)
-- Observación: te habias equivocado al pasar (+n) como argumento
-- la función "min" recibe 2 valores no "funciones".
-- Por lo que necesitas usar composición:
-- (+n) espera un valor, y devuelve otro, este se lo pasa a (min 12)

subirHabilidad :: Int -> [Int] -> [Int]
subirHabilidad n = map (sumarSegunCriterioMaximo12 n)

{-
3.13. Ahora el requerimiento es más genérico: hay que cambiar la habilidad
de cada jugador según una función que recibe la vieja habilidad y devuelve
la nueva. 
Armar: una función flimitada que recibe una función f y un número n, y 
devuelve f n garantizando que quede entre 0 y 12 (si f n < 0 debe devolver 0,
si f n > 12 debe devolver 12).

P.ej.
Main> flimitada (*2) 9
12
pues 9*2 = 18 > 12
Main> flimitada (+(-4)) 3
0
pues 3-4 = -1 < 0
Main> flimitada (*2) 5
10
pues 5*2 = 10 que está en rango
Hacerlo en una sola línea y sin guardas. Ayuda: usar min y max. 
-}
flimitada :: (Int->Int) -> Int -> Int
flimitada funcion = (max 0) . (min 12) . funcion
--flimitada funcion n = max 0 (min (funcion n) 12) -- anda, pero no usa composición

{-
3.13.1 Definir una función cambiarHabilidad, que reciba una función f 
y una lista de habilidades, y devuelva el resultado de aplicar f con las
garantías de rango que da flimitada.

P.ej.
Main> cambiarHabilidad (*2) [2,4,6,8,10]
[4,8,12,12,12] 
-}
cambiarHabilidad :: (Int->Int) -> [Int] -> [Int]
cambiarHabilidad funcion = map (flimitada funcion) 

{-
3.13.2. Usar cambiarHabilidad para llevar a 4 a los que tenían
menos de 4, dejando como estaban al resto.

P.ej.
Main> cambiarHabilidad ... [2,4,5,3,8]
[4,4,5,4,8]
Lo que hay que escribir es completar donde están los puntitos. 
-}

-- ### Mi solución al problema:
-- Main> cambiarHabilidad ((max 4) . (*1)) [2,4,5,3,8]
-- 1. Pongo *1 para que devuelva los numeros 2,3
-- 2. utilizo max para delimitar como minimo el 4

{-
3.14. Investigar lo que hace la función takeWhile,
que está incluida en el prelude. Preguntar primero el tipo,
y después hacer pruebas. Ayudarse con el nombre. 
-}


{-
3.15. Usar takeWhile para definir las siguientes funciones:
-}

{-
3.15.1 primerosPares, que recibe una lista de números y devuelve
la sublista hasta el primer no par exclusive.

P.ej. 
Main> primerosPares [4,12,3,8,2,9,6]
devuelve [4,12], corta en 3 porque no es par
-}
primerosPares :: [Int] -> [Int]
primerosPares = takeWhile (even)

{-
3.15.2 primerosDivisores, que recibe una lista de números y un número n, y devuelve la sublista
hasta el primer número que no es divisor de n exclusive.

P.ej.
Main> primerosDivisores 60 [4,12,3,8,2,9,6]
devuelve [4,12,3], corta en 8 porque no divide a 60
-}
esDivisiblePor :: Int -> Int -> Bool
esDivisiblePor n = (==0) . (mod n)

primerosDivisores :: Int -> [Int] -> [Int]
primerosDivisores n = takeWhile (esDivisiblePor n)

{-
3.15.3 primerosNoDivisores, que recibe una lista de números y un número n, y devuelve la
sublista hasta el primer número que sí es divisor de n exclusive.

P.ej.
Main> primerosNoDivisores 60 [8,9,4,12,3,8,2,9,6]
devuelve [8,9], corta en 4 porque divide a 60 
-}
primerosNoDivisores :: Int -> [Int] -> [Int]
primerosNoDivisores n = takeWhile (not . esDivisiblePor n)

{-
3.16. Se representa la información sobre ingresos y egresos de una 
persona en cada mes de un año mediante dos listas, de 12 elementos
cada una. P.ej., si entre enero y junio gané 100, y entre julio y 
diciembre gané 120, mi lista de ingresos es
[100,100,100,100,100,100,120,120,120,120,120,120]
si empecé en 100 y fui aumentando de a 20 por mes, llegando a 220, queda
[100,120..220]
y si es al revés, empecé en 220 y fui bajando de a 20 por mes hasta llegar a 100, queda
[220,200..100]
(jugar un poco con esta notación)
Definir la función:
huboMesMejorDe, que dadas las listas de ingresos y egresos y un número, devuelve True
si el resultado de algún mes es mayor que el número.

P.ej.
Main> huboMesMejorDe [1..12] [12,11..1] 10
True
porque en diciembre el resultado fue 12-1=11 > 10. 
-}
diferenciaEntre :: [Int] -> [Int] -> [Int]
diferenciaEntre = zipWith (-)

huboMesMejorDe :: [Int] -> [Int] -> Int -> Bool
huboMesMejorDe ingresos egresos n = any (>n) $ diferenciaEntre ingresos egresos

{-
3.17. En una población, se estudió que el crecimiento anual de la altura 
de las personas sigue esta fórmula de acuerdo a la edad
1 año: 22 cm
2 años: 20 cm
3 años: 18 cm
... así bajando de a 2 cm por año hasta
9 años: 6 cm
10 a 15 años: 4 cm
16 y 17 años: 2 cm
18 y 19 años: 1 cm
20 años o más: 0 cm
A partir de esta información: 
-}

{-
3.17.1. Definir la función crecimientoAnual,que recibe como parámetro la edad de la
persona, y devuelve cuánto tiene que crecer en un año. Hacerlo con guardas.
La fórmula para 1 a 10 años es 24 - (edad * 2). 
-}
calcularAlturaHasta10Anios :: Int -> Int
calcularAlturaHasta10Anios = (24-) . (*2)

--calcularAlturaMas10Anios :: Int -> Int

crecimientoAnual :: Int -> Int
crecimientoAnual edad 
    | edad >= 1 && edad <= 10 = calcularAlturaHasta10Anios edad
    | edad == 9 = 6
    | edad >= 10 && edad <= 15 = 4
    | edad >= 16 && edad <= 17 = 2
    | edad >= 18 && edad <= 19 = 1
    | otherwise = 0


{-
3.17.2. Definir la función crecimientoEntreEdades, que recibe como parámetros
dos edades y devuelve cuánto tiene que crecer una persona entre esas dos edades.
P.ej.
Main> crecimientoEntreEdades 8 12
22
es la suma de 8 + 6 + 4 + 4, crecimientos de los años 8, 9, 10 y 11 respectivamente.
Definir la función crecimientoEntreEdades en una sola línea, usando map y suma. 
-}
crecimientoEntreEdades :: Int -> Int -> Int
crecimientoEntreEdades edadDesde edadHasta = 
    sum $ map crecimientoAnual [edadDesde..edadHasta]
-- Observaciones:
    -- le agregué -1 porque el enunciado no cuenta el 12, como otra iteración
    -- utilizé el signo $, para evitar colocar los parentesis entre (map ... [])

{-
3.17.3. Armar una función alturasEnUnAnio, que dada una edad y una lista de alturas de
personas, devuelva la altura de esas personas un año después.

P.ej.
Main> alturasEnUnAnio 7 [120,108,89]
[130,118,99]
Que es lo que van a medir las tres personas un año después, dado que el coeficiente de
crecimiento anual para 7 años da 10 cm.
Nota: definir la función alturasEnUnAnio en una sola línea, usando map y 
la función (+ expresion). 
-}
alturasEnUnAnio :: Int -> [Int] -> [Int]
alturasEnUnAnio edad = map (+crecimientoAnual 7) 

{-
3.17.4. Definir la función alturaEnEdades, que recibe la altura y la edad 
de una persona y una lista de edades, y devuelve la lista de la altura que va 
a tener esa persona en cada una de las edades.

P.ej.
Main> alturaEnEdades 120 8 [12,15,18]
[142,154,164]
que son las alturas que una persona que mide 120 cm a los 8 años va a 
tener a los 12, 15 y 18 respectivamente.
-}

crecimientoEntreVariasEdades :: Int -> [Int] -> [Int]
crecimientoEntreVariasEdades edadInicial = map (crecimientoEntreEdades edadInicial)

sumarAlturaConCrecimientos :: Int -> [Int] -> [Int]
sumarAlturaConCrecimientos altura = map (altura+)

alturaEnEdades :: Int -> Int -> [Int] -> [Int]
alturaEnEdades altura edadInicial edades =
    sumarAlturaConCrecimientos altura (crecimientoEntreVariasEdades edadInicial edades)

{-
3.18. Se tiene información de las lluvias en un determinado mes 
Ej: se conoce la siguiente información:
-}
lluviasEnero = [0,2,5,1,34,2,0,21,0,0,0,5,9,18,4,0]

{-
# PENDIENTE
3.18.1. (muy difícil) Definir la función rachasLluvia, que devuelve una
lista de las listas de los días seguidos que llovió.

P.ej. se espera que la consulta
Main> rachasLluvia lluviasEnero
[[2,5,1,34,2],[21],[5,9,18,4]].
A partir de esta definir mayorRachaDeLluvias, que devuelve la cantidad máxima de días
seguidos que llovió.
P.ej. se espera que la consulta
mayorRachaDeLluvias lluviasEnero devuelva 5.

Ayuda: ver las funciones dropWhile y takeWhile, probar p.ej. esto
takeWhile even [2,4,7,10,14,15]
dropWhile even [2,4,7,10,14,15] 
-}

{-
3.19. Definir una función que sume una lista de números.
Nota: Resolverlo utilizando foldl/foldr. 
-}
primerElemento :: [a] -> a
primerElemento = head

descartarPrimerElemento :: [a] -> [a]
descartarPrimerElemento = drop 1

sumarNumeros :: [Int] -> Int
--sumarNumeros lista = foldl (+) (head lista) (drop 1 lista) -- no estoy delegando tanto
sumarNumeros lista = foldl (+) (primerElemento lista) (descartarPrimerElemento lista)

ultimoElemento :: [a] -> a
ultimoElemento = last

descartarUltimoElemento :: [a] -> [a]
descartarUltimoElemento lista = take ((-1) + length lista) lista

sumarNumeros' :: [Int] -> Int
sumarNumeros' lista = foldr (+) (ultimoElemento lista) (descartarUltimoElemento lista)
--sumarNumeros' lista = foldr (+) (last lista) (take ((length lista)-1) lista) -- no estoy delegando tanto

{-
Observaciones propias:
    FOLD funcion valor lista
    Memotécnica propia para diferenciar foldl y foldr
    foldl = interpretar que funciona al reves, la L como last(último) pero agarra el primero

    A) foldl
        1.1 toma el 2do argumento y el 1er elemento de la lista y aplica la función
        1.2 al resultado anterior le aplica la función con los elementos siguientes de la lista
        Observación: Es decir usa los elementos de la lista del principio a fin
    B) foldr
        Observación: Hace lo mismo que FOLDL pero toma el ultimo elemento de la lista,
        y va trabaja de derecha a izquierda, es decir desde el final de la lista hasta el principio
-}

{-
3.20. Definir una función que resuelva la productoria de una lista de números.
Nota: Resolverlo utilizando foldl/foldr. 
-}
productoria :: [Int] -> Int
productoria lista = foldl (*) (primerElemento lista) (descartarPrimerElemento lista)

productoria' :: [Int] -> Int
productoria' lista = foldr (*) (ultimoElemento lista) (descartarUltimoElemento lista)

{-
3.21. Definir la función dispersion, que recibe una lista de números y 
devuelve la dispersión de los valores, o sea máximo - mínimo.
Nota: Probar de utilizar foldr. 
-}
-- foldl (take 1 [1,2,3]) (drop 1 [1,2,3])
-- foldr (drop 1 [1,2,3]) (take (length lista -1) [1,2,3] )

maximoOMinimoSegun :: (Int->Int->Int) -> [Int] -> Int
maximoOMinimoSegun funcion lista = 
    foldr (funcion) (ultimoElemento lista) (descartarUltimoElemento lista)

dispersion :: [Int] -> Int
dispersion lista = (maximoOMinimoSegun max lista) - (maximoOMinimoSegun min lista)

