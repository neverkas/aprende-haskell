filtrar :: (a->Bool) -> [a] -> [a]

-- 1. Caso base
-- 1.1 como primer argumento le paso la variable anónima que es el guión bajo, 
-- que es la función/criterio del tipo booleana, pero no nos interesa para el caso base
-- 1.2 si la lista está vacía, es que recorrió todos los elementos, y los evaluó a todos
filtrar _ [] = []
-- 2. Caso recursivo
-- 2.1 Partimos la lista en dos cabeza(x):cola(xs)
filtrar criterio (x:xs) 
    -- y nos manejamos con guardas para aplicar las condiciones 
    -- si los elementos que saco de la cabeza de la lista cumplen el criterio,
    -- en ese caso devolvemos el elemento "x" en una nueva lista, y seguimos recorriendo los demás
  | criterio x = x : filtrar criterio xs
  -- en caso de no cumplirse la condición, es necesario especificar que igual debe seguir recorriendo la lista
  -- caso contrario no se estan evaluando si se cumple o no y el compilador nos avisaría que faltan patrones
  | otherwise = filtrar criterio xs
