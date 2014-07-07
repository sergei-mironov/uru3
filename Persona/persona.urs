con dpage = Uru.dpage
con need = []
con out = need ++ [Persona={Signal:source (option string), User:option string}]

val add : t ::: {Type} -> [t ~ out]
  => (record (dpage (t ++ out)) -> transaction page)
  -> record (dpage (t ++ need)) -> transaction page

