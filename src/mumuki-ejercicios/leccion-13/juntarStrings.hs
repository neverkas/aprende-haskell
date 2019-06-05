{-
juntarStrings separador = 
  foldl1 (juntarDosStringsCon separador)

juntarDosStringsCon separador s1 s2 = 
  s1 ++ separador ++ s2
-}

juntarStrings :: String -> [String] -> String
juntarStrings separador = 
  foldl1 (\x y -> x++separador++y)
