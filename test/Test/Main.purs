module Test.Main (main) where

import Prelude
import Effect (Effect)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner.Node (runSpecAndExitProcess)

import Test.Level0 (level0Spec)
import Test.Level1 (level1Spec)
import Test.Level2 (level2Spec)
import Test.Level3 (level3Spec)
import Test.Color (colorSpec)

main :: Effect Unit
main = runSpecAndExitProcess [ consoleReporter ] do
  level0Spec
  level1Spec
  level2Spec
  level3Spec
  colorSpec
