{-
    Devueve True/False "Si todos los elementos cumplen la condición"
    (Nota: La función "ANY" es sí al menos une cumple la condición)

    > all (<2) [1,2,3,4] -- todos los elementos son menores a 2?
    False -- NO! Solo 1 es menor a 2
    > all (>0) [1,2,3,4] -- todos los numeros son mayores a cero?
    True -- SI!, el 1,2,3,4

    1.Recibe como primer argumento una función de tipo a->Bool,
     Ej. (<2), (=='a')
    2.Recibe como segundo parametro una lista
    3.Devuelve un valor booleano, si se cumple o no la condición del primer argumento
-}