alumno = ("Juan", (10,10,10))


--notas (_, n) = n
nombre = fst
notas = snd

main = do     
    putStrLn "nombre del alumno:"
    print(nombre alumno)
    putStrLn "notas del alumno:"
    print(notas alumno)
