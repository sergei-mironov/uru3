
module Cakefile where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Cakefile_P

instance IsString File where fromString = file

data Mode = User | Devel

mfiles f = do
  writeMake (file "Makefile.devel") (f [UseUrembed,NoScan])
  writeMake (file "Makefile") (f [NoScan])

main = do
  mfiles $ \useUrembed -> do
    
    u <- uwlib "lib.urp" $ do
      rewrite style "Bootstrap/bs3_table table"
      rewrite style "Bootstrap/* [-]"
      library' (externalMake "../Uru/lib.urp")
      library' (externalMake "../JQuery/lib.urp")
      bin ("dist/fonts/glyphicons-halflings-regular.eot") []
      bin ("dist/fonts/glyphicons-halflings-regular.svg") []
      bin ("dist/fonts/glyphicons-halflings-regular.ttf") []
      bin ("dist/fonts/glyphicons-halflings-regular.woff") []
      bin ("dist/css/bootstrap.css") []
      bin ("dist/css/bootstrap-theme.css") []
      bin ("dist/js/bootstrap.min.js") [NoScan]
      ur (pair "Bootstrap.ur")

    b1 <- uwapp "-dbms sqlite" "test/B1.urp" $ do
      rewrite style "B1/* [-]"
      library u
      ur (sys "list")
      bin ("test/B1.css") useUrembed
      ur (pair ("test/B1.ur"))

    b2 <- uwapp "-dbms sqlite" "test/B2.urp" $ do
      allow url "https://github.com/grwlf/*"
      allow url "https://camo.githubusercontent.com/*"
      rewrite style "B2/* [-]"
      library u
      ur (sys "list")
      bin ("test/B2.css") useUrembed
      bin ("test/holder.js") useUrembed
      ur (pair ("test/B2.ur"))

    rule $ do
      phony "all"
      depend b1
      depend b2

