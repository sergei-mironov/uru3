
module Cakefile where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Cakefile_P

instance IsString File where fromString = file

main = do
  writeMake (file "Makefile") $ do
    
    u <- uwlib "lib.urp" $ do
      library' (externalMake "../Uru/lib.urp")
      library' (externalMake "../JQuery/lib.urp")
      bin ("dist/fonts/glyphicons-halflings-regular.eot") []
      bin ("dist/fonts/glyphicons-halflings-regular.svg") []
      bin ("dist/fonts/glyphicons-halflings-regular.ttf") []
      bin ("dist/fonts/glyphicons-halflings-regular.woff") []
      bin ("dist/css/bootstrap.css") []
      ur (pair "Bootstrap.ur")

    t <- uwapp "-dbms sqlite" "test/B1.urp" $ do
      library u
      debug
      ur (sys "list")
      ur (single ("test/B1.ur"))

    rule $ do
      phony "all"
      depend t

