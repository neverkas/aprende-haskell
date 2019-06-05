{-
4.1. Definir las funciones fst3, snd3, trd3, que dada una tupla de 3 elementos devuelva
el elemento correspondiente, p.ej. 
-}

fst3 :: (a,b,c) -> a
fst3 (a,_,_) = a

snd3 :: (a,b,c) -> b
snd3 (_,b,_) = b

trd3 :: (a,b,c) -> c
trd3 (_,_,c) = c

{-
4.2. Definir la función aplicar, que recibe como argumento una tupla de 2 elementos con
funciones y un entero, me devuelve como resultado una tupla con el resultado de aplicar el
elemento a cada una de la funciones, ej:
Main> aplicar (doble,triple) 8
(16,24)
Main> aplicar ((3+),(2*)) 8
(11,16)
-}

--Main> aplicar (doble,triple) 8
--(16,24)

--aplicar :: ((Int->s1), (Int->s2)) -> Int -> (s1, s2)
aplicar :: ((a->s1), (a->s2)) -> a -> (s1, s2)
aplicar (funcion1, funcion2) numero = ((funcion1 numero), (funcion2 numero))

{-
4.3. Definir la función cuentaBizarra, que recibe un par y: si el primer elemento es
mayor al segundo devuelve la suma, si el segundo le lleva más de 10 al primero devuelve
la resta 2do – 1ro, y si el segundo es más grande que el 1ro pero no llega a llevarle 10,
devuelve el producto. Ej
Main> cuentaBizarra (5,8) 
40
Main> cuentaBizarra (8,5)
13
Main> cuentaBizarra (5,29)
24 
-}
cuentaBizarra :: (Int, Int) -> Int
cuentaBizarra (a,b)
 | a > b = a + b
 | b > a && (b - a) >= 10 = b - a
 | b > a && (b - a) < 10 = a * b

{-
4.4. Representamos las notas que se sacó un alumno en dos parciales mediante un par
(nota1,nota2), p.ej. un patito en el 1ro y un 7 en el 2do se representan mediante el par
(2,7).
A partir de esto
Definir la función esNotaBochazo, recibe un número y devuelve True si no llega a 4,
False en caso contrario. No vale usar guardas.
Definir la función aprobo, recibe un par e indica si una persona que se sacó esas notas
aprueba. Usar esNotaBochazo.
Definir la función promociono, que indica si promocionó, para eso tiene las dos notas
tienen que sumar al menos 14 y además haberse sacado 6 en cada parcial.
Escribir una consulta que dado un par indica si aprobó el primer parcial, usando
esNotaBochazo y composición. La consulta tiene que tener esta forma (p.ej. para
el par de notas (5,8))
Main> (... algo ...) (5,8) 
-}
esNotaBochazo :: Int -> Bool
esNotaBochazo = (>4) -- el enunciado dice <4, pero creo que es >4 (?)

aprobo :: (Int, Int) -> Bool
aprobo (a, b) = (esNotaBochazo a) && (esNotaBochazo b)

promociono :: (Int, Int) -> Bool
promociono (a, b) = ((a+b) > 14) && (a >=6) && (b >= 6)

-- mi solucion a la ultima parte del enunciado 4.4:
-- Main> (esNotaBochazo . fst) (5,8) 


{-
#4.5. Siguiendo con el dominio del ejercicio anterior, tenemos ahora dos parciales con dos
recuperatorios, lo representamos mediante un par de pares
((parc1,parc2),(recup1,recup2)).
Si una persona no rindió un recuperatorio, entonces ponemos un "-1" en el lugar
correspondiente.
Observamos que con la codificación elegida, siempre la mejor nota es el máximo entre
nota del parcial y nota del recuperatorio.
Considerar que vale recuperar para promocionar.
En este ejercicio vale usar las funciones que se definieron para el anterior.
# continua debajo
-}

{-
#4.5.1 Definir la función notasFinales que recibe un par de pares y devuelve el par que
corresponde a las notas finales del alumno para el 1er y el 2do parcial.
P.ej.
Main> notasFinales ((2,7),(6,-1)) 
(6,7)
Main> notasFinales ((2,2),(6,2))
(6,2)
Main> notasFinales ((8,7),(-1,-1))
(8,7)
# continua debajo
-}
notasFinales :: ((Int,Int), (Int,Int)) -> (Int, Int)
--notasFinales ((parcial1, parcial2), (recu1, recu2))
notasFinales ((parcial1, parcial2), (recu1, recu2)) = ((max parcial1 recu1) , (max parcial2 recu2))
{-
-- una manera mas descriptiva con pattern matching
-- pero se puede reducir en una linea como figura más arriba
notasFinales ((parcial1, parcial2),(recu1, recu2))  = (recu1, recu2)
notasFinales ((parcial1, parcial2),(-1,-1))         = (parcial1, parcial2)
notasFinales ((parcial1, parcial2),(-1, recu2))     = (parcial1, recu2)
notasFinales ((parcial1, parcial2),(recu1, -1))     = (recu1, parcial2)
-}

{-
#4.5.2 Escribir la consulta que indica si un alumno cuyas notas son ((2,7),(6,-1)) recursa o
no. O sea, la respuesta debe ser True si recursa, y False si no recursa.
Usar las funciones definidas en este punto y el anterior, y composición.
La consulta debe tener esta forma
Main> (... algo ...) ((2,7),(6,-1))
-}

-- mi resolución seria:
-- Main> (not . aprobo . notasFinales) ((2,7), (6, -1))
recursa ((a,b), (c,d)) = (not . aprobo . notasFinales) -- aunque no lo pida, lo hago función

{-
#4.5.3 Escribir la consulta que indica si un alumno cuyas notas son ((2,7),(6,-1)) recuperó
el primer parcial. Usar composición. La consulta debe tener esta forma
Main> (... algo ...) ((2,7),(6,-1))
-}
-- mi resolución seria:..
-- agarro la segunda tupla, luego el primer elemento, y luego evaluo si es mayor a 0
-- Main> ((>0) . fst . snd) ((2,7),(6,-1))
recuperoPrimerParcial = ((>0) . fst . snd) -- aunque no lo pida, lo hago función

{-
#4.5.4 Definir la función recuperoDeGusto que dado el par de pares que representa a un
alumno, devuelve True si el alumno, pudiendo promocionar con los parciales (o sea
sin recup.), igual rindió al menos un recup.
Vale definir funciones auxiliares.
Hacer una definición que no use pattern matching, en las eventuales funciones
auxiliares tampoco; o sea, manejarse siempre con fst y snd.
-}

--promociono :: (Int, Int) -> Bool
--promociono (a, b) = ((a+b) > 14) && (a >=6) && (b >= 6)

dioRecuperatios :: (Int, Int) -> Bool
dioRecuperatios tupla = ((>0).fst) tupla || ((>0).snd) tupla

recuperoDeGusto :: ((Int, Int),(Int, Int)) -> Bool
recuperoDeGusto tupla = (dioRecuperatios.snd) tupla && (promociono.fst) tupla 

{-
4.6. Definir la función esMayorDeEdad, que dada una tupla de 2 elementos (persona,
edad) me devuelva True si es mayor de 21 años y False en caso contrario. Por Ej:.
Main> esMayorDeEdad(juan,18)
False
Nota: Definir la función utilizando aplicación parcial y composición.
-}

esMayorDeEdad :: (String, Int) -> Bool
esMayorDeEdad = (>21) . snd
--esMayorDeEdad (_, edad) = edad > 21 -- si utilizara pattern matching

{-
4.7. Definir la función calcular, que recibe una tupla de 2 elementos, si el primer
elemento es par lo duplica, sino lo deja como esta y con el segundo elemento en caso de
ser impar le suma 1 y si no deja esté último como esta.
Main> calcular (4,5)
(8,6)
Main> calcular (3,7)
(3,8)
Nota: Resolverlo utilizando aplicación parcial y composición. 
-}

calcular :: (Int, Int) -> (Int, Int)
-- este otro no funciona, xq even y odd devuelven True/False mientras
-- que (*2) y (+1) esperan un numero

hacerSi criterio funcion numero 
    | criterio numero = funcion numero
    | otherwise = numero
--  Main>(hacerSi even (*2)) 3

calcular (a, b) = (hacerSi even (*2) a, hacerSi odd (+1) b)

{-
calcular (a,b) 
    | even a && odd b = ((*2) a , (+1) b)
    | even a = ((*2) a, b)
    | odd b  = (a,(+1) b)
    | otherwise = (a,b)
-}
