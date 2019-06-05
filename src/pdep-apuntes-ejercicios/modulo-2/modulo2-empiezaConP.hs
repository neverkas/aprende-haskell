{-
    # EMPIEZA CON 'p'

    Probar en la terminal (('p'==) . head) "carlos"
-}

--primerLetra palabra = head palabra
primerLetra :: String -> Char
primerLetra = head

laLetraEsP :: Char -> Bool
laLetraEsP = (== 'p')
--laLetraEsP letra = letra == 'p'

palabraEmpiezaConP :: String -> Bool
--palabraEmpiezaConP palabra = laLetraEsP (primerLetra palabra)
palabraEmpiezaConP = (laLetraEsP . primerLetra)