--armarFixture ["boca","river", "racing"] ["river", "velez", "racing"]
--[("boca","river"),("river","velez")]
formarTupla :: a -> a -> (a, a)
formarTupla a b = (a, b)

criterioNombresDiferentes :: (Eq a) => (a, a) -> Bool
criterioNombresDiferentes tupla = fst tupla /= snd tupla

filtrarLista :: [(String, String)] -> [(String, String)]
filtrarLista = filter (criterioNombresDiferentes)

armarFixture :: [String] -> [String] -> [(String, String)]
armarFixture listaA = filtrarLista . (zipWith formarTupla) listaA
