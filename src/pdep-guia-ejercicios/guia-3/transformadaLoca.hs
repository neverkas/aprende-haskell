esMenorA :: Int -> Int -> Bool
esMenorA n = (<n)

esParOImpar :: Int -> Bool
esParOImpar n = even n || odd n

sumaLoca :: Int -> Int
sumaLoca numero 
  | even numero = numero + 2
  | otherwise = numero + 1

transformadaLoca :: [Int] -> [Int]
transformadaLoca [] = []
transformadaLoca (x:xs) 
  | esMenorA 19 x && esParOImpar x = sumaLoca x : transformadaLoca xs
