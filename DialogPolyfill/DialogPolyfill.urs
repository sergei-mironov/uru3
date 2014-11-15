
val dialog : bodyTag boxAttrs

con dpage = Uru.dpage
con need = [JQ=unit]
con out = need ++ [POLYFILL=unit]

val add : t ::: {Type} -> [t ~ out]
  => (record (dpage (t ++ out)) -> transaction page)
  -> record (dpage (t ++ need)) -> transaction page

