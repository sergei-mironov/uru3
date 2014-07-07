val binary = Urweb_persona_js_c.binary
val text = Urweb_persona_js_c.text
fun blobpage {} = b <- binary () ; returnBlob b (blessMime "text/javascript")
val geturl = url(blobpage {})
val propagated_urls = 
    []
