
module Cake_BootstrapMisc where

import Development.Cake3
import Development.Cake3.Ext.UrWeb

import Cake_BootstrapMisc_P

lib = do
  uwlib (file "lib.urp") $ do
    library (externalMake (file "../Bootstrap/lib.urp"))
    bin (file "bootstrap-slider/dist/bootstrap-slider.min.js") [NoScan]
    bin (file "bootstrap-slider/dist/css/bootstrap-slider.css") [NoScan]
    ur (single (file "BootstrapMisc.ur"))

bsm1 = mkDemo (file "test/BSM1.ur") (return ())

mkDemo src bdy = do
  uwapp "-dbms sqlite" ((src .= "urp")) $ do
    allow url "https://github.com/grwlf/*"
    allow url "https://camo.githubusercontent.com/*"
    library lib
    ur (sys "list")
    bin ((src .= "css")) [NoScan]
    ur (single ((src .= "ur")))
    bdy

main = do
  writeMake (file "Makefile") $ do
    rule $ do
      phony "lib"
      depend lib

    rule $ do
      phony "all"
      depend bsm1
      depend lib

