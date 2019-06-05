{-
Definí la función pam, que es... como el map pero al revés,
le pasás una lista de funciones y un valor y te devuelve los resultados
de aplicar cada una al valor.

Ejemplos:
Main>pam [(+3), (*2)] 2
[5, 6]

Main>pam [id, not, not] True
[True, False, False]
-}
pam :: [(a->b)]->a->[b]
 
pam funciones dato = 
 foldr (\funcion semilla-> funcion dato:semilla) [] funciones 
