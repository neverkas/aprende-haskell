module KarsParte2 where

    import Text.Show.Functions
    
    {- ##########################
        FUNCIONES EXTRA 
    ############################# -}
    
    largoPista = 1000
    
    duplicarVelocidad :: Float -> Float 
    duplicarVelocidad = (*2)
    
    aumentarEn :: Float -> Float -> Float
    aumentarEn numero = (numero+)
    
    aumentarUnQuintoDe :: Float -> Float -> Float
    aumentarUnQuintoDe numero = aumentarEn (numero*0.2) -- 0.20 es 1/5
    
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
    hayCantidadVocalesMayorA numero = (>numero) . cantidadVocales
    
    hayCantidadVocalesEntre :: Int -> Int -> String -> Bool
    hayCantidadVocalesEntre desde hasta palabra = 
        cantidadVocales palabra >= desde && cantidadVocales palabra <= hasta
    
    tieneNafta :: Auto -> Bool 
    tieneNafta = (>0) . nivelDeNafta
    
    usarTruco :: Auto -> Auto
    usarTruco auto = (truco auto) auto
    
    {- ##########################
        MODELADO 
    ############################# -}
    
    type Participante = Auto -> Auto
    type Truco = Auto -> Auto 
    
    data Auto = Auto {
        nombre :: String,
        nivelDeNafta :: Float, 
        velocidad :: Float,
        nombreDeEnamorade :: String,
        truco :: Truco
    } deriving (Show)
    
    
    {- ##########################
        MODELADO TRUCOS
    ############################# -}
    
    --De reversa esta más adelante-- 
    
    impresionar :: Truco
    impresionar auto = auto {
        velocidad = (duplicarVelocidad . velocidad) auto
    }
    
    nitro :: Truco
    nitro auto = auto {
        velocidad = (aumentarEn 15 . velocidad) auto
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
    puedeRealizarTruco auto = velocidad auto < 100 && tieneNafta auto
        
    comboLoco :: Truco
    comboLoco = deReversa . nitro
    
    turbo :: Truco
    turbo (Auto nombre nivelDeNafta velocidad nombreDeEnamorade truco) =
        Auto nombre 0 (aumentarEn velocidad (nivelDeNafta*10)) nombreDeEnamorade truco                
    
    queTrucazo :: String -> Participante
    queTrucazo nombre = incrementarVelocidad . fingirAmor nombre
    
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
    
    ----------------
    ----------------
    --- PARTE 2 ----
    ----------------
    ----------------
    
    -------------------------
    --- MODELADO CARRERA ----
    -------------------------
    
    type Trampa = Carrera -> Carrera
    
    data Carrera = Carrera {
        vueltasACorrer :: Int,
        longitudPista :: Float,
        integrantesPublico :: [String],
        trampa :: Trampa,
        participantes :: [Auto]
    } deriving (Show)
    
    potreroFunes = Carrera {
        vueltasACorrer = 3,
        longitudPista = 5.0,
        integrantesPublico = ["Ronco", "Tinch", "Dodain"],
        trampa = sacarAlPistero,
        participantes = [rochaMcQueen, biankerr, gushtav, rodra]
    } 
    
    -- DE REVERSA --
    
    deReversa :: Truco
    deReversa auto = auto {
        -- en la entrega anterior se utilizaba como referencia el largo de la pista
        --nivelDeNafta = (aumentarUnQuintoDe largoPista . nivelDeNafta) auto         
        nivelDeNafta = (aumentarUnQuintoDe (velocidad auto) . nivelDeNafta) auto
    }
    
    -------------
    -- TRAMPAS -- 
    -------------
    
    sacarAlPistero :: Trampa
    sacarAlPistero carrera = carrera {
        participantes = drop 1 $ participantes carrera
    }
    
    lluvia :: Trampa
    lluvia carrera = carrera {
      participantes = map disminuirVelocidadEn10 $ participantes carrera
    }
    
    neutralizarTrucos :: Trampa
    neutralizarTrucos carrera = carrera {
        participantes = map inutilizarAuto $ participantes carrera
    }
    
    pocaReserva :: Trampa
    pocaReserva carrera = carrera {
        participantes = filter ((>= 30) . nivelDeNafta) $ participantes carrera
    }
    
    podio :: Trampa
    podio carrera = carrera {
        participantes = take 3 $ participantes carrera
    }
    
    -- Funciones Auxiliares Del Punto 2 -- 
    
    disminuirVelocidadEn10 :: Truco
    disminuirVelocidadEn10 auto = auto {
        velocidad = aumentarEn (-10) . velocidad $ auto
    }
    
    inutilizarAuto :: Auto -> Auto
    inutilizarAuto auto = auto {
        truco = inutilidad
    }
    
    inutilidad :: Truco 
    inutilidad auto = auto
    
    -----------------
    -- A CORRER !! -- 
    -----------------
    
    -- ITEM 1 --
    
    darVuelta :: Carrera -> Carrera
    darVuelta carrera = (trampa carrera) . hacerTrucoSegunEnamorade . restarCombustibleATodos $ carrera
    
    -- Funciones Auxiliares Del Punto 3.1 -- 
    
    restarCombustibleATodos :: Carrera -> Carrera
    restarCombustibleATodos carrera = carrera {
        participantes = map (restarCombustible $ longitudPista carrera) $ participantes carrera
    }
    
    calcularFormula :: Float -> Auto -> Float
    calcularFormula kmDeLaPista = (kmDeLaPista / 10 *) . velocidad

    restaEntrePositivos :: Float -> Float -> Float
    restaEntrePositivos numero1 numero2 = max 0 $ numero1 - numero2

    restarCombustible :: Float -> Auto -> Auto 
    restarCombustible kmDeLaPista auto = auto {
        nivelDeNafta = restaEntrePositivos (nivelDeNafta auto) (calcularFormula kmDeLaPista auto)
    }
    
    hacerTrucoSegunEnamorade :: Carrera -> Carrera
    hacerTrucoSegunEnamorade carrera =  carrera {
        participantes = map (hacerSegunEnamorade $ integrantesPublico carrera) $ participantes carrera 
    }
    
    hacerSegunEnamorade :: [String] -> Auto -> Auto
    hacerSegunEnamorade enamorades auto 
      | estaEnamoradeEnElPublico auto enamorades = hacerTrucoDelAuto auto
      | otherwise = auto
    
    hacerTrucoDelAuto :: Auto -> Auto
    hacerTrucoDelAuto auto = truco auto $ auto
    
    estaEnamoradeEnElPublico :: Auto -> [String] -> Bool
    estaEnamoradeEnElPublico auto = elem (nombreDeEnamorade auto)
    
    -- ITEM 2 -- 
    
    correrCarrera :: Carrera -> Carrera
    correrCarrera carrera = (!!) (aplicarDarVuelta carrera) $ vueltasACorrer carrera 
    
    -- Funciones Auxiliares Del Punto 3.2 -- 
    
    aplicarDarVuelta :: Carrera -> [Carrera]
    aplicarDarVuelta carrera = autosDespuesDeLaVuelta carrera $ iterate darVuelta carrera
    
    --autosDespuesDeLaVuelta :: Carrera -> [a] -> [a]
    autosDespuesDeLaVuelta carrera = take (vueltasACorrer carrera + 1)
    
    -- sin delegar -- 
    --correrCarrera' :: Carrera -> Carrera
    --correrCarrera' carrera = (!!) (take (vueltasACorrer carrera + 1 ) $ iterate darVuelta carrera) (vueltasACorrer carrera)  
    
    -------------------
    -- QUIEN GANA ?? --
    -------------------
    
    quienGana :: Carrera -> Auto
    quienGana carrera = elMasRapidoDeTodos (participantes $ correrCarrera carrera) 
    
    -- Funciones Auxiliares Del Punto 4 -- 
    
    elMasRapidoDeTodos :: [Auto] -> Auto
    elMasRapidoDeTodos = foldr1 elMasRapidoEntre2   
    
    elMasRapidoEntre2 :: Auto -> Auto -> Auto 
    elMasRapidoEntre2 auto1 auto2 
     | velocidad auto1 > velocidad auto2 = auto1 
     | otherwise = auto2 
    
    -------------------
    -- EL GRAN TRUCO --
    -------------------
    
    trucos = [nitro, deReversa, impresionar]
    
    elGranTruco :: Auto -> [Truco] -> Auto 
    elGranTruco auto = foldl aplicarTruco auto  
    
    aplicarTruco :: Auto -> Truco -> Auto
    aplicarTruco auto unTruco = unTruco $ auto