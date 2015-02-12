module Cake_Persona where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Development.Cake3.Utils.Slice
import qualified Cake_URU as Uru
import Cake_Persona_P

lib = uwlib (file "lib.urp") $ do
  allow mime "text/javascript"
  database "dbname=persona"
  sql (file "persona.sql")
  script "https://login.persona.org/include.js"
  ffi (file "personaFfi.urs")
  jsFunc "PersonaFfi" "request" "request"
  jsFunc "PersonaFfi" "logout" "logout"
  jsFunc "PersonaFfi" "watch" "watch"
  ffi (file "ffi.urs")
  pkgconfig "jansson" 
  pkgconfig "libcurl"
  src (file "ffi.c")
  include (file "ffi.h")
  safeGet "Persona/signin"
  safeGet "Persona/signout"
  allow responseHeader "X-UA-Compatible"
  embed (file "urweb_persona.js")
  safeGet "Persona/main"
  safeGet "Persona/persjs"
  safeGet "Persona/add"
  library Uru.lib
  debug
  safeGet "PersonaFfi/request"
  safeGet "PersonaFfi/logout"
  ur (file "persona.ur", file "persona.urs")


test = uwapp "-dbms sqlite" (file "test/P1.urp") $ do
  library lib
  safeGet "P1/main"
  ur (file "test/P1.ur")
  debug

main = writeDefaultMakefiles $ do

  rule $ do
    phony "lib"
    depend lib

  rule $ do
    phony "all"
    depend lib
    depend test

  return ()


