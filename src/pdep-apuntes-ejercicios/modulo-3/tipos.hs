type Complejo = (Float, Float)

sumarComplejos :: Complejo -> Complejo -> Complejo
sumarComplejos (real1, imaginario1) (real2, imaginario2) = 
    (real1+real2, imaginario1+imaginario2)

main = do
    print(sumarComplejos (1,2) (2,3))