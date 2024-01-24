module Chalk.Types
  ( Chalk
  , Style
  , SupportsColor
  , Color
  ) where

import Prelude (Unit)

newtype Chalk = Chalk Unit

type Style = Chalk -> Chalk

type SupportsColor =
  { level :: Int
  , hasBasic :: Boolean
  , has256 :: Boolean
  , has16m :: Boolean
  }

data Color
  = RGB { r :: Int, g :: Int, b :: Int }
  | Hex String
  | Ansi256 Int
