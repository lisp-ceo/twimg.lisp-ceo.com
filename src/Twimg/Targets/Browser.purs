module Twimg.Targets.Browser where

import Prelude
import Effect (Effect)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Twimg.UI.Board as Board

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runUI Board.root unit body
