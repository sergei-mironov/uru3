
module Cake_BootstrapMisc where

import Development.Cake3
import Development.Cake3.Utils.Slice
import Development.Cake3.Ext.UrWeb

import qualified Cake_Bootstrap as Bootstrap
import qualified Cake_URU as Uru
import Cake_BootstrapMisc_P

lib = do
  prebuild [cmd| git -C $(cwd) submodule update --init bootstrap-slider |]
  prebuild [cmd| git -C $(cwd)/bootstrap-slider checkout -f |]
  uwlib (file "lib.urp") $ do
    library Bootstrap.lib
    library Uru.lib
    embed (file "bootstrap-slider/dist/bootstrap-slider.min.js")
    embed (file "bootstrap-slider/dist/css/bootstrap-slider.css")
    embed (mangled (file "BootstrapSlider.js"))
    ur (file "BootstrapMisc.ur")

bsm1 = mkDemo (file "test/BSM1.ur") (return ())

mkDemo src bdy = do
  uwapp "-dbms sqlite" ((src .= "urp")) $ do
    allow url "https://github.com/grwlf/*"
    allow url "https://camo.githubusercontent.com/*"
    library lib
    ur (sys "list")
    embed (src .= "css")
    ur (src .= "ur")
    bdy

main = writeDefaultMakefiles $ do
  rule $ do
    phony "lib"
    depend lib

  rule $ do
    phony "all"
    depend bsm1
    depend lib

