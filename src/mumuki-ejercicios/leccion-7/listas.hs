numeros = [3,2,4,6,8]

primerNumero :: [Int] -> Int
{-
    Para tipar una lista se agrega corchetes []
-}
primerNumero lista = head lista
primerNumeroEsPar lista = even (head lista)
listaSumarDos lista = map (+2) lista
{-
    La función "map", permite aplicar funciones a listas
-}

main = do
    print(primerNumero numeros)
    print(primerNumero [2,4,6])
    print(primerNumeroEsPar [2,4,6])
    print(listaSumarDos [2,4,6])