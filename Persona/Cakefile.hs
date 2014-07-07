module Cakefile where

import Development.Cake3
import Development.Cake3.Ext.UrWeb as C3
import Cakefile_P

instance IsString File where fromString = file

project = do

  prebuild [cmd|urweb -print-cinclude >/dev/null|]

  p <- uwlib "lib.urp" $ do
    allow mime "text/javascript"
    database "dbname=persona"
    sql "persona.sql"
    script "https://login.persona.org/include.js"
    ffi "personaFfi"
    jsFunc "PersonaFfi" "request" "request"
    jsFunc "PersonaFfi" "logout" "logout"
    jsFunc "PersonaFfi" "watch" "watch"
    ffi "ffi.urs"
    pkgconfig "jansson" 
    pkgconfig "libcurl"
    csrc "ffi.c"
    include "ffi.h"
    safeGet "Persona.ur" "signin"
    safeGet "Persona.ur" "signout"
    allow responseHeader "X-UA-Compatible"
    bin "urweb_persona.js" [NoScan]
    safeGet "Persona.ur" "main"
    safeGet "Persona.ur" "persjs"
    safeGet "Persona.ur" "add"
    library' (externalMake "../Uru/lib.urp")
    debug
    safeGet "PersonaFfi.ur" "request"
    safeGet "PersonaFfi.ur" "logout"
    ur (pair "persona.ur")

  p1 <- uwapp "-dbms sqlite" "test/P1.urp" $ do
    library p
    debug
    safeGet "test/P1.ur" "main"
    ur (single "test/P1.ur")

  rule $ do
    phony "lib"
    depend p

  rule $ do
    phony "all"
    depend p
    depend p1

  return ()

main = do
  writeMake (file "Makefile") (project)
  writeMake (file "Makefile.devel") (selfUpdate >> project)


