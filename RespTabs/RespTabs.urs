
con dpage = Uru.dpage
con need = [JQ=unit]
con out = need ++ [RESPT=unit]

type tab = {Active:bool, Caption:string, Content:xbody}

con tabs = list tab -> transaction xbody

val mktab : string -> string -> xbody -> tab

val add : t ::: {Type} -> x ::: Type -> [t ~ out]
  => (tabs -> record (dpage (t ++ out)) -> x)
  -> record (dpage (t ++ need)) -> x
