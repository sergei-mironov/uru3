
module Cake_RespTabs where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Development.Cake3.Utils.Slice
import qualified Cake_URU as URU
import qualified Cake_JQ as JQ
import Cake_RespTabs_P

lib = do
  uwlib (file "lib.urp") $ do
    library JQ.lib
    library URU.lib
    css (file "easy-responsive-tabs.css")
    embed (file "easyResponsiveTabs.js")
    embed (mangled $ file "RespTabs.js")
    ur (file "RespTabs.ur", file "RespTabs.urs")


