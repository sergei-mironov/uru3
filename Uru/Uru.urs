
con dpage = fn deps => [
  Hdr = xhead,
  Tags = record deps,
  Bdy_onload = transaction unit]

val javascript : mimeType

val withBody : t ::: {Type}
  -> (record (dpage t) -> transaction xbody)
  -> record (dpage t) -> transaction page

(* FIXME: Doesn't compile
val withHeader : t ::: {Type}
  -> xhead
  -> (record (dpage t) -> transaction xbody)
  -> record (dpage t) -> transaction page
*)

val addHeader : t1 ::: {Type}
  -> xhead
  -> record (dpage t1) -> (record (dpage t1))

val addTag : t1 ::: {Type} -> tm ::: Type -> n :: Name -> [t1 ~ [n=tm]]
  => tm -> record (dpage t1) -> (record (dpage (t1 ++ [n=tm])))

val addEmptyTag : t1 ::: {Type} -> n :: Name -> [t1 ~ [n={}]]
  => record (dpage t1) -> (record (dpage (t1 ++ [n={}])))

val addOnLoad : t1 ::: {Type}
  -> transaction unit
  -> record (dpage t1) -> (record (dpage t1))

val run : (record (dpage []) -> transaction page)
  -> transaction page

