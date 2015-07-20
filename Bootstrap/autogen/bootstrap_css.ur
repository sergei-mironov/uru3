open Bootstrap_css_c
fun content {} = b <- blob () ; returnBlob b (blessMime "text/css")
val propagated_urls : list url = 
    Glyphicons_halflings_regular_eot.url ::
    Glyphicons_halflings_regular_eot.url ::
    Glyphicons_halflings_regular_woff2.url ::
    Glyphicons_halflings_regular_woff.url ::
    Glyphicons_halflings_regular_ttf.url ::
    Glyphicons_halflings_regular_svg.url ::
    []
val url = url(content {})
val geturl = url
