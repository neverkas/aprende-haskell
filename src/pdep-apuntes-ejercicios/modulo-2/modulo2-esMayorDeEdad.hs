{-
    # ES MAYOR DE EDAD
-}
-- snd obtiene de dos valores, el segundo
-- snd ("carlos", 39) retorna 39
edad = snd
mayorDeEdad :: Int -> Bool
mayorDeEdad num = num > 18

type Persona = (String, Int)

--esMayorDeEdad :: (String, Int) -> Bool
esMayorDeEdad :: Persona -> Bool
esMayorDeEdad = mayorDeEdad . edad

esMenorDeEdad :: Persona -> Bool
--esMenorDeEdad edad = not (mayorDeEdad edad)
esMenorDeEdad = not . mayorDeEdad . edad

carlos = ("carlos", 20)
