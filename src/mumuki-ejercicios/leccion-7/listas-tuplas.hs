nombres = ["matias", "mario", "fede"]
misAlumnos = [("matias", 12), ("mario", 18), ("fede", 25)]

matias = ("matias", 19)

--soloNombres = intercalate "," -- # NO FUNCIONA
nombreAlumnos = map fst
edadAlumnos = map snd
buscarMatias = filter (=="matias") nombres

recortarNombre (nombre, edad) = (take 2 nombre, edad)
recortar = map recortarNombre

nombreLongitud (nombre,_) = length nombre -- pattern matching
nombreCorto = (<10) . nombreLongitud -- composicion



{-
    Mostrar la lista con los nombres mas cortos
    -Las listas, ni cualquier variable se puede modificar
    -En la función "recortar" estamos creando una nueva lista a mostrar
    -La función "recortarNombre" utiliza "Pattern Matching" con "Tuplas", 
     que según los argumentos puede devolver cierto contenido.
     En este caso estamos modificando el contenido (no la variable), y devolviendolo.

# Pattern Matching
 -Funciona como las funciones, que según lo que se pase de argumento devuelve "algo"
 -Permite elegir tener varias alternativas

-}

main = do
    --print(nombreAlumnos misAlumnos)
    --print(edadAlumnos misAlumnos)
    --print(edadAlumnos [("manu", 12), ("fede", 18)])
    --print(recortar misAlumnos)
    print(nombreCorto matias)