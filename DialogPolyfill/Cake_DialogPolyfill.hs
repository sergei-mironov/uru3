
module Cake_DialogPolyfill where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Cake_DialogPolyfill_P

lib = do
  uwlib (file "lib.urp") $ do
    ffi (file "Dialog.urs")
    library' (externalMake (file "../Uru/lib.urp"))
    library' (externalMake (file "../JQuery/lib.urp"))
    bin (file "dialog-polyfill/dialog-polyfill.js") [NoScan]
    bin (file "dialog-polyfill/dialog-polyfill.css") [NoScan]
    bin (file "DialogPolyfill.js") [NoScan]
    ur (pair (file "DialogPolyfill.ur"))

demo1 = do
  l <- lib
  uwapp "-dbms sqlite" (file "demo/Polyfill1.urp") $ do
    library l
    ur (sys "list")
    ur (single (file "demo/Polyfill1.ur"))

main = do
  writeMake (file "Makefile") $ do
    l <- lib
    d1 <- demo1
    
    rule $ do
      phony "lib"
      depend l

    rule $ do
      phony "all"
      depend l
      depend d1

