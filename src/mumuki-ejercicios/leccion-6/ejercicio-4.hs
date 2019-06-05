triple :: Int -> Int
triple = (*3)

sumar :: Int -> Int -> Int
sumar = (+)

sumarNumeroAlTriple :: Int -> Int -> Int
sumarNumeroAlTriple a = sumar  . (triple a)
