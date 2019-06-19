{-
El sistema de recursos humanos de una empresa tiene representados a los empleados, con la 
estructura que figura a posterior en data Empleado.
También tenemos disponibles algunos empleados de ejemplo para poder probar la solución.
Necesitamos desarrollar una función para conocer, a partir de un conjunto de empleados, cuáles son roles atareados. Se considera que un rol es atreado cuando la persona con dicho rol realiza dos tareas o más.
Resolver este problema usando composición, aplicación parcial y orden superior.

Ej.
data Empleado = Empleado {
  rol :: String,
  edad :: Int,
  tareas :: [String]
} deriving (Show, Eq)

Main>rolesAtareados [victoria, lautaro, ruben, pancracio, laura]
["contador", "legales"]
-}

tieneDosOMasTareas =
  (>=2).length.tareas
{-
# Función auxiliar del filter
1. A cada elemento del tipo Empleado llamamos a su función tareas (que es una lista)
2. Le preguntamos la cantidad de elementos que tiene, y filtramos por los que cumplan 
la condición de que sean dos o más elementos.
-}  

rolesAtareados = 
  map (rol) . filter (tieneDosOMasTareas) 
{-
1. Realizamos aplicación parcial al no pasar como argumento la lista de empleados
2. Implementamos composición al utilizar la función (.), filtramos la lista usando
una función auxiliar "tieneDosOMasTareas"
3. A la lista filtrada, le aplicamos la función "rol" propia de cada elemento, 
ya que al crear el constructor Empleado con data, cada atributo es una función 
que devuelve un valor o función, en este caso un valor del tipo String.
-}