open Bootstrap_slider_min_js_c
fun content {} = b <- blob () ; returnBlob b (blessMime "text/javascript")
val propagated_urls : list url = 
    []
val url = url(content {})
val geturl = url
