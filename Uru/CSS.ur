
datatype cssVal = Str of string | Url of url

fun mkcss (n:string) (v:cssVal) (c:css_style) : css_style =
  case v of
    Str s => oneProperty c (value (property n) (atom s))
    | Url u => oneProperty c (value (property n) (css_url u))

fun css (l : list (string * cssVal)) : css_style =
  List.foldr (fn (n,v) s => mkcss n v s) noStyle l

