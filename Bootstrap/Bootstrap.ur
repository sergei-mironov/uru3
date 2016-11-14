con dpage = Uru.dpage
con need = [JQ=unit]
con out = need ++ [BOOTSTRAP=unit]

fun add [t] [t~out]
        (f:record (dpage (t ++ out)) -> transaction page)
        (r:record (dpage (t ++ need))) : transaction page =
  let
    val css_urls = List.foldr (fn l x =>
      <xml>
        <link rel="urwebhint" href={l}/>
        {x}
      </xml>) <xml/> Bootstrap_css.propagated_urls

    val h = <xml>
              {css_urls}
              <link rel="stylesheet" href={Bootstrap_css.url}/>
              <link rel="stylesheet" href={Bootstrap_theme_css.url}/>
              {Script.insert Uru.javascript Bootstrap_min_js.url}
              {Script.insert Uru.javascript Tooltip_js.url}
            </xml>

    (* val l = return {} *)
    val l = Tooltip_js.enable_tooltips {}
  in
    f (Uru.addOnLoad l (Uru.addHeader h (Uru.addTag [#BOOTSTRAP] {} r)))
  end

fun tooltip_xshow (id:id) (s:xbody) : transaction unit = Tooltip_js.tooltip ("#" ^ (show id)) s
fun tooltip_show (id:id) (s:string) : transaction unit = Tooltip_js.tooltip ("#" ^ (show id)) (cdata s)

fun popover_show (id:id) (s:string) : transaction unit = Tooltip_js.popover ("#" ^ (show id)) s

open BootstrapStyles

