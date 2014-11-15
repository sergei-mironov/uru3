val binary = Dialog_polyfill_js_c.binary
val text = Dialog_polyfill_js_c.text
fun blobpage {} = b <- binary () ; returnBlob b (blessMime "text/javascript")
val geturl = url(blobpage {})
val propagated_urls = 
    []
