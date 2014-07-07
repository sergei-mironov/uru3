con dpage = Uru.dpage

type persdata = {Signal:source (option string), User:option string}

con need = []
con out = need

val add : t ::: {Type} -> [t ~ out]
  => (persdata -> record (dpage (t ++ out)) -> transaction page)
  -> record (dpage (t ++ need)) -> transaction page

val status : option string -> xbody
