module Cakefile where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Cakefile_P

instance IsString File where fromString = file

main = do
  writeMake (file "Makefile") $ do
    rule $ do
      phony "all"
      depend $ do
        uwlib "lib.urp" $ do
          ur (sys "list")
          ur (pair "CSS.ur")
          ur (pair "Uru.ur")

