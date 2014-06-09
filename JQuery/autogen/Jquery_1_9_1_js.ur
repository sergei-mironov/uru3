val binary = Jquery_1_9_1_js_c.binary
val text = Jquery_1_9_1_js_c.text
fun blobpage {} = b <- binary () ; returnBlob b (blessMime "text/javascript")
val geturl = url(blobpage {})
val propagated_urls = 
    []
