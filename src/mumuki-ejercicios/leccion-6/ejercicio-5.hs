esPar :: Int -> Bool
esPar = even

suma :: Int -> Int -> Int
suma = (+)

sumaEsPar :: Int -> Int -> Bool
sumaEsPar a = esPar . (suma a)
