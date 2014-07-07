
module Cakefile where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Cakefile_P

instance IsString File where fromString = file

main = do
  writeMake (file "Makefile") $ do
    
    u <- uwlib "lib.urp" $ do
      library' (externalMake "../Uru/lib.urp")
      bin ("jquery-1.9.1.js") [NoScan]
      ur (pair "JQuery.ur")

    rule $ do
      phony "all"
      depend u

