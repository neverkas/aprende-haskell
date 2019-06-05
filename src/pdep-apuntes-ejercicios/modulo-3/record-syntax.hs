{-
    cuando un constructor de tipo data,
    necesita muchos datos, se puede modelar 
    de la sig manera.

    al agregar "deriving (Show)" despues del constructor
    te permite mostrar los datos cuando ingresas "juan" en la consola
-}
data Persona = Persona {
    nombre :: String,
    edad :: Int,
    notas :: (Int, Int, Int)
} deriving (Show)


{-
    para crear un modelo nuevo del tipo "Persona",
    se puede cargar informacion de la misma forma,
    se puede alterar el orden
-}
juan = Persona{
    nombre = "Juan",
    edad = 19,
    notas = (10, 9, 8)
}

{-
    no es necesario crear una funcion "nombre" ó "edad"
    se crean de forma automática
-}
main = do 
    print(nombre juan)
    print(edad juan)