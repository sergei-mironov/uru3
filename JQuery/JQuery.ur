
con need = []
con out = need ++ [JQ=unit]

fun add [t] [t~out] f r = 
  let
    val h = <xml>
              {Script.insert Uru.javascript Jquery_1_9_1_js.url}
            </xml> 
  in
    f (Uru.addHeader h (Uru.addTag [#JQ] {} r))
  end


