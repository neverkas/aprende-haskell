{-
    Sumar el triple del primero al segundo
    > sumarNumeroAlTriple 3 2
     sumarNumeroAlTriple a b =  ((+) . (*3)) a b
     1) Primero hace (*3) a,
        la función (*) sólo toma dos argumentos
        uno de los argumentos es "3" porque esta dentro del ()
        y el otro argumento es a, y devuelve el producto de 3*a
     2) Segundo hace (+) c b
        la función suma sólo toma dos argumentos
        la "c" es el producto de (3*a)         
        y el producto de 3*a, lo suma con b
    
    ***************************************************************************

    Sumar el triple del primero al segundo y dividir el resultado a la mitad
    > laMitadDeSumarTriple 2 15
    laMitaDeSumarTriple a = (2/) . (((+) . (*3))) a

    (2/) . (((+) . (*3))) a --> 3 funciones (*3) (+) y (/2), 2 argumentos (a,b)
    (*3) a = c              --> multiplica el primer argumento (a) por 3
    (+)c b = d              --> al resultado anterior (c) le suma el segundo argumento (b)
    (/2) d = resultado      --> al resultado anterior (d) lo divide por 2

    # Nota: Si le hubiera pasado el segundo argumento (b) fallaría, porque seguido del
            (/2) está el punto de "composición", por lo que espera una función (*3), no un valor "10".

    1) Primero hace (3*a)
        la función (*) sólo toma dos argumentos, 
        pero (*3) toma sólo un argumento ya que el 3 ya está dentro de la función,
        el segundo argumento será "a",
        y devuelve el producto de 3*a
    2) segundo hace (+) c b
        la "c" es el producto de la operación anterior (3*a)
        la b es el argumento que no aparece porque se aplica parcialmente (reduciendo argumentos)
        y devuelve el resultaod de sumar c+b
    3) tercero hace (/2) d
        "d" es el resultado de la sumatoria de la función anterior
        la función (/) acepta dos argumentos,
        el primero ya está agregado en los () que es el 2
        el segundo es "d" que era el resultado de la suma anterior

-}
doble = (*2)
triple = (*3)
sumar = (+)

--sumarNumeroAlTriple a b = ((+) . (*3)) a b
--sumarNumeroAlTriple a b = (sumar . triple) a b
--sumarNumeroAlTriple = ((+) . (*3))
sumarNumeroAlTriple = (sumar . triple)

dobleDelTriple numero = (doble . triple) numero

laMitaDeSumarTriple a = (2/) . (((+) . (*3))) a

lista = [1,2,3]

main = do 
    print(sumarNumeroAlTriple 3 2)
    print(dobleDelTriple 2)
    print(laMitaDeSumarTriple 5 15)
