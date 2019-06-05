estudiantes = [("Matias", 12), ("Fede", 15), ("Pedro", 19)]
nombres = ["Matias","Perez", "Carlos", "Matias"]
numeros = [1,2,3,4,5,6,7,8]

miFiltro ::  (a -> Bool) -> [a] -> [a]
miFiltro = filter
{-
    "miFiltro" cumple la misma función que "filter"
    1. Recibe como primer argumento una función (a -> Bool)
        -El único argumento es "a" y puede ser de cualquier tipo
        -Devuelve un valor Booleano si se cumple la condición con el operador relacional/comparación
    2. Recibe como segundo argumento una lista
        -Puede ser de cualquier tipo, pero del mismo tipo que lo que compara la función anterior
    3. La función devuelve una lista
        -Del mismo tipo que recibió como argumento
-}

-- Filtro lista de tuplas
esMenor = (<18) . snd
menores = filter esMenor 

numerosPares = filter even
--cuantosMatias estudiantes = filter (=="Matias")

main = do
    -- Filtro la lista de Strings ["abc", "cbc", ..]
    -- Que muestre sólo los que digan "Matias"
    -- # Lista: ["Matias","Perez", "Carlos", "Matias"]
    -- # Lista filtrada: ["Matias", "Matias"]
    print(miFiltro (=="Matias") ["Matias","Perez", "Carlos", "Matias"])
    print(miFiltro (=="Matias") nombres) -- la lista de string (cadenas de caracteres), la guardé en "nombres"

    -- Filtro de la lista de numeros naturales [1,2,3...]
    -- Que muestre solo los numeros pares (el resto por dividir por dos es cero)
    -- # Lista: [1,2,3,4,5,6,7,8]
    -- # Lista filtrada: [2,4,6,8]
    print(numerosPares [1,2,3,4,5,6,7,8])
    print(numerosPares numeros) -- la lista de números naturales la guardé en "numeros"

    -- Filtro una lista de tuplas [(a,b), ...]
    -- # Lista: [("Matias", 12), ("Fede", 15), , ("Pedro", 19)]
    -- # Lista filtrada: [("Matias", 12), ("Fede", 15)]
    print(menores [("Matias", 12), ("Fede", 15), ("Pedro", 19)]) 
    print(menores estudiantes) -- la lista de tuplas la guardé en "estudiantes"

