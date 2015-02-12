
module Cake_Bootstrap where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Development.Cake3.Utils.Slice
import qualified Cake_URU as URU
import qualified Cake_JQ as JQ
import Cake_Bootstrap_P

lib = do
  uwlib (file "lib.urp") $ do
    rewrite style "Bootstrap/bs3_table table"
    rewrite style "Bootstrap/* [-]"
    ffi (file "NavTag.urs")
    library JQ.lib
    library URU.lib
    embed (file "dist/fonts/glyphicons-halflings-regular.eot")
    embed (file "dist/fonts/glyphicons-halflings-regular.svg")
    embed (file "dist/fonts/glyphicons-halflings-regular.ttf")
    embed (file "dist/fonts/glyphicons-halflings-regular.woff")
    embed (mangled (file "dist/css/bootstrap.css"))
    embed (file "dist/css/bootstrap-theme.css")
    embed (file "dist/js/bootstrap.min.js")
    embed (mangled (file "Tooltip.js"))
    embed (file "FormSignin.css")

    safeGet "Tooltip_js/enable_tooltips"
    ur (pair (file "Bootstrap.ur"))
    ur (file "FormSignin.ur")

demo1 = do
  u <- lib
  uwapp "-dbms sqlite" (file "test/B1.urp") $ do
    rewrite style "B1/* [-]"
    library u
    ur (sys "list")
    embed (file "test/B1.css")
    ur (pair (file "test/B1.ur"))

demo2 = do
  uwapp "-dbms sqlite" (file "test/B2.urp") $ do
    allow url "https://github.com/grwlf/*"
    allow url "https://camo.githubusercontent.com/*"
    rewrite style "B2/* [-]"
    library lib
    ur (sys "list")
    embed (file "test/B2.css")
    embed (file "test/holder.js")
    ur (pair (file "test/B2.ur"))

demo3 = do
  uwapp "-dbms sqlite" (file "test/B3_Login.urp") $ do
    allow url "https://github.com/grwlf/*"
    allow url "https://camo.githubusercontent.com/*"
    rewrite style "B3_Login/* [-]"
    library lib
    ur (sys "list")
    embed (file "test/B3_Login.css")
    ur (pair (file "test/B3_Login.ur"))

mkdemo1 src bdy = do
  uwapp "-dbms sqlite" ((src .= "urp")) $ do
    library lib
    ur (sys "list")
    embed ((src .= "css"))
    ur (src .= "ur")
    bdy

demo_modal = mkdemo1 (file "test/Modal.ur") $ return ()

demo_narrow = mkdemo1 (file "test/Narrow.ur") $ return ()

main = writeDefaultMakefiles $ do

  rule $ do
    phony "lib"
    depend lib

  rule $ do
    phony "all"
    depend demo1
    depend demo2
    depend demo3
    depend demo_modal
    depend demo_narrow

