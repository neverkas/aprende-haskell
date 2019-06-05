menoresA :: Int -> [Int] -> [Int]
-- 1. caso base
-- 1.1 no interesa el primer argumento
-- 1.2 devolver una lista vacía si ya no hay elementos por correr
menoresA _ [] = []
-- 2. caso recursivo
-- 2.1 paso el valor que voy a evaluar
-- 2.2 parto la lista en cabeza:cola
menoresA numero (x:xs)
-- 2.3 si el primer elemento de la lista original (cabeza) es menor al numero N a evaluar, devuelvo una nueva lista con primer elemento la cabeza de la lista original, y sigo evaluando N con el resto de la lista original
  | x < numero = x : menoresA numero xs
 -- 2.4 si el primer elemento de la lista original (Cabeza) es mayor al numero N a evaluar, no devuelvo una nueva lista con este, sólo sigo evaluando con el resto de al lista
  | otherwise = menoresA numero xs

-- el punto 2.4 es importante, sino se analiza el caso contrario Haskell dirá que faltan patrones
