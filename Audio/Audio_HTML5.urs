(* HTML5 media *)
val audio : bodyTag ([Src = url, Autobuffer = bool, Autoplay = bool, Loop =
                     bool, Controls = bool, Preload = string, Onload = transaction unit] ++ boxAttrs)


