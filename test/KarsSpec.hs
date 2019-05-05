module KarsSpec (spec) where

import Test.Hspec
import Kars

spec :: Spec
spec = do
    describe "Consultar la nafta de RochaMcQueen luego de realizar su truco" $ do 
        it "nivelNafalta es 500" $ do
            (nivelDeNafta . truco rochaMcQueen) rochaMcQueen `shouldBe` 500

    describe "Consultar la velocidad de Biankerr luego de realizar su truco" $ do 
        it "velocidad es 40" $ do 
            (velocidad . usarTruco) biankerr `shouldBe` 40

    describe "Consultar la velocidad de Gushtav luego de realizar su truco" $ do 
        it "velocidad es 145" $ do 
            (velocidad . usarTruco) gushtav `shouldBe` 145

    describe "Consultar la enamorada de Rodra cuando elige a Petra." $ do 
        it "velocidad es 40" $ do 
            (nombreDeEnamorade . fingirAmor "Petra") rodra `shouldBe` "Petra"
            
    describe "Consultar la velocidad de RochaMcQueen luego de incrementar su velocidad" $ do 
        it "velocidad es 15" $ do 
            (velocidad . incrementarVelocidad) rochaMcQueen `shouldBe` 15

    describe "Consultar la velocidad de Biankerr luego de incrementar su velocidad" $ do 
        it "velocidad es 35" $ do 
            (velocidad . incrementarVelocidad) biankerr `shouldBe` 35

    describe "Consultar la velocidad de Gushtav luego de incrementar su velocidad" $ do 
        it "velocidad es 160" $ do 
            (velocidad . incrementarVelocidad) gushtav `shouldBe` 160

    describe "Consultar la velocidad de Rodra luego de incrementar su velocidad" $ do 
        it "velocidad es 70" $ do 
            (velocidad . incrementarVelocidad) rodra `shouldBe` 70

    describe "Consultar si RochaMcQueen puede usar su truco" $ do 
        it "es True" $ do 
            puedeRealizarTruco rochaMcQueen `shouldBe` True

    describe "Consultar si Gushtav puede usar su truco" $ do 
        it "es False" $ do 
            puedeRealizarTruco gushtav `shouldBe` False
    
    describe "Consultar si Rodra puede usar su truco" $ do 
        it "es False" $ do 
            puedeRealizarTruco rodra `shouldBe` False

    -- # Punto 3.4
    describe "Consultar la nafta de Rocha luego de realizar comboLoco" $ do 
        it "nivelDeNafta es 500" $ do 
            (nivelDeNafta . comboLoco) rochaMcQueen `shouldBe` 500

    describe "Consultar la velocidad de Rocha luego de realizar comboLoco" $ do 
        it "velocidad es 15" $ do 
            (velocidad . comboLoco) rochaMcQueen `shouldBe` 15        

    describe "Consultar la velocidad de Rodra luego de utilizar que Trucazo cambiando su enamorada a Murcielago" $ do 
        it "velocidad es 80" $ do 
            (velocidad . queTrucazo "Murcielago") rodra  `shouldBe` 80

    describe "Consultar la velocidad de Gushtav luego de utilizar turbo" $ do 
        it "velocidad es 2130" $ do 
            (velocidad . turbo) gushtav `shouldBe` 2130
        
    describe "Consultar la nafta de Gushtav luego de utilizar turbo" $ do 
        it "nivelDeNafta es 0" $ do 
            (nivelDeNafta . turbo) gushtav `shouldBe` 0

    describe "Consultar la velocidad de Rodra luego de utilizar turbo" $ do 
        it "velocidad es 50" $ do 
            (velocidad . turbo) rodra `shouldBe` 50

    describe "Consultar la nafta de Rodra luego de utilizar turbo" $ do 
        it "nivelDeNafta es 0" $ do 
            (nivelDeNafta . turbo) rodra `shouldBe` 0
