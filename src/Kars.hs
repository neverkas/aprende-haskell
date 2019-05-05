module Kars where

import Text.Show.Functions

{- ##########################
    FUNCIONES EXTRA 
############################# -}

duplicarVelocidad :: Float -> Float 
duplicarVelocidad = (*2)

aumentarEn :: Float -> Float -> Float
aumentarEn n = (n+)

aumentarUnQuintoDe :: Float -> Float -> Float
aumentarUnQuintoDe n = aumentarEn (n*0.2) -- 0.20 es 1/5

esVocal :: Char -> Bool
esVocal 'a' = True
esVocal 'e' = True 
esVocal 'i' = True 
esVocal 'o' = True 
esVocal 'u' = True 
esVocal _   = False

cantidadVocales :: String -> Int
cantidadVocales = length . filter (esVocal) 

hayCantidadVocalesMayorA :: Int -> String -> Bool
hayCantidadVocalesMayorA n = (>n) . cantidadVocales

hayCantidadVocalesEntre :: Int -> Int -> String -> Bool
hayCantidadVocalesEntre desde hasta palabra = 
    cantidadVocales palabra >= desde && cantidadVocales palabra <= hasta

usarTruco :: Auto -> Auto
usarTruco auto = (truco auto) auto

{- ##########################
    MODELADO 
############################# -}

type Participante = Auto -> Auto
type Truco = Auto -> Auto 

data Auto = Auto{
    nombre :: String,
    nivelDeNafta :: Float, 
    velocidad :: Float,
    nombreDeEnamorade :: String,
    truco :: Truco
} deriving (Show)


{- ##########################
    MODELADO TRUCOS
############################# -}

deReversa :: Truco
deReversa auto = auto {
    nivelDeNafta = ((aumentarUnQuintoDe 1000) . nivelDeNafta) auto 
}

impresionar :: Truco
impresionar auto = auto {
    velocidad = (duplicarVelocidad . velocidad) auto
}

nitro :: Truco
nitro auto = auto{
    velocidad = ((aumentarEn 15) . velocidad) auto
}

fingirAmor :: String -> Truco
fingirAmor nuevoNombreDeEnamorade auto = auto{
    nombreDeEnamorade = nuevoNombreDeEnamorade
}

incrementarVelocidad :: Participante
incrementarVelocidad auto 
    | ((hayCantidadVocalesEntre 1 2) . nombreDeEnamorade) auto = auto {
        velocidad = (aumentarEn 15 . velocidad) auto
        }
    | ((hayCantidadVocalesEntre 3 4) . nombreDeEnamorade) auto = auto {
        velocidad = (aumentarEn 20 . velocidad) auto
        }
    | ((hayCantidadVocalesMayorA 4) . nombreDeEnamorade) auto = auto {
        velocidad = (aumentarEn 30 . velocidad) auto
        }
    | otherwise = auto

puedeRealizarTruco :: Auto -> Bool
puedeRealizarTruco (Auto _ nivelDeNafta velocidad _ _) = 
    nivelDeNafta > 0 && velocidad < 100

comboLoco :: Truco
comboLoco = deReversa . nitro

turbo :: Truco
turbo (Auto nombre nivelDeNafta velocidad nombreDeEnamorade truco) =
    Auto nombre 0 (aumentarEn velocidad (nivelDeNafta*10)) nombreDeEnamorade truco                

queTrucazo :: String -> Participante
queTrucazo nombre = (incrementarVelocidad . fingirAmor nombre)

{- ##########################
    MODELADO AUTOS
############################# -}

rochaMcQueen :: Auto
rochaMcQueen = Auto {
    nombre = "RochaMcQueen",
    nivelDeNafta = 300,
    velocidad = 0,
    nombreDeEnamorade = "Ronco",
    truco = deReversa
}

biankerr :: Auto
biankerr = Auto {
    nombre = "Biankerr",
    nivelDeNafta = 500,
    velocidad = 20,
    nombreDeEnamorade = "Tinch",
    truco = impresionar
}

gushtav :: Auto
gushtav = Auto {
    nombre = "Gushtav",
    nivelDeNafta = 200,
    velocidad = 130,
    nombreDeEnamorade = "PetiLaLinda",
    truco = nitro
}

rodra :: Auto
rodra = Auto {
    nombre = "Rodra",
    nivelDeNafta = 0,
    velocidad = 50,
    nombreDeEnamorade = "Taisa",
    truco = fingirAmor "Petra"
}
                    