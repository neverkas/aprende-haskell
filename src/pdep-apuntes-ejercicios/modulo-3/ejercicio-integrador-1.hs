{-
Si en una agencia de remises tenemos 
    -Autos propios, de los cuales sabemos el consumo en litros cada 10 kms
    -Autos contratados, de los cuales sabemos la empresa que nos provee el
     el auto y el costo final que nos cobra por kilómetro
-}

-- Creo un tipo "Auto" que tiene dos constructores "Propio/Contratado"
data Auto = Propio Float | Contratado String Float
type Autos = [Auto]

autos :: Autos
autos = [Propio 5, Propio 3, Contratado "Remices" 100]

valorLitroNafta :: Float
valorLitroNafta = 20 -- en pesos argentinos

costoPorKm :: Auto -> Float
costoPorKm (Propio consumo) = valorLitroNafta * (consumo / 10)
costoPorKm (Contratado _ costo) = costo