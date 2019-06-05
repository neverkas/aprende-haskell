{-
1.1. Definir la función esMultiploDeTres, que devuelve True si un número es múltiplo de 3.
-}
--esMultiploDeTres numero = (==0) (mod numero 3) 
esMultiploDeTres = (== 0) . (flip mod 3) -- aplicación parcial && composicion

{-
1.2. Definir la función esMultiploDe/2, que devuelve True si el segundo es múltiplo del primero
-}
--esMultiploDe primero segundo = (==0) (mod segundo primero)
esMultiploDe primero = (==0) . (mod primero) -- aplicacion parcial && composicion

{-
1.3. Definir la función cubo, devuelve el cubo de un número.
-}
cubo = (^3)

{-
1.4. Definir la función area, devuelve el área de un rectángulo a partir de su base
 y su altura.
-}
area = (*) 


{-
1.5. Definir la función esBisiesto, indica si un año es bisiesto. (Un año es bisiesto si es
divisible por 400 o es divisible por 4 pero no es divisible por 100)
Nota: Resolverlo reutilizando la función esMultiploDe
-}
-- esMultiploDe primero = (==0) . (mod primero)
esBisiesto anio = 
    (esMultiploDe anio 400) || (esMultiploDe anio 4 && not (esMultiploDe anio 100))

{-
1.6. Definir la función celsiusToFahr, pasa una temperatura en grados Celsius a
grados Fahrenheit. 
Formula Celcius a Farenheit: (Celcius*1.8)+32
Formula Farentheit a Celcius: (Farenheit-32)/1.8
-}

--celsiusToFahr gradosCelcius = (gradosCelcius*1.8)+32
celsiusToFahr = (+32) . (*1.8) -- composicion && aplicacion parcial

{-
1.7. Definir la función fahrToCelsius, la inversa de la anterior. 
-}
-- uso "flip" porque sino (-32) no lo toma como función, sino como número negativo
--fahrToCelsius = (/1.8) . (flip (-) 32) -- OTRA MANERA
-- uso (+(-32)) xq -32 lo toma como número negativo no como función
fahrToCelsius = (/1.8) . (+(-32))

{-
1.8. Definir la función haceFrioF, indica si una temperatura expresada en grados
Fahrenheit es fría. Decimos que hace frío si la temperatura es menor a 8 grados Celsius. 
-}
haceFrioF = (<8) . fahrToCelsius 


{-
1.9. Definir la función mcm que devuelva el mínimo común múltiplo entre dos números, 
de acuerdo a esta fórmula.
m.c.m.(a, b) = {a * b} / {m.c.d.(a, b)} 
*Nota: Se puede utilizar gcd.
-}
-- el minimo comun múltiplo es el ńumero que 
-- Ej. mcm(10,2)= 10, mcm(5,2)=1, mcm(4,8)=8
-- si es resto cero, son divisibles

restoCero a b = (==0) (mod (max a b) (min a b))
mcm a b 
    | (restoCero a b) = max a b
    | otherwise = a*b


{-
1.10. Trabajamos con tres números que imaginamos como el nivel del río Paraná a la
altura de Corrientes medido en tres días consecutivos; cada medición es un entero que
representa una cantidad de cm.
P.ej. medí los días 1, 2 y 3, las mediciones son: 322 cm, 283 cm, y 294 cm.

A partir de estos tres números, podemos obtener algunas conclusiones.
Definir estas funciones de : 1.10.A.  y 1.10.B.
-}
{-
1.10.A. Definir la función dispersion, que toma los tres valores y devuelve la diferencia 
entre el más alto y el más bajo. Ayuda: extender max y min a tres argumentos,
usando las versiones de dos elementos. De esa forma se puede definir dispersión 
sin escribir ninguna guarda (las guardas están en max y min, que estamos usando).
-}

numeroMasAlto a b c = max (max a b) c
numeroMasBajo a b c = min (min a b) c
dispersion a b c = (numeroMasAlto a b c) - (numeroMasBajo a b c)

{-
1.10.B.  Definir las funciones diasParejos, diasLocos y diasNormales que reciben los 
valores de los tres días. Se dice que son días parejos si la dispersión es chica, 
que son días locos si la dispersión es grande, y que son días normales si no son 
ni parejos ni locos. Una dispersión se considera chica si es de menos de 30 cm, y 
grande si es de más de un metro.

Nota: Definir diasNormales a partir de las otras dos, no volver a hacer las cuentas. 
-}
diasParejos a b  = (<30)  . (dispersion a b) 
diasLocos   a b  = (>100) . (dispersion a b)
diasNormales a b c = not (diasLocos a b c) && not (diasParejos a b c)
-- #REVISAR diasNormales

{-
1.11. En una plantación de pinos, de cada árbol se conoce la altura expresada en cm. El
peso de un pino se puede calcular a partir de la altura así: 3 kg x cm hasta 3 metros, 2 kg
x cm arriba de los 3 metros. P.ej. 2 metros -> 600 kg, 5 metros -> 1300 kg.
Los pinos se usan para llevarlos a una fábrica de muebles, a la que le sirven árboles de
entre 400 y 1000 kilos, un pino fuera de este rango no le sirve a la fábrica.

Para esta situación:
-Definir la función pesoPino, recibe la altura de un pino y devuelve su peso.
-Definir la función esPesoUtil, recibe un peso en kg y devuelve True si un pino de ese
peso le sirve a la fábrica, y False en caso contrario.
-Definir la función sirvePino, recibe la altura de un pino y devuelve True si un pino de
ese peso le sirve a la fábrica, y False en caso contrario. Usar composición en la
definición. 
-}

--pesoPino altura = ((min altura 3) * 3 + (max altura 3)-3*2)*100
hastaTresMetros = (*3) . (min 3)
masDeTresMetros = (*2) . (+(-3)) . (max 3)
pasarMetrosACm  = (*100)
pesoPino altura = pasarMetrosACm (hastaTresMetros altura + masDeTresMetros altura)

esPesoUtil peso = (>=400) peso && (<=1000) peso
sirvePino       = esPesoUtil . pesoPino


{-
1.12. Desafío Café con Leche:
Implementar la función esCuadradoPerfecto, sin hacer operaciones con punto flotante.
Ayuda: les va a venir bien una función auxiliar, tal vez de dos parámetros. Pensar que el
primer cuadrado perfecto es 0, para llegar al 2do (1) sumo 1, para llegar al 3ro (4) sumo
3, para llegar al siguiente (9) sumo 5, después sumo 7, 9, 11 etc..
También algo de recursividad van a tener que usar. 
-}


-- Ejercicios
main = do
    putStrLn "esMultiploDeTres 9:"
    print(esMultiploDeTres 9)
    putStrLn ""

    putStrLn "esMultiploDe 12 3"
    print(esMultiploDe 12 3)

