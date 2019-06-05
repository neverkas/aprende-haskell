{-
Ejercicio 3:  dobleDelLargo

Escribí la función dobleDelLargo, que da el doble del largo de una palabra.
Hacelo usando la función length, aplicación parcial y composición.

Ej.
> dobleDelLargo "aloha"
  10
> dobleDelLargo "ay caramba"
  20

-}

doble :: Int -> Int
doble = (*2)

dobleDelLargo :: String -> Int
dobleDelLargo = doble . length
