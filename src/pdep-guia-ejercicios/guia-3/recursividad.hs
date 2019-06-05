{-- REPETIR --}
repetir :: Int -> a -> [a]
repetir 0 dato = []
--repetir 1 dato = [dato] -- con esto rompe si ponen n=0, recursividad infinita
repetir n dato = dato : repetir (n-1) dato

repetir' :: Int -> a -> [a]
repetir' n dato 
    | n == 0 = []
    | otherwise = dato : repetir' (n-1) dato
    
{-- ELEM --}
-- Main>elem 3 [1,2,3]
elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' dato (x:xs) = dato == x || elem' dato xs

{-
elem'' :: Eq a => a -> [a] -> Bool
elem'' dato lista 
    | null lista = False
    | otherwise = dato == (head lista) || elem'' dato (tail lista)
-}

{- ZIP -}
-- Main> zip' [1,2,3] [1,1,1]
zip' :: [a] -> [a] -> [(a, a)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys


main = do
    print $ repetir 3 5
    print $ repetir' 3 5
    -- [5,5,5]