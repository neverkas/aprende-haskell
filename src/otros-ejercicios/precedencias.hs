{-
-Para saber la precedencia de algunos de los operadores, se puede utilizar
el comando :info seguido del operador que se desee conocer la precedencia.
-La información que devuelve es
    1. Si pertenece o no a alguna clase (Ej. Num, Fractional,..)
    2. El tipado de que recibe y que devuelve
    3. El orden de prioridad, y si es asociativo a izquierdo o derecho

:info (+)
class Num a where
  (+) :: a -> a -> a
  infixl 6 +

:info (*)
class Num a where
  (*) :: a -> a -> a
  infixl 7 *

:info (/)
  class Num a => Fractional a where
  (/) :: a -> a -> a
  infixl 7 /

:info (^)
  (^) :: (Num a, Integral b) => a -> b -> a
  infixr 8 ^
-}