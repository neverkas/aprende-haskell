type Pelicula = (String, [Float])
type Maraton = [Pelicula]

--titulo :: (String, [Int]) -> String
--titulo = fst

--calificaciones :: (String, [Int]) -> [Int]
--calificaciones = snd

sumarA :: Float -> Float -> Float 
sumarA n = (n+)

--esMayorA :: Int -> Int -> Bool
esMayorA :: Ord a => a -> a -> Bool
esMayorA n = (>n) 

--esMenorA :: Float -> Float -> Bool
esMenorA :: Ord a => a -> a -> Bool
esMenorA n = (<n) 

cantidadCalificaciones :: [Float] -> Int
cantidadCalificaciones = length

sumaCalificaciones :: Pelicula -> Float
sumaCalificaciones (_, calificaciones) = sum calificaciones -- pattern matching
--sumaCalificaciones = sum . calificaciones -- composicion && aplicacion parcial

laMejorCalificacion :: Pelicula -> Float
laMejorCalificacion (_, calificaciones) = maximum calificaciones -- pattern matching
--laMejorCalificacion = maximum . calificaciones -- composicion && aplicacion parcial

laPeorCalificacion :: Pelicula -> Float
laPeorCalificacion (_, calificaciones) = minimum calificaciones -- pattern matching
--laPeorCalificacion = minimum . calificaciones -- composicion && aplicacion parcial

esPopular :: [Float] -> Bool
esPopular = (esMayorA 5) . cantidadCalificaciones
--esPopular = (>5) . cantidadCalificaciones

estaBuena :: Pelicula -> Bool
estaBuena (titulo, calificaciones) = (esMayorA 7 (length titulo)) && esPopular calificaciones
--estaBuena pelicula = ((>7) . length . titulo) pelicula && (esPopular pelicula)

-- ###
promedio :: [Float] -> Float
promedio lista = sum lista / fromIntegral(length lista)

-- ###
puntaje :: Pelicula -> Float
puntaje (_, calificaciones) = promedio calificaciones 
--    (fromIntegral( sumaCalificaciones pelicula)) / (fromIntegral(cantidadCalificaciones pelicula))

dispersion :: Pelicula -> Float
dispersion pelicula = (laMejorCalificacion pelicula) - (laPeorCalificacion pelicula)

-- ###
calificar :: Float -> Pelicula -> Pelicula
calificar nuevaCalificacion (titulo, calificaciones) = 
    (titulo, nuevaCalificacion:calificaciones)
--calificar numero pelicula = (calificaciones pelicula) : numero

-- ###
sumarSegunCalificacion :: Float -> Float
sumarSegunCalificacion 1 = 1
sumarSegunCalificacion calificacion = min 10 (sumarA calificacion 2)
{-
sumarSegunCalificacion numero
    | numero == 9 || numero == 10 = 10
    | numero == 1 = 1
    | otherwise = numero + 2
-}

-- ###
manijear :: Pelicula -> Pelicula
manijear (titulo, calificaciones) =
    (titulo, map (sumarSegunCalificacion) calificaciones)
--manijear pelicula = map (sumaCalificacion) (calificaciones pelicula)

valeLaPena :: Maraton -> Bool
valeLaPena peliculas = estaBuena (head peliculas) && estaBuena (last peliculas)

coincideNombre :: Pelicula -> String -> Bool
coincideNombre (titulo, _) = (==titulo)
--coincideNombre :: String -> Pelicula -> Bool
--coincideNombre nombre pelicula = nombre == (titulo pelicula)

pertenece :: String -> Maraton -> Bool
--pertenece nombrePelicula maraton = any (coincideNombre nombrePelicula) maraton
pertenece nombrePelicula = any (flip coincideNombre nombrePelicula)

-- ###
valoracion :: Maraton -> Float
valoracion maraton = (promedio . map(puntaje)) maraton
--valoracion = sum . (map (sumaCalificaciones))

dispersionMenorADos :: Maraton -> Maraton
dispersionMenorADos = filter ((esMenorA 2) . dispersion)

puntajeMayorA8 :: Pelicula -> Bool
puntajeMayorA8 = (esMayorA 8) . puntaje

maratonDeOscar :: Maraton -> Bool 
maratonDeOscar maraton = all puntajeMayorA8 (dispersionMenorADos maraton)
