{-
# Enunciado:
Definí la función esMultiploDe, que dados dos números devuelve 
si el primero es múltiplo del segundo (que sorpresa, ¡eh!), 
utilizando aplicación parcial y composición. Ejemplo

# Ejemplo
> esMultiploDe 12 3
  True
-}


elResto :: Int -> Int -> Int
elResto = mod

esCero :: Int -> Bool
esCero = (== 0)

esMultiploDe :: Int -> Int -> Bool
esMultiploDe a = esCero . elResto a
-- Si a "elResto" le paso como parametros "a b" deja de ser una función
-- y pasa a ser un valor.
-- Al pasar solo un parámetro a "elResto", queda "b" como incognita 
-- y pasa a ser una función

--main = do
 --print(esMultiploDe 12 3) -- False
 --print(esMultiploDe 12 4) -- True
