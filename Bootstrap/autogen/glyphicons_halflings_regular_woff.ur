open Glyphicons_halflings_regular_woff_c
fun content {} = b <- blob () ; returnBlob b (blessMime "application/font-woff")
val propagated_urls : list url = 
    []
val url = url(content {})
val geturl = url
