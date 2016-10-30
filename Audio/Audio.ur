con dpage = Uru.dpage
con need = []
con out = need ++ [AUDIO=unit]

open Audio_HTML5

val audio_play = @@Audio_js.audio_play
val audio_pause = @@Audio_js.audio_pause
val audio_position = @@Audio_js.audio_position

fun add [t:::{Type}] [t~out]
  (f:record (dpage (t ++ out)) -> transaction page)
  (r:record (dpage (t ++ need)))
  : transaction page =

  let
    val h = <xml>
              {Script.insert Uru.javascript Audio_js.url}
            </xml>
  in
    f (Uru.addHeader h (Uru.addTag [#AUDIO] {} r))
  end

