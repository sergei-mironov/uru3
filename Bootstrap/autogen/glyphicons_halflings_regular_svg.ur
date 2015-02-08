open Glyphicons_halflings_regular_svg_c
fun content {} = b <- blob () ; returnBlob b (blessMime "image/svg+xml")
val propagated_urls : list url = 
    []
val url = url(content {})
val geturl = url
