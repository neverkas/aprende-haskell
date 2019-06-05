{-
Definir la función aprobo, que dada la lista de las notas de un alumno 
devuelve si el alumno aprobó. Se dice que un alumno aprobó si todas sus 
notas son 4 o más.

Ejemplo:
Main> aprobo [8,6,2,4]
False

Main> aprobo [7,9,4,5]
True
-}
estaAprobada = (>=4)

aprobo :: [Int] -> Bool
aprobo (primerNota:xs) =
 foldl (\nota otraNota -> nota && estaAprobada otraNota) (estaAprobada primerNota) xs
