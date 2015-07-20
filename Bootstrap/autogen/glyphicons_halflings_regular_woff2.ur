open Glyphicons_halflings_regular_woff2_c
fun content {} = b <- blob () ; returnBlob b (blessMime "application/font-woff2")
val propagated_urls : list url = 
    []
val url = url(content {})
val geturl = url
