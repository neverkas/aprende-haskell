module KarsParte2Spec (spec) where

import Test.Hspec
import KarsParte2

spec :: Spec
spec = do
    {-
    # PUNTO 3.0
    -}
    describe "Consultar la nafta de rochaMcQueen luego de hacer su truco favorito" $ do 
        it "nivelNafalta es 300" $ do
            (nivelDeNafta . truco rochaMcQueen) rochaMcQueen `shouldBe` 300

    describe "Consultar la nafta de rodra tras deReversa" $ do 
        it "nivelNafalta es 10" $ do
            (nivelDeNafta . deReversa) rodra `shouldBe` 10

    {-
    # PUNTO 3.2
    -}
    describe "Consultar la cantidad de participantes luego de sacarAlPistero en potreroFunes" $ do 
        it "la cantidad de participantes es 3" $ do
            (length . participantes . sacarAlPistero) potreroFunes `shouldBe` 3
    
    describe "rochaMcQueen ya no participa en potreroFunes tras sacarAlPistero" $ do 
        it "debe ser True" $ do
            (not . elem "RochaMcQueen" $ map (nombre) ((participantes.sacarAlPistero)  potreroFunes)) `shouldBe` True

    describe "Consultar la cantidad de participantes luego de pocaReserva en potreroFunes" $ do 
        it "la cantidad de participantes es 3" $ do
            (length . participantes . pocaReserva) potreroFunes `shouldBe` 3
    
    describe "El participante llamado “rodra” ya no debería estar entre los participantes de potreroFunes luego de aplicar pocaReserva" $ do 
        it "debe ser True" $ do
            (not . elem "Rodra" $ map (nombre) ((participantes.pocaReserva)  potreroFunes)) `shouldBe` True
            
    describe "Consultar la cantidad de participantes luego de aplicar podio en potreroFunes" $ do 
        it "la cantidad de participantes es 3" $ do
            (length . participantes . podio) potreroFunes `shouldBe` 3

    describe "Consultar la velocidad del último participante de potreroFunes (rodra) luego de la lluvia" $ do 
        it "la velocidad es 40" $ do
            (velocidad . last . participantes . lluvia) potreroFunes `shouldBe` 40
        
    {-
    # PUNTO 3.3
    -}
    describe "Consultar el nivel de nafta del primer participante (biankerr porque rochaMcQueen quedó afuera)  luego de dar una vuelta en potreroFunes" $ do 
        it "el nivel de nafta es 490" $ do
            (nivelDeNafta.head.participantes.darVuelta) potreroFunes `shouldBe` 490
        
    describe "Consultar la velocidad del primer participante (biankerr porque rochaMcQueen quedó afuera) luego de dar una vuelta en potreroFunes" $ do 
        it "la velocidad es 40" $ do
            (velocidad.head.participantes.darVuelta) potreroFunes `shouldBe` 40
        
    describe "Consultar la cantidad de participantes tras dar dos vueltas en potrero funes" $ do 
        it "la cantidad de participantes es 2" $ do
            (length.participantes.darVuelta.darVuelta) potreroFunes `shouldBe` 2
        
    describe "Luego de 2 vueltas en potreroFunes, consultar el nivelDeNafta del primer participante (gushtav)" $ do 
        it "la velocidad es 70" $ do
            (nivelDeNafta.head.participantes.darVuelta.darVuelta) potreroFunes `shouldBe` 70

    describe "Rodra debe ser el único participante luego de correr la carrera de potreroFunes" $ do 
        it "debe ser True" $ do
            (elem "Rodra" $ map nombre ((participantes.correrCarrera) potreroFunes)) `shouldBe` True

    {-
    # PUNTO 3.4
    -}
    describe "Consultar el ganador de potreroFunes" $ do 
        it "el ganador es rodra" $ do
            (nombre.quienGana $ potreroFunes) `shouldBe` "Rodra"

    {-
    # PUNTO 3.5
    -}
    describe "Consultar la velocidad de rodra tras realizar elGranTruco con nitro, deReversa e impresionar" $ do 
        it "la velocidad es 130" $ do
            (velocidad $ elGranTruco rodra [nitro, deReversa, impresionar]) `shouldBe` 130
            
    describe "Consultar el nivelDeNafta de rodra tras realizar elGranTruco con nitro, deReversa e impresiona" $ do 
        it "la velocidad es 13" $ do
            (nivelDeNafta $ elGranTruco rodra [nitro, deReversa, impresionar]) `shouldBe` 13
        

    