calcularPromedio :: [Float] -> Float
calcularPromedio lista = 
  (sum lista) / fromInteger(toInteger(length lista))

promedios :: [[Float]] -> [Float]
promedios [] = []
promedios (x:xs) = 
  calcularPromedio x : promedios xs