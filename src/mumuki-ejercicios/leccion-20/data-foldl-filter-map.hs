{-
Necesitamos saber a partir de un conjunto de empleados si hay empleados que se jubilaron.
Decimos que hay jubilados si, de entre aquellos empleados que no tienen ninguna tarea, 
existe alguno que haya cumplido los 65 años.
Resolver este problema usando composición, aplicación parcial y orden superior.

Ej.:
data Empleado = Empleado {
  rol :: String,
  edad :: Int,
  tareas :: [String]
} deriving (Show)

Main>hayJubilados [lautaro, victoria, ruben, pancracio, laura, juan]
True

Main>hayJubilados [lautaro, victoria, ruben, laura, juan]
False
-}

esJubilado :: Empleado -> Bool
esJubilado = (>=65).edad

empleadosSinTareas :: [Empleado] -> [Empleado]
empleadosSinTareas = filter (null.tareas)

hayJubilados :: [Empleado] -> Bool
hayJubilados =
 foldl (\s e-> s || esJubilado e) False . empleadosSinTareas