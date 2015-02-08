open Glyphicons_halflings_regular_ttf_c
fun content {} = b <- blob () ; returnBlob b (blessMime "application/x-font-ttf")
val propagated_urls : list url = 
    []
val url = url(content {})
val geturl = url
