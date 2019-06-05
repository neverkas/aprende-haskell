
conjuncion [] = True
conjuncion (x:xs) = x && conjuncion xs

sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs 

productoria [] = 1
productoria (x:xs) = x * productoria xs

longitud [] = 0
longitud (x:xs) = 1 + longitud xs

existe :: Eq a => a -> [a] -> Bool
existe _ [] = False 
existe dato (x:xs) = dato == x || existe dato xs

--interseccion :: [a] -> [a] -> [a]
--interseccion [] [] =  []
--interseccion 
