{-
    -El tipo de dato "Sexo" tiene dos constructores "Femenino" y "Masculino"
    
-}
data Sexo = Femenino | Masculino


data Persona = Persona{
    nombre :: String,
    edad :: Int,
    sexo :: Sexo
}

juan = Persona{
    nombre = "juan",
    edad = 19
}

-- funciones
edadJubilatoria :: Sexo -> Int
edadJubilatoria Femenino = 60
edadJubilatoria Masculino = 65
