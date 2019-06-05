{-
Definí la función es hayAlgunMultiploDe, que recibe un número y una lista,
y devuelve si es el numero es múltiplo de alguno de los elementos de la lista.

Ej:
Main> hayAlgunMultiploDe 3 [4, 5, 6]
True

Main> hayAlgunMultiploDe 2 [7, 9, 67]
False
-}

hayAlgunMultiploDe :: Int -> [Int] -> Bool
hayAlgunMultiploDe posibleDivisor =
  any (\multiplo -> (==0) $ mod multiplo posibleDivisor) 
  