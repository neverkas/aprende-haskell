{-
"data" sirve para modelar tipos
la diferencia con las "tuplas"
es que el tipado es más entendible

ej.:
> :t nombre
Alumno -> String

Alumno sería el "constructor"
-}
data Alumno = Alumno String Int

nombre (Alumno nombre edad) = nombre
edad (Alumno nombre edad) = edad

mayorDeEdad = (> 18)

esMayorDeEdad :: Alumno -> Bool
esMayorDeEdad = mayorDeEdad . edad

main = do 
    print(nombre (Alumno "carlos" 33))
    print(edad (Alumno "carlos" 33))
