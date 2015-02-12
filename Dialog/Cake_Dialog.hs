
module Cake_Dialog where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Development.Cake3.Utils.Slice
import qualified Cake_URU as Uru
import qualified Cake_JQ as JQuery
import Cake_Dialog_P

lib = do
  uwlib (file "lib.urp") $ do
    ffi (file "DialogTag.urs")
    library Uru.lib
    library JQuery.lib
    embed (file "dialog-polyfill/dialog-polyfill.js")
    embed (file "dialog-polyfill/dialog-polyfill.css")
    embed (file "DialogPolyfill.js")
    embed (mangled (file "Dialog.js"))
    ur (file "Dialog.ur")

demo1 = do
  uwapp "-dbms sqlite" (file "demo/Polyfill1.urp") $ do
    library lib
    ur (sys "list")
    ur (file "demo/Polyfill1.ur")

main = writeDefaultMakefiles $ do

  rule $ do
    phony "lib"
    depend lib

  rule $ do
    phony "all"
    depend demo1

