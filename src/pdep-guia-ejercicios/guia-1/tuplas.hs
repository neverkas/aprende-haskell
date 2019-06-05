{-
4.7 Definir la función calcular, que recibe una tupla de 2 elementos, si el primer
elemento es par lo duplica, sino lo deja como esta y con el segundo elemento en caso de
ser impar le suma 1 y si no deja esté último como esta. 
-}

esPar = (==0) . (flip mod 2)
esImpar = not . esPar

calcular (a, b)
    | esPar a = (a*2, b)
    | esImpar b = (a, b+1)
    | esPar a && esImpar b = (a*2, b+1)
    | otherwise = (a,b)
