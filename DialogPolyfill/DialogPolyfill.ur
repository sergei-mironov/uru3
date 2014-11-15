
val dialog = @@Dialog.dialog


con dpage = Uru.dpage
con need = [JQ=unit]
con out = need ++ [POLYFILL=unit]

fun add [t:::{Type}] [t~out]
  (f:record (dpage (t ++ out)) -> transaction page)
  (r:record (dpage (t ++ need)))
  : transaction page = 

  let
    val h = <xml>
              <link rel="stylesheet" href={Dialog_polyfill_css.geturl}/>
              {Script.insert Uru.javascript Dialog_polyfill_js.geturl}
            </xml> 

    val t = <xml>
      {Script.insertBody Uru.javascript DialogPolyfill_js.geturl}
      </xml>
  in
    f (Uru.addHeader h (Uru.addTag [#POLYFILL] {} (Uru.addBodyTail t r)))
  end

