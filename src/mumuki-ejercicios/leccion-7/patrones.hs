esVocal 'a' = True -- el primero ya define que el tipado será esVocal :: Char -> Bool
--esVocal 3 = False -- #ESTA MAL, el parametro solo puede ser Char
--esVocal 'a' = 1 -- # ESTA MAL, lo que devuelve solo puede ser Bool
esVocal 'e' = True
esVocal 'i' = True
esVocal 'o' = True 
esVocal 'u' = True
esVocal _ = False -- el guión bajo se conoce por "variable anónima", reemplaza las demás opciones posibles

esCero 0 = True
esCero _ = False
{-
 1. El guion bajo se conoce como "variable anónima",
 2. Sustituye a cualquier valor que no cumpla con los anteriores 'a','e','i',...
    en caso que escriban una 'z', ó 'f', ..
-}

main = do 
    print(esVocal 'a') -- devuelve True
    print(esVocal 'z') -- devuelve False
    --print(esVocal 3) -- tira error, porque no es del tipo Char

    print(esCero 0) -- retorna True
    print(esCero 3) -- retorna False
    --print(esCero 'a') -- tira error, porque no es del tipo Int