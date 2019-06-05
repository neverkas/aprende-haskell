{-
    Devuelve True/False sí al menos une cumple la condición
    (Nota: La función "all", si todos los elementos cumplen la condición)

    -Devuelve true/false si se cumple una condición con alguno de los elementos de la lista
    -Con sólo uno se cumpla ya devuelve True

    >any even [1,2,3,4] -- pido que me devuelve True/False si algun número de la lista es par
    True -- como 2 y 4 son par, devuelve True

    >any (>5) [1,2,3,4] -- decime si alguno de los números es mayor a 5
    False -- como el mayor es 4, entonces ninguno

    >any (=="Carlos") ["Carlos", "Fede", "Pedro"] -- decime si alguno de ellos es "Carlos"
    True -- porque hay un string con ese nombre

-}