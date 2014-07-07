module Cakefile where

import Development.Cake3
import Development.Cake3.Ext.UrWeb as C3
import Cakefile_P

instance IsString File where fromString = file

project = do

  prebuild [cmd|urweb -print-cinclude >/dev/null|]

  a <- uwapp "-dbms sqlite" "persona.urp" $ do
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
    library' (externalMake "../Uru/lib.urp")
    debug
    ur (pair "persona.ur")

  rule $ do
    phony "all"
    depend a

  return ()

main = do
  writeMake (file "Makefile") (project)
  writeMake (file "Makefile.devel") (selfUpdate >> project)


