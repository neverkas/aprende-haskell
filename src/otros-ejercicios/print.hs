module Print where

saludar :: String -> String
saludar x = "Bienvenido " ++ x

main :: IO ()
{-
El tipado de main es IO, porque:
-I se refiere a Input (entrada de datos)
-O se refiere Output (salida de datos)
-}

main = do
  putStrLn saludos
  -- con "putStrLn" es imprimir en pantalla un String y además hacer un salto de linea 
  where saludos = saludar "Jelou"
  -- con "where" defino que "saludos" es una variable local,
  -- y le asigno la funcion "saludar" con un argumento un nombre
