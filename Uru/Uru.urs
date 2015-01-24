
con dpage = fn deps => [
  Hdr = xhead,
  Tags = record deps,
  Bdy_onload = transaction unit,
  BodyTail = xbody
  ]

val javascript : mimeType

val withBody : t ::: {Type}
  -> (record (dpage t) -> transaction xbody)
  -> record (dpage t) -> transaction page

val withHeadBody : t ::: {Type}
  -> (record (dpage t) -> transaction xhead)
  -> (record (dpage t) -> transaction xbody)
  -> record (dpage t) -> transaction page

val withHeader : t ::: {Type}
  -> xhead
  -> (record (dpage t) -> transaction page)
  -> record (dpage t) -> transaction page

val withStylesheet : t ::: {Type}
  -> url
  -> (record (dpage t) -> transaction page)
  -> record (dpage t) -> transaction page

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

val addBodyTail : t1 ::: {Type}
  -> xbody
  -> record (dpage t1) -> (record (dpage t1))

val run : (record (dpage []) -> transaction page)
  -> transaction page

