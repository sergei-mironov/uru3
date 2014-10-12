
fun addOnLoad [t1] tu r =
  (r -- #Bdy_onload ++ {Bdy_onload = (r.Bdy_onload ; tu)})

fun addHeader [t1] h r =
  (r -- #Hdr ++ {Hdr = <xml>{r.Hdr}{h}</xml>})

fun addTag [t1] [tm] [n :: Name] [t1 ~ [n=tm]] tv r =
  (r -- #Tags ++ {Tags = r.Tags ++ {n = tv}})

fun addEmptyTag [t1] [n :: Name] [t1 ~ [n={}]] r =
  (r -- #Tags ++ {Tags = r.Tags ++ {n = {}}})

fun withBody [t] f r =
  b <- f r;
  return
    <xml>
      <head>
      {r.Hdr}
      </head>
      <body onload={r.Bdy_onload}>
      {b}
      </body>
    </xml>

fun withHeadBody [t] fh fb r =
  h <- fh r;
  b <- fb r;
  return
    <xml>
      <head>
      {r.Hdr}
      {h}
      </head>
      <body onload={r.Bdy_onload}>
      {b}
      </body>
    </xml>

fun withHeader [t] h f r =
  (* FIXME: Doesn't compile: too deep unification
  f (addHeader t h r)
  *)
  f (r -- #Hdr ++ {Hdr = <xml>{r.Hdr}{h}</xml>})

fun run f : transaction page =
  f {
    Tags = {} ,
    Hdr = <xml/> ,
    Bdy_onload = return {}
    }

val javascript = blessMime "text/javascript"

