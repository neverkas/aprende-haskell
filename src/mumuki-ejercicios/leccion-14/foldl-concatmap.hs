{-
Usando las funciones foldl y concatMap, definir la función esCapicua/1, 
que dada una lista de listas, me devuelve si la concatenación de las 
sublistas es una lista capicua.

Ej.
Main> esCapicua ["ne","uqu","en"]
True

-}

juntarPalabra :: [String] -> String
juntarPalabra = concatMap (++"")

invertirPalabra :: [String] -> String
invertirPalabra =
  (foldl (\x letra -> letra:x) "") . juntarPalabra

esCapicua :: [String] -> Bool
esCapicua palabra = 
  juntarPalabra palabra == invertirPalabra palabra
