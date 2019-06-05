{-
    La funcion "drop" remueve los primeros n elementos de la lista,
    y muestra los restantes.
    Ej.:
    > drop 2 [2,3,4,5]
      [4,5] -- removió el 2,3
    
-}

-- creo otra funcion parecida para probar la versión recursiva

--removerPrimerosN _ [] = []
--removerPrimerosN n xs | n <=0 = xs
removerPrimerosN 0 xs = xs
removerPrimerosN n (_:xs) = removerPrimerosN (n-1) xs
{-
    funcionLoca _ [] = []
    funcionLoca n xs | n <=0 = xs
    funcionLoca n (_:xs) = funcionLoca (n-1) xs

    funcionLoca 2 [2,3,4,5]
    [2,3,4,5] -- n=2, xs=[3,4,5]
    (2:[3,4,5]) -- ns=1, xs=[4,5]
    (2:(3:[4,5])) -- ns=0, devuelve [4,5]

    removerPrimerosN 2 [2,3,4,5]
    1. Pasa por "removerPrimerosN 0 xs = xs", como n=2, saltea la condición
    2. Pasa por "removerPrimerosN n (_:xs) = removerPrimerosN (n-1) xs"
    2.1 La función se llama a si misma (recursividad) y pasa dos argumentos
        el 1er argumento es el (2-1) es decir 1
        el 2do argumento es la cola osea [3,4,5]
    3. Pasa por "removerPrimerosN 0 xs = xs", como n=1 saltea la condición
    4. Pasa por "removerPrimerosN n (_:xs) = removerPrimerosN (n-1) xs"
    4.1 La función se llama a si misma (recursividad) y pasa dos argumentos
        el 1er argumento es (1-1) es 0
        el 2do argumento es la cola [4,5]
    5. Pasa por "removerPrimerosN 0 xs = xs", como n=0, termina 
        y devuelve la cola que es [4,5]
-}

main = do 
    print(removerPrimerosN 2 [2,3,4,5])