module Test.Main (main) where

import Prelude
import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)

import Test.Level0 (level0Spec)
import Test.Level3 (level3Spec)

main :: Effect Unit
main = launchAff_ $ runSpec [ consoleReporter ] do
  level0Spec
  level3Spec
