con dpage = Uru.dpage
con need = []
con out = need ++ [MOUSETRAP=unit]

fun add [t:::{Type}] [t~out]
  (f:record (dpage (t ++ out)) -> transaction page)
  (r:record (dpage (t ++ need)))
  : transaction page =

  let
    val h = <xml>{Script.insert Uru.javascript Mousetrap_min_js.url}</xml>
  in
    f (Uru.addHeader h (Uru.addTag [#MOUSETRAP] {} r))
  end

