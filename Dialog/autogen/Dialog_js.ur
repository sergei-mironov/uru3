val binary = Dialog_js_c.binary
val text = Dialog_js_c.text
val dialog_show = Dialog_js_js.dialog_show
val dialog_showModal = Dialog_js_js.dialog_showModal
val dialog_close = Dialog_js_js.dialog_close
fun blobpage {} = b <- binary () ; returnBlob b (blessMime "text/javascript")
val geturl = url(blobpage {})
val propagated_urls = 
    []
