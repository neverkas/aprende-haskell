{-
    # NOMBRE ES PAR
-}
nombreEsPar :: String -> Bool
--nombreEsPar = even . length -- no anda (nose xq)
--nombreEsPar nombre = even (length nombre)
nombreEsPar nombre = (even . length) nombre
