open RespTabs_js_c
fun content {} = b <- blob () ; returnBlob b (blessMime "text/javascript")
val propagated_urls : list url = 
    []
open RespTabs_js_js
val url = url(content {})
val geturl = url
