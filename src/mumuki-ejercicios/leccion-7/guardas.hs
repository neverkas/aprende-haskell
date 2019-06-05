nivelDeIngles numero    | numero < 5 = "intermediate" -- el primero ya dice que tipado será nivelDeIngles :: Int -> String
                        | numero < 3 = "begginer" -- "no va a funcionar, deberia estar primero"
                        | numero > 10 = "advanced"
                        -- | numero < 7 = 3 -- # ESTA MAL, DEBE SER SOLO "STRING"
                        | otherwise = "desconocido"
{-
 1) El orden de las condiciones es importante
    -La segunda condicion de "nivelDeIngles" no funciona, ya que la primera es más importante
 
 2) El tipo que devuelve, debe ser el mismo en todas las guardas
    En el ej. "nivelDeIngles" son todos String, estaría "MAL" si alguno fuera del tipo Int
    # NOTA: lo mismo sucede con los "PATRONES"
 
 3) La primera condición ya indica que el tipado será como ese

 3) -El "otherwise" funciona como un "else"
    -Sino se cumple ninguna de las otras condiciones, se ejecuta esta otra
-}

categoriaJovenes edad   | edad < 5 = "ninio"
                        | edad > 18 = "adulto"
                        | otherwise = "adolescente"

main = do 
    
    print(nivelDeIngles 1)
    print(nivelDeIngles 6)
    print(nivelDeIngles 300)

    print(categoriaJovenes 3)
    print(categoriaJovenes 15)
    print(categoriaJovenes 19)