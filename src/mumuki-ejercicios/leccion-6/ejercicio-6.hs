techo = ceiling

porcionarPizza = (/8) -- 8 porciones por pizza
porciones = (*3) -- 3 por persona
pizzas = porcionarPizza . porciones

precioTotal precio pizzas = precio * pizzas
precioPorComensal precio comensales =  (/comensales) . (precioTotal precio)

cuantoPagaCadaUno precio comensales = 
 precioPorComensal precio comensales ((techo . pizzas) comensales)