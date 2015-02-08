open Dialog_polyfill_js_c
fun content {} = b <- blob () ; returnBlob b (blessMime "text/javascript")
val propagated_urls : list url = 
    []
val url = url(content {})
val geturl = url
