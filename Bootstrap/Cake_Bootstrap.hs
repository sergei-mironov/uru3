
module Cake_Bootstrap where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Cake_Bootstrap_P

lib = do
  uwlib (file "lib.urp") $ do
    rewrite style "Bootstrap/bs3_table table"
    rewrite style "Bootstrap/* [-]"
    ffi (file "NavTag.urs")
    library' (externalMake (file "../Uru/lib.urp"))
    library' (externalMake (file "../JQuery/lib.urp"))
    bin (file "dist/fonts/glyphicons-halflings-regular.eot") []
    bin (file "dist/fonts/glyphicons-halflings-regular.svg") []
    bin (file "dist/fonts/glyphicons-halflings-regular.ttf") []
    bin (file "dist/fonts/glyphicons-halflings-regular.woff") []
    bin (file "dist/css/bootstrap.css") []
    bin (file "dist/css/bootstrap-theme.css") []
    bin (file "dist/js/bootstrap.min.js") [NoScan]
    bin (file "Tooltip.js") []
    safeGet' "Tooltip_js/enable_tooltips"
    ur (pair (file "Bootstrap.ur"))
    bin (file "FormSignin.css") []
    ur (single (file "FormSignin.ur"))

demo1 useUrembed = do
  u <- lib
  uwapp "-dbms sqlite" (file "test/B1.urp") $ do
    rewrite style "B1/* [-]"
    library u
    ur (sys "list")
    bin (file "test/B1.css") useUrembed
    ur (pair (file "test/B1.ur"))

demo2 useUrembed = do
  u <- lib
  uwapp "-dbms sqlite" (file "test/B2.urp") $ do
    allow url "https://github.com/grwlf/*"
    allow url "https://camo.githubusercontent.com/*"
    rewrite style "B2/* [-]"
    library u
    ur (sys "list")
    bin (file "test/B2.css") useUrembed
    bin (file "test/holder.js") useUrembed
    ur (pair (file "test/B2.ur"))

demo3 useUrembed = do
  u <- lib
  uwapp "-dbms sqlite" (file "test/B3_Login.urp") $ do
    allow url "https://github.com/grwlf/*"
    allow url "https://camo.githubusercontent.com/*"
    rewrite style "B3_Login/* [-]"
    library u
    ur (sys "list")
    bin (file "test/B3_Login.css") useUrembed
    ur (pair (file "test/B3_Login.ur"))

mkdemo1 src bdy useUrembed = do
  u <- lib
  uwapp "-dbms sqlite" ((src .= "urp")) $ do
    library u
    ur (sys "list")
    bin ((src .= "css")) useUrembed
    ur (single ((src .= "ur")))
    bdy

demo_modal = mkdemo1 (file "test/Modal.ur") $ do
  return ()

demo_narrow = mkdemo1 (file "test/Narrow.ur") $ do
  return ()

mfiles f = do
  writeMake (file "Makefile.devel") (f [UseUrembed,NoScan])
  writeMake (file "Makefile") (f [NoScan])

main = do
  mfiles $ \useUrembed -> do
    rule $ do
      phony "lib"
      depend lib

    rule $ do
      phony "all"
      depend (demo1 useUrembed)
      depend (demo2 useUrembed)
      depend (demo3 useUrembed)
      depend (demo_modal useUrembed)
      depend (demo_narrow useUrembed)

