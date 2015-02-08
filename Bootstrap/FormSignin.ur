con dpage = Uru.dpage
con need = [BOOTSTRAP=unit]
con out = need ++ [SIGNIN=unit]

fun add [t:::{Type}] [t~out]
  (f:record (dpage (t ++ out)) -> transaction page)
  (r:record (dpage (t ++ need)))
  : transaction page = 

  let
    val h = <xml>
              <link rel="stylesheet" href={FormSignin_css.url}/>
            </xml> 
  in
    f (Uru.addHeader h (Uru.addTag [#SIGNIN] {} r))
  end

style form_signin
style form_signin_heading
style form_control
