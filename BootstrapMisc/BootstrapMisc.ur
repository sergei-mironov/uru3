con dpage = Uru.dpage
con need = [BOOTSTRAP=unit]
con out = need ++ [BOOTSTRAP_MISC=unit]

fun add [t:::{Type}] [t~out]
  (f:record (dpage (t ++ out)) -> transaction page)
  (r:record (dpage (t ++ need)))
  : transaction page = 

  let
    val h = <xml>
              <link rel="stylesheet" href={Bootstrap_slider_css.url}/>
              {Script.insert Uru.javascript Bootstrap_slider_min_js.url}
              {Script.insert Uru.javascript BootstrapSlider_js.url}
            </xml> 
  in
    f (Uru.addHeader h (Uru.addTag [#BOOTSTRAP_MISC] {} r))
  end

val slider_add = BootstrapSlider_js.bootstrap_slider_add
