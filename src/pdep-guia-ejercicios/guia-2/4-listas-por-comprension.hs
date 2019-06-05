{-
Hay algunos ejercicios que se pueden resolver utilizando listas por comprensión.
Ej. Si quieren obtener una lista de solo los números pares del 1 al 10.
Hugs> [x| x <-[1..10], even x ]
[2,4,6,8,10]
-}

{-
4.1. Definir la función múltiplos/2, que dados una lista l y un número n,
devuelve la lista con los elementos de l que sean múltiplos de n.
P.ej.
Main> multiplos [2,6,12,17,21] 3
[6,12,21]
Nota: Utilizar listas por comprensión. 
-}
esMultiploDe :: Int -> Int -> Bool
esMultiploDe n = (==0) . (mod n)

multiplos :: [Int] -> Int -> [Int]
multiplos lista n = [x | x<-lista, esMultiploDe x n]

{-
4.2. Definir la función doblesDeLosPares, recibe una lista de números 
y devuelve la lista que tiene el doble de cada uno de los pares.

P.ej.
Main> doblesDeLosPares [3,5,6,8,11,14]
[12,16,28].
Nota: Utilizar listas por comprensión. 
-}
doble :: Int -> Int
doble = (*2)

esPar :: Int -> Bool
esPar = even

doblesDeLosPares :: [Int] -> [Int]
doblesDeLosPares lista = [doble x | x<-lista, esPar x]
-- Observación:
--      Podria evitar el llamado a doble y esPar, pero delegé en esas funciones
--      para que aumentar la expresividad del código


{-
4.3. Definir la función menoresA, recibe un número n y una lista de números l,
y devuelve la sublista de l de los menores a n.
Más fácil con un ejemplo: se espera que:
Main> menoresA 20 [23,5,16,38,11,24]
[5,16,11]
Nota: Utilizar listas por comprensión. 
-}
esMenorA :: Int -> Int -> Bool
esMenorA n = (n<)

menoresA :: Int -> [Int] -> [Int]
menoresA n lista = [x | x<-lista, esMenorA x n]

{-
4.4. Definir la función diferencia, dadas dos listas devuelve la sublista
de la primera cuyos elementos no están en la segunda.

#Observación propia:
    Diferencia "A-B"  = todos los valores de A que no estan en B
    Es parecido a lo que se ve en discreta

P.ej.
Main> diferencia [1..6] [2..4]
[1,5,6]
Ayuda: con listas por comprensión sale fácil. 
-}

noPerteneceAlaLista :: Int -> [Int] -> Bool
noPerteneceAlaLista n = not . (elem n)

diferencia :: [Int] -> [Int] -> [Int]
diferencia listaA listaB = 
    [x | x<-listaA, noPerteneceAlaLista x listaB]

{-
4.5. Definir intersección que dadas dos listas me devuelve la lista de los 
elementos que están en las dos.
Nota: Utilizar Listas por Comprensión
-}
perteneceALaLista :: Int -> [Int] -> Bool
perteneceALaLista n = elem n

interseccion :: [Int] -> [Int] -> [Int]
interseccion listaA listaB = 
    [x | x<-listaA, perteneceALaLista x listaB]
-- # OBSERVACION: te habias equivocado anteriormente n este
-- analizar bien la PROXIMA!
{-
    # OBSERVACION PROPIA:
    1. Tenes una lista A, que filtras pasandole un criterio (sin usar filter)
-}

{-
4.6. Retomando el ejercicio 3.17. (de Ingresos y Egresos de esta guía),
se pide definir las funciones (utilizando listas por comprensión):

    -- Main> huboMesMejorDe [1..12] [12,11..1] 10
    ---True
    --porque en diciembre el resultado fue 12-1=11 > 10. 

    --#Codigo del enunciado de Ingresos y Egresos
    diferenciaEntre :: [Int] -> [Int] -> [Int]
    diferenciaEntre = zipWith (-)

    huboMesMejorDe :: [Int] -> [Int] -> Int -> Bool
    huboMesMejorDe ingresos egresos n = any (>n) $ diferenciaEntre ingresos egresos
-}

{-
4.6.1. resultados, que dadas las listas de ingresos y egresos devuelve
la lista de los resultados de cada mes.
Nota: Utilizar Listas por Compresión. 
-}
-- ya no es necesario esta función porque uso pattern matching 
--restarComponentes :: (Int,Int) -> Int
--restarComponentes (a,b) = a - b

resultados :: [Int] -> [Int] -> [Int]
resultados ingresos egresos = [x-y |(x,y)<-zip ingresos egresos] -- aplico pattern matching
--resultados ingresos egresos =  [restarComponentes x | x<-(zip ingresos egresos)]

{-
4.6.2. resultado, que dadas las listas de ingresos y egresos y un mes, 
devuelve el resultado del mes.
Nota: Utilizar la función resultados
-}
resultado :: [Int] -> [Int] -> Int -> [Int]
resultado ingresos egresos mes =
    [x | (i,x)<-zip [1..12] (resultados ingresos egresos), i==mes]
-- utilizo zip para formar una lista de tuplas
-- el primer argumento [1..12] lo uso como indice, para obtener el dato por clave->valor


{-
4.7. Se tiene el registro de las lluvias de un mes, en mm. por día.
P.ej.
lluviasEnero = [0,2,5,1,34,2,0,21,0,0,0,5,9,18,4,0]
Definir estas funciones:
-}
lluviasEnero :: [Int]
lluviasEnero = [0,2,5,1,34,2,0,21,0,0,0,5,9,18,4,0]

{-
4.7.1. cantDiasLluviosos y cantDiasSecos, un día es seco si no llovió nada.
Nota: Utilizar Listas por Comprensión.. 
-}
cantDiasLluviosos :: [Int] -> Int 
cantDiasLluviosos registroLluvias =  length [x|x<-registroLluvias,x>0]

cantDiasSecos :: [Int] -> Int
cantDiasSecos registroLluvias = length [x|x<-registroLluvias,x==0]

{-
4.7.2. sumaLluviasSignificativas, que devuelve el total llovido para los 
días en que llovió más de 2 mm.. Usar la función sum.
Nota: Utilizar Listas por Comprensión. 
-}
sumaLluviasSignificativas :: [Int] -> Int
sumaLluviasSignificativas registroLluvias = sum [x|x<-registroLluvias,x>2]

{-
################### TESTING EXTRA ################### 
-}

-- con pattern matching, lista de las primeras componentes de una lista de tuplas
primerasComponentes :: [(Int, Int)] -> [Int]
primerasComponentes lista = [x | (x,_) <- lista]
-- Main> primerasComponentes [(1,2), (1,4), (1,6)]
-- [1,1,1]

-- concatenar listas de listas
concatenar lista = [x | xs<-lista, x<-xs]
--Main> concatenar [[1,2,3], [4,5,6]]
{-
    Propia deducción:
    1. x, es cada elemento de la lista a retornar
    2. xs<-lista, es cada sublista(elemento) de la lista
    3. x<-xs, le asigno a "x" cada elemento cada sublista
-}

factoresDe n = [x | x<-[1..n], mod n x == 0]
-- los factores de n, son los divisores, quienes dividen a n y dan resto cero

sumarComponentesDeTupla :: (Int,Int) -> Int
sumarComponentesDeTupla (a,b) = a - b

sumarListas :: [Int] -> [Int] -> [Int]
sumarListas listaA listaB =  [sumarComponentesDeTupla x | x<-(zip listaA listaB)]

