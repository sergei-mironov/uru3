module Cake_URU where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Cake_URU_P

lib = uwlib (file "lib.urp") $ do
  ffi (file "Script.urs")
  include (file "Script.h")
  src (file "Script.c")

  ur (sys "list")
  ur (file "CSS.ur", file "CSS.urs")
  ur (file "Uru.ur", file "Uru.urs")

main = writeMake (file "Makefile") $ do
  rule $ do
    phony "all"
    depend lib

