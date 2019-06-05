{-
sumarSegun id [1,2,5]
9

sumarSegun length ["hola", "todo","el","mundo"]
15

--Main>foldl (+) 1 [1,1,1]
-- 4
1er argumento la funcion que aplica al 2do (valor) y 3ro argumento (lista)
2do argumento es la "semilla" (caso base en la recursividad), 
    es valor inicial con el que empieza la funcion "foldl"
3ro argumento es la lista donde se aplica la funcion

-}

sumarSegun :: (a->Int) -> [a] -> Int
sumarSegun funcion lista =
    sum (map funcion lista)

sumarSegun' funcion (x:xs) =
    foldl (+) x xs

sumarSegun'' funcion =
    (foldl (+) 1) . (map funcion)
    
multiplicarTodos lista = 
    foldl (*) 1 lista

