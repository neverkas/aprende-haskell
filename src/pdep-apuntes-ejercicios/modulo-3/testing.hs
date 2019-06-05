{-
    numero 
    minimo = 2,
    maximo = numero-1
-}

-- utilizo guardas (no se agrega el operador igual)
-- los "|" son pipe que determinan la condición
noHayDivisores minimo maximo numero
    -- verifico si "numero" tiene un divisor, si se cumple entonces tiene divisores
    -- (es divisor si la division da resto cero)
    | mod numero minimo == 0 = False
    -- si son iguales es que "numero" no tiene divisores
    -- (toda division del numero con sus anteriores da distinto a cero)
    | minimo == maximo       = True
    -- sino se cumplen las condiciones incremento "minimo" hasta que llege al máximo
    | otherwise = noHayDivisores (minimo+1) maximo numero

-- utilizo pattern matching y recursividad
primo 1 = True
primo 2 = False
primo n = noHayDivisores 2 (n-1) n

main = do
    -- Ej. n = 7 
    -- True porque 7 es primo, no tiene divisores entre 2 y 6
    print(noHayDivisores 2 6 7) -- n = 7
    print(noHayDivisores 2 (7-1) 7) -- n = 7
    print(noHayDivisores 6 6 7) -- n = 7

    
    {-
    1. mod 7 1 == 0?
    -}