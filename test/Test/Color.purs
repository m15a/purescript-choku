module Test.Color (colorSpec) where

import Prelude (Unit, discard, negate)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Data.Maybe (Maybe(..))

import Choku

colorSpec :: Spec Unit
colorSpec = describe "Chalk.Color" do

  it "is safely made from RGB" do
    mkRGB (-1) 1 1 `shouldEqual` Nothing
    mkRGB 1 256 1 `shouldEqual` Nothing
    mkRGB 1 1 300 `shouldEqual` Nothing
    mkRGB 0 255 255 `shouldEqual` Just (RGB { r: 0, g: 255, b: 255 })

  it "is safely made from Hex" do
    mkHex "@ABC" `shouldEqual` Nothing
    mkHex "ABCD" `shouldEqual` Nothing
    mkHex "#ABC" `shouldEqual` Just (Hex "#ABC")
    mkHex "abCDef" `shouldEqual` Just (Hex "abCDef")

  it "is safely made from ANSI256" do
    mkANSI256 (-1) `shouldEqual` Nothing
    mkANSI256 256 `shouldEqual` Nothing
    mkANSI256 10 `shouldEqual` Just (ANSI256 10)
