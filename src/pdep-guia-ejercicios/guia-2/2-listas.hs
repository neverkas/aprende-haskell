{-
2.1. Definir una función que sume una lista de números.
Nota: Investigar sum 
-}
sumarListaNumeros :: Num a => [a] -> a


sumarListaNumeros []  = 0
sumarListaNumeros [x]  = x
sumarListaNumeros (x:xs) = x + sumarListaNumeros xs

{-
2.2. Durante un entrenamiento físico de una hora, cada 10 minutos de entrenamiento se tomo
la frecuencia cardíaca de uno de los participantes obteniéndose un total de 7 muestras 
que son las siguientes
frecuenciaCardiaca = [80, 100, 120, 128, 130, 123, 125]
Comienza con un frecuencia de 80 min 0.
A los 10 min la frecuencia alcanza los 100
a los 20 min la frecuencia es de 120,
A los 30 min la frecuencia es de 128
A los 40 min la frecuencia es de 130,
…etc..
A los 60 min la frecuenca es de 125
frecuenciaCardiaca es un función constante.
-}

frecuenciaCardiaca = [80, 100, 120, 128, 130, 123, 125]

{-
2.2.1. Definir la función promedioFrecuenciaCardiaca, que devuelve el promedio de la
frecuencia cardíaca.
Main> promedioFrecuenciaCardiaca
115.285714285714
-}
promedioFrecuenciaCardiaca frecuencias = 
  (sum frecuencias) / fromInteger(toInteger(length frecuencias))

-- utilizo fromInteger(toInteger()) para parsear el dato, ya que sino tira error

{-
2.2.2. Definir la función frecuenciaCardiacaMinuto, que recibe m que es el minuto en el cual
quiero conocer la frecuencia cardíaca, m puede ser a los 10, 20, 30 ,40,..hasta 60.
Main> frecuenciaCardiacaMinuto 30
128
Ayuda: Vale definir una función auxiliar para conocer el número de muestra. 
-}
posicionLista m = round (m/10)
frecuenciaCardiacaMinuto m = frecuenciaCardiaca !! (posicionLista m)

{-
2.2.3. Definir la función frecuenciasHastaMomento, devuelve el total de frecuencias que se
obtuvieron hasta el minuto m.

Main> frecuenciasHastaMomento 30
[80, 100, 120, 128]

Ayuda: Utilizar la función take y la función auxiliar definida en el punto anterior. 
-}

frecuenciasHastaMomento m = take (posicionLista m+1) frecuenciaCardiaca
-- # dudas, estará bien sumarle ese +1 (?)
-- posicionLista de m=30 me devuelve 3, que es la posición del 120, el siguiente es 128

{-
2.3. Definir la función esCapicua, si data una lista de listas,
me devuelve si la concatenación de las sublistas es una lista capicua.
.Ej:
Main> esCapicua ["ne", "uqu", "en"]
True
Porque “neuquen” es capicua.
Ayuda: Utilizar concat, reverse. 
-}

esCapicua :: [String] -> Bool
esCapicua lista = (concat lista) == (reverse . concat) lista

{-
2.4. Se tiene información detallada de la duración en minutos 
de las llamadas que se llevaron a cabo en un período determinado,
discriminadas en horario normal y horario reducido.
-}
duracionLlamadas =
  ( ("horarioReducido", [20,10,25,15]), ("horarioNormal", [10,5,8,2,9,10]) )

-- funcion genérica que uso para el punto 2.4.1 y 2.4.2

cualEsMayorSegun :: ([Int]->Int) -> ((String, [Int]), (String, [Int])) -> String
cualEsMayorSegun funcion (a,b) 
  | (funcion . snd) a > (funcion . snd) b = fst a
  | otherwise = fst b

  {-
2.4.1. Definir la función cuandoHabloMasMinutos, devuelve en que horario se habló más
cantidad de minutos, en el de tarifa normal o en el reducido.
Main> cuandoHabloMasMinutos
“horarioReducido” 
-}

cuandoHabloMasMinuto :: ((String,[Int]), (String,[Int])) -> String
cuandoHabloMasMinuto (a,b) = cualEsMayorSegun (sum) (a,b)

{-
-- este es  más largo, lo reemplacé por el que usa una función genérica
cualSumaMas (a, b) = (sum . snd) a  > (sum . snd) b

cuandoHabloMasMinuto (a, b) 
  | cualSumaMas (a, b) = fst a
  | otherwise = fst b
-}

{-
2.4.2. Definir la función cuandoHizoMasLlamadas, devuelve en que franja horaria realizó más
cantidad de llamadas, en el de tarifa normal o en el reducido.
Main> cuandoHizoMasLlamadas
“horarioNormal”
Nota: Utilizar composición en ambos casos 
-}

cuandoHizoMasLlamadas :: ((String,[Int]), (String,[Int])) -> String
cuandoHizoMasLlamadas (a,b) = cualEsMayorSegun (length) (a,b)

{-
-- este es  más largo, lo reemplacé por el que usa una función genérica
cualMayorCantidad (a,b) = (length . snd) a > (length . snd) b

cuandoHizoMasLlamadas (a,b) 
  | cualMayorCantidad (a,b) = fst a
  | otherwise = fst b
-}
